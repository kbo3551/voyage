package com.gdu.voyage.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.gdu.voyage.mapper.AccomRoomMapper;
import com.gdu.voyage.vo.AccomRoom;
import com.gdu.voyage.vo.AccomRoomForm;
import com.gdu.voyage.vo.AccomRoomImage;
import com.gdu.voyage.vo.AccomRoomItem;
import com.gdu.voyage.vo.Hashtag;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class AccomRoomService {
	@Autowired
	private AccomRoomMapper accomRoomMapper;
	
	// 사업자
	// 숙소-객실 입력
	public void addAccomRoom(AccomRoomForm accomRoomForm, String realPath) {
		// 매개변수 디버깅 //accomRoomForm  --> 숙소-객실정보 + 이미지 + 아이템
		log.debug("☆[지혜]service☆ accomRoomForm : " + accomRoomForm.toString());
		
		// 1) 숙소-객실 입력 : accomRoom 입력
		AccomRoom accomRoom = accomRoomForm.getAccomRoom();
		accomRoomMapper.insertAccomRoom(accomRoom);
		// 입력시 만들어진 key 값을 리턴 받아야 함 -> 매개변수 accomRoomNo 값 입력해줌
		// accomRoomNo = auto increment로 입력된 값
		log.debug("☆[지혜]service☆ accomRoomNo : " + accomRoom.getAccomRoomNo());
		
		// 2) 숙소-객실의 이미지 입력 : accomRoomImage 입력
		List<MultipartFile> imageList = accomRoomForm.getAccomRoomImage();
		// 이미지 파일이 업로드 되었다면 (null이 아니라면)
		if(imageList != null) {
			for(MultipartFile i : imageList) {
				AccomRoomImage accomRoomImage = new AccomRoomImage();
				// 입력시 만들어진 key 값을 리턴 받아 온 값 세팅
				accomRoomImage.setAccomRoomNo(accomRoom.getAccomRoomNo());
				// 오리지널 이름 뒤에서 점까지
				String originalFilename = i.getOriginalFilename(); // 원본이름
				int p = originalFilename.lastIndexOf("."); // 마지막 점의 위치
				String ext = originalFilename.substring(p+1);
				// 중복되지 않는 문자이름 생성
				String prename = UUID.randomUUID().toString().replace("-", "");
				String filename = prename;
				
				accomRoomImage.setAccomRoomImageName(filename);
				accomRoomImage.setAccomRoomImageExt(ext);
				accomRoomImage.setAccomRoomImageSize(i.getSize());
				log.debug("☆[지혜]service☆ accomRoomImage : " + accomRoomImage);
				
				// 2-1) 테이블에 저장
				accomRoomMapper.insertAccomRoomImage(accomRoomImage);
				
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
		
		// 3) 숙소-객실의 물품옵션 입력 : accomRoomItem 입력
		List<AccomRoomItem> itemList = accomRoomForm.getAccomRoomItem();
		if(itemList != null) {
			for(AccomRoomItem f : itemList) {
				AccomRoomItem accomRoomItem = new AccomRoomItem();
				accomRoomItem.setAccomRoomNo(accomRoom.getAccomRoomNo());
				accomRoomItem.setAccomRoomItemName(f.getAccomRoomItemName());
				accomRoomItem.setAccomRoomItemQnt(f.getAccomRoomItemQnt());
				accomRoomItem.setAccomRoomItemPrice(f.getAccomRoomItemPrice());
				log.debug("☆[지혜]service☆ accomRoomItem : " + accomRoomItem);
				
				// 3-1) 테이블에 저장
				accomRoomMapper.insertAccomRoomItem(accomRoomItem);
			}
		}
		
		// 4) 숙소-객실의 해시태그 입력
		List<Hashtag> hashtagList = accomRoomForm.getHashtag();
		if(hashtagList != null) {
			for(Hashtag h : hashtagList) {
				Hashtag hashtag = new Hashtag();
				hashtag.setIdenNo(accomRoom.getAccomRoomNo());
				hashtag.setTableName("객실");
				hashtag.setHashtag(h.getHashtag());
				log.debug("☆[지혜]service☆ hashtag : " + hashtag);
				
				// 4-1) 테이블에 저장
				accomRoomMapper.insertAccomRoomHashtag(hashtag);
			}
		}
	}
}
