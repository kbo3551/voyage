package com.gdu.voyage.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.gdu.voyage.mapper.AccomBuildingMapper;
import com.gdu.voyage.vo.AccomBuilding;
import com.gdu.voyage.vo.AccomBuildingFacility;
import com.gdu.voyage.vo.AccomBuildingForm;
import com.gdu.voyage.vo.AccomBuildingImage;
import com.gdu.voyage.vo.AccomBuildingSpot;
import com.gdu.voyage.vo.AccomSpotForm;
import com.gdu.voyage.vo.Hashtag;
import com.gdu.voyage.vo.AccomAddress;
import com.gdu.voyage.vo.SpotAddress;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class AccomBuildingService {
	@Autowired
	private AccomBuildingMapper accomBuildingMapper;
	
	// 숙소 등록 목록 조회
		public List<AccomBuilding> getAccomBuildingList(int pageNo) {
			pageNo = (pageNo - 1) * 10;
			log.debug(accomBuildingMapper.selectAccomBuildingList(pageNo) + "***********[상훈] accomBuildingService");
			return accomBuildingMapper.selectAccomBuildingList(pageNo);
		}
	// 숙소 등록 목록 상세 조회 One
		public AccomBuilding getAccomBuildingOne(int accomBuildingNo) {
			log.debug(accomBuildingMapper.selectAccomBuildingOne(accomBuildingNo) + "***********[상훈] accomBuildingService One");
			return accomBuildingMapper.selectAccomBuildingOne(accomBuildingNo);
		}
	
	// 숙소 공개, 승인여부 수정
		public AccomBuilding accomBuildingUpdate(AccomBuilding accomBuilding) {
			log.debug(accomBuilding.toString() + "********[상훈] AccomBuildingUpdate debug");
			accomBuildingMapper.accomBuildingUpdate(accomBuilding);
			return accomBuilding;
		}
	
	// 숙소-건물 입력
	public void addAccomBuilding(AccomBuildingForm accomBuildingForm, String realPath) {
		// 매개변수 디버깅 //accomBuildingForm  --> 숙소-건물정보 + 이미지 + 시설 + 추천장소 + 해시태그
		log.debug("☆[지혜]service☆ accomBuildingForm : " + accomBuildingForm.toString());
		
		// 1) 숙소-건물 입력 : accomBuilding 입력
		AccomBuilding accomBuilding = accomBuildingForm.getAccomBuilding();
		accomBuildingMapper.insertAccomBuilding(accomBuilding);
		// 입력시 만들어진 key 값을 리턴 받아야 함 -> 매개변수 accomBuildingNo 값 입력해줌
		// accomBuildingNo = auto increment로 입력된 값
		log.debug("☆[지혜]service☆ accomBuildingNo : " + accomBuilding.getAccomBuildingNo());
		
		// 2) 숙소-건물의 이미지 입력 : accomBuildingImage 입력
		List<MultipartFile> imageList = accomBuildingForm.getAccomBuildingImage();
		// 이미지 파일이 업로드 되었다면 (null이 아니라면)
		if(imageList != null) {
			for(MultipartFile i : imageList) {
				AccomBuildingImage accomBuildingImage = new AccomBuildingImage();
				// 입력시 만들어진 key 값을 리턴 받아 온 값 세팅
				accomBuildingImage.setAccomBuildingNo(accomBuilding.getAccomBuildingNo());
				// 오리지널 이름 뒤에서 점까지
				String originalFilename = i.getOriginalFilename(); // 원본이름
				int p = originalFilename.lastIndexOf("."); // 마지막 점의 위치
				String ext = originalFilename.substring(p+1);
				// 중복되지 않는 문자이름 생성
				String prename = UUID.randomUUID().toString().replace("-", "");
				String filename = prename;
				
				accomBuildingImage.setAccomBuildingImageName(filename);
				accomBuildingImage.setAccomBuildingImageExt(ext);
				accomBuildingImage.setAccomBuildingImageSize(i.getSize());
				log.debug("☆[지혜]service☆ accomBuildingImage : " + accomBuildingImage);
				
				// 2-1) 테이블에 저장
				accomBuildingMapper.insertAccomBuildingImage(accomBuildingImage);
				
				// 2-2) 이미지 파일을 저장
				File f = new File(realPath+filename+"."+ext);
				try {
					i.transferTo(f);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
					// IllegalStateException | IOException e 예외처리를 무조건 해야하는 예외
					// RuntimeException은 예외처리를 하지 않아도 됨
					throw new RuntimeException();
				}
			}
		}
		
		// 3) 숙소-건물의 주소 입력 : accomAddress 입력
		AccomAddress accomAddress = accomBuildingForm.getAccomAddress();
		accomAddress.setAccomBuildingNo(accomBuilding.getAccomBuildingNo());
		log.debug("☆[지혜]service☆ accomAddress : " + accomAddress);
		// 3-1) 테이블에 저장
		accomBuildingMapper.insertAccomBuildingAddress(accomAddress);
		
		// 4) 숙소-건물의 시설 입력 : accomBuildingFacility 입력
		List<AccomBuildingFacility> facilityList = accomBuildingForm.getAccomBuildingFacility();
		if(facilityList != null) {
			for(AccomBuildingFacility f : facilityList) {
				AccomBuildingFacility accomBuildingFacility = new AccomBuildingFacility();
				accomBuildingFacility.setAccomBuildingNo(accomBuilding.getAccomBuildingNo());
				accomBuildingFacility.setAccomBuildingFacilityName(f.getAccomBuildingFacilityName());
				log.debug("☆[지혜]service☆ accomBuildingFacility : " + accomBuildingFacility);
				
				// 4-1) 테이블에 저장
				accomBuildingMapper.insertAccomBuildingFacility(accomBuildingFacility);
			}
		}
		
		// 5) 숙소-건물의 추천장소 입력
		// accomSpotForm으로 숙소-건물의 추천장소와 주소 리스트도 같이 불러와 저장한다
		List<AccomSpotForm> spotList = accomBuildingForm.getAccomSpotForm();
		if(spotList != null) {
			for(AccomSpotForm s : spotList) {
				AccomBuildingSpot accomBuildingSpot = new AccomBuildingSpot();
				accomBuildingSpot.setAccomBuildingNo(accomBuilding.getAccomBuildingNo());
				accomBuildingSpot.setAccomBuildingSpotName(s.getAccomBuildingSpot().getAccomBuildingSpotName());
				accomBuildingSpot.setAccomBuildingSpotCategory(s.getAccomBuildingSpot().getAccomBuildingSpotCategory());
				accomBuildingSpot.setAccomBuildingSpotDescription(s.getAccomBuildingSpot().getAccomBuildingSpotDescription());
				log.debug("☆[지혜]service☆ accomBuildingSpot : " + accomBuildingSpot);
			
				// 5-1) 테이블에 저장
				accomBuildingMapper.insertAccomBuildingSpot(accomBuildingSpot);
				
				// 5-2)
				// 입력시 만들어진 key 값을 리턴 받아야 함 -> 매개변수 accomBuildingSpotNo 값 입력해줌
				// accomBuildingSpotNo = auto increment로 입력된 값
				log.debug("☆[지혜]service☆ accomBuildingSpotNo : " + accomBuildingSpot.getAccomBuildingSpotNo());
				SpotAddress spotAddress = new SpotAddress();
				spotAddress.setSpotNo(accomBuildingSpot.getAccomBuildingSpotNo());
				spotAddress.setSpotAddressPotalCode(s.getSpotAddress().getSpotAddressPotalCode());
				spotAddress.setSpotAddressZip(s.getSpotAddress().getSpotAddressZip());
				spotAddress.setSpotAddressDetail(s.getSpotAddress().getSpotAddressDetail());
				log.debug("☆[지혜]service☆ spotAddress : " + spotAddress);
				
				// 5-3) 테이블에 저장
				accomBuildingMapper.insertAccomSpotAddress(spotAddress);
			}
		}
		
		/*
		// 5) 숙소-건물의 추천장소 입력
		// 숙소-건물의 추천장소와 주소 리스트도 같이 불러와 저장한다
		List<AccomBuildingSpot> spotList = accomBuildingForm.getAccomBuildingSpot();
		List<SpotAddress> spotAddressList = accomBuildingForm.getSpotAddress();
		if(spotList != null) {
			for(AccomBuildingSpot s : spotList) {
				AccomBuildingSpot accomBuildingSpot = new AccomBuildingSpot();
				accomBuildingSpot.setAccomBuildingNo(accomBuilding.getAccomBuildingNo());
				accomBuildingSpot.setAccomBuildingSpotName(s.getAccomBuildingSpotName());
				accomBuildingSpot.setAccomBuildingSpotCategory(s.getAccomBuildingSpotCategory());
				accomBuildingSpot.setAccomBuildingSpotDescription(s.getAccomBuildingSpotDescription());
				log.debug("☆[지혜]service☆ accomBuildingSpot : " + accomBuildingSpot);
			
				// 5-1) 테이블에 저장
				accomBuildingMapper.insertAccomBuildingSpot(accomBuildingSpot);
				
				// 5-2)
				// 입력시 만들어진 key 값을 리턴 받아야 함 -> 매개변수 accomBuildingSpotNo 값 입력해줌
				// accomBuildingSpotNo = auto increment로 입력된 값
				log.debug("☆[지혜]service☆ accomBuildingSpotNo : " + accomBuildingSpot.getAccomBuildingSpotNo());
				
				for(SpotAddress sa : spotAddressList) {
					SpotAddress spotAddress = new SpotAddress();
					spotAddress.setSpotNo(accomBuildingSpot.getAccomBuildingSpotNo());
					spotAddress.setSpotAddressPotalCode(sa.getSpotAddressPotalCode());
					spotAddress.setSpotAddressZip(sa.getSpotAddressZip());
					spotAddress.setSpotAddressDetail(sa.getSpotAddressDetail());
					log.debug("☆[지혜]service☆ spotAddress : " + spotAddress);
					
					// 5-3) 테이블에 저장
					// 저장이 완료되면 break
					accomBuildingMapper.insertAccomSpotAddress(spotAddress);
				}
			}
		}
		*/
		
		// 6) 숙소-건물의 해시태그 입력
		List<Hashtag> hashtagList = accomBuildingForm.getHashtag();
		if(hashtagList != null) {
			for(Hashtag h : hashtagList) {
				Hashtag hashtag = new Hashtag();
				hashtag.setIdenNo(accomBuilding.getAccomBuildingNo());
				hashtag.setTableName("건물");
				hashtag.setHashtag(h.getHashtag());
				log.debug("☆[지혜]service☆ hashtag : " + hashtag);
				
				// 6-1) 테이블에 저장
				accomBuildingMapper.insertAccomBuildingHashtag(hashtag);
			}
		}
	}

	// 페이징
	public int[] countPage(int currentPage) {
		int[] num = new int[10];
		int listNum = accomBuildingMapper.selectCountPage();
		listNum = (listNum / 10) + (listNum % 10);
		for(int i=1; i<=10; i++) {
			if(currentPage <= 10) {
				num[i-1] = (currentPage / 10) + i;
			} else {
				if(listNum == ((currentPage / 10) * 10) + i) {
					break;
				}
				num[i-1] = ((currentPage / 10) * 10) + i;
			}
		}
		return num;
	}
}