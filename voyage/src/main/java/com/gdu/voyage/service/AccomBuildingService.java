package com.gdu.voyage.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

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
import com.gdu.voyage.vo.Hashtag;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class AccomBuildingService {
	@Autowired
	private AccomBuildingMapper accomBuildingMapper;
	@Autowired
	private HttpServletRequest request;
	
	// 숙소-건물 입력
	public void addAccomBuilding(AccomBuildingForm accomBuildingForm) {
		// 매개변수 디버깅 //accomBuildingForm  --> 숙소-건물정보 + 이미지 + 시설 + 추천장소 + 해시태그
		log.debug("☆service☆ accomBuildingForm : " + accomBuildingForm.toString());
		
		// 1) 숙소-건물 입력 : accomBuilding 입력
		AccomBuilding accomBuilding = accomBuildingForm.getAccomBuilding();
		accomBuildingMapper.insertAccomBuilding(accomBuilding);
		// 입력시 만들어진 key 값을 리턴 받아야 함 -> 매개변수 accomBuildingNo 값 변경해줌
		// accomBuildingNo = auto increment로 입력된 값
		log.debug("☆service☆ accomBuildingNo : " + accomBuilding.getAccomBuildingNo());
		
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
				log.debug("☆service☆ accomBuildingImage : " + accomBuildingImage);
				
				// 2-1) 테이블에 저장
				accomBuildingMapper.insertAccomBuildingImage(accomBuildingImage);
				
				// 2-2) 이미지 파일을 저장
				String realPath = request.getServletContext().getRealPath("resources/image/accom_building//");
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
		
		// 3) 숙소-건물의 시설 입력 : accomBuildingFacility 입력
		List<AccomBuildingFacility> facilityList = accomBuildingForm.getAccomBuildingFacility();
		if(facilityList != null) {
			for(AccomBuildingFacility f : facilityList) {
				AccomBuildingFacility accomBuildingFacility = new AccomBuildingFacility();
				accomBuildingFacility.setAccomBuildingNo(accomBuilding.getAccomBuildingNo());
				accomBuildingFacility.setAccomBuildingFacilityName(f.getAccomBuildingFacilityName());
				log.debug("☆service☆ accomBuildingFacility : " + accomBuildingFacility);
				
				// 3-1) 테이블에 저장
				accomBuildingMapper.insertAccomBuildingFacility(accomBuildingFacility);
			}
		}
		
		// 4) 숙소-건물의 추천장소 입력
		List<AccomBuildingSpot> spotList = accomBuildingForm.getAccomBuildingSpot();
		if(spotList != null) {
			for(AccomBuildingSpot s : spotList) {
				AccomBuildingSpot accomBuildingSpot = new AccomBuildingSpot();
				accomBuildingSpot.setAccomBuildingNo(accomBuilding.getAccomBuildingNo());
				accomBuildingSpot.setAccomBuildingSpotName(s.getAccomBuildingSpotName());
				accomBuildingSpot.setAccomBuildingSpotCategory(s.getAccomBuildingSpotCategory());
				accomBuildingSpot.setAccomBuildingSpotDescription(s.getAccomBuildingSpotDescription());
				log.debug("☆service☆ accomBuildingSpot : " + accomBuildingSpot);
				
				// 4-1) 테이블에 저장
				accomBuildingMapper.insertAccomBuildingSpot(accomBuildingSpot);
			}
		}
		
		// 5) 숙소-건물의 해시태그 입력
		List<Hashtag> hashtagList = accomBuildingForm.getHashtag();
		if(hashtagList != null) {
			for(Hashtag h : hashtagList) {
				Hashtag hashtag = new Hashtag();
				hashtag.setIdenNo(accomBuilding.getAccomBuildingNo());
				hashtag.setTableName("건물");
				hashtag.setHashtag(h.getHashtag());
				log.debug("☆service☆ hashtag : " + hashtag);
				
				// 5-1) 테이블에 저장
				accomBuildingMapper.insertAccomBuildingHashtag(hashtag);
			}
		}
	}
}