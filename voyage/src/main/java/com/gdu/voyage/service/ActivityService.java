package com.gdu.voyage.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.gdu.voyage.mapper.ActivityMapper;
import com.gdu.voyage.vo.Activity;
import com.gdu.voyage.vo.ActivityAddress;
import com.gdu.voyage.vo.ActivityForm;
import com.gdu.voyage.vo.ActivityImage;
import com.gdu.voyage.vo.ActivitySpot;
import com.gdu.voyage.vo.ActivitySpotForm;
import com.gdu.voyage.vo.Hashtag;
import com.gdu.voyage.vo.SpotAddress;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class ActivityService {
	@Autowired
	private ActivityMapper activityMapper;
	
	// 사업자별 신청중 체험 갯수
	public int selectReqActivityCountByHost(int hostNo) {
		return activityMapper.selectReqActivityCountByHost(hostNo);
	}
	
	// 사업자별 신청중인 체험 조회
	public List<Activity> selectReqActivityListByHost(int hostNo) {
		return activityMapper.selectReqActivityListByHost(hostNo);
	}
	
	// 사업자별 체험 조회
	public List<Activity> selectActivityListByHost(int hostNo) {
		return activityMapper.selectActivityListByHost(hostNo);
	}

	// 숙소 등록 목록 조회
	public Map<String, Object> getActivityList(int currentPage, int rowPerPage) {
		
		Map<String, Object> paraMap = new HashMap<>();
		int beginRow = (currentPage-1) * rowPerPage;
		
		paraMap.put("beginRow", beginRow);
		paraMap.put("rowPerPage", rowPerPage);
		
		List<Activity> activityList = activityMapper.selectActivityList(paraMap);
		
		Map<String, Object> returnMap = new HashMap<>();
		
		int lastPage = 0;
		int totalCount = activityMapper.selectCountPage();
		
		lastPage = totalCount / rowPerPage;
		
		if(totalCount % rowPerPage !=0) {
			lastPage += 1;
		}
		
		returnMap.put("activityList", activityList);
		returnMap.put("lastPage", lastPage);
		
		return returnMap;
		
	}
	// 체험 등록 목록 상세 조회 One
	public Activity getActivityOne(int activityNo) {
		log.debug(activityMapper.selectActivityOne(activityNo) + "***********[상훈] activityService One");
		return activityMapper.selectActivityOne(activityNo);
	}
	
	// 체험 공개, 승인여부 수정
	public Activity activityUpdate(Activity activity) {
		log.debug(activity.toString() + "********[상훈] ActivityUpdate debug");
		activityMapper.activityUpdate(activity);
		return activity;
	}
	
	// 승인완료된 체험 목록 조회 list
	public List<Activity> selectAccessActivity() {
		log.debug(activityMapper.selectAccessActivity() + "***********[상훈] activityService Access");
		return activityMapper.selectAccessActivity();
	}
	
	// 체험 입력
	public void addActivity(ActivityForm activityForm, String realPath) {
		// 매개변수 디버깅 //activityForm  --> 숙소-건물정보 + 이미지 + 시설 + 추천장소 + 해시태그
		log.debug("☆[지혜]service☆ activityForm : " + activityForm.toString());
		
		// 1) 체험 입력 : activity 입력
		Activity activity = activityForm.getActivity();
		activityMapper.insertActivity(activity);
		// 입력시 만들어진 key 값을 리턴 받아야 함 -> 매개변수 activityNo 값 입력해줌
		// activityNo = auto increment로 입력된 값
		log.debug("☆[지혜]service☆ activityNo : " + activity.getActivityNo());
		
		// 2) 체험의 이미지 입력 : activityImage 입력
		List<MultipartFile> imageList = activityForm.getActivityImage();
		// 이미지 파일이 업로드 되었다면 (null이 아니라면)
		if(imageList != null) {
			for(MultipartFile i : imageList) {
				ActivityImage activityImage = new ActivityImage();
				// 입력시 만들어진 key 값을 리턴 받아 온 값 세팅
				activityImage.setActivityNo(activity.getActivityNo());
				// 오리지널 이름 뒤에서 점까지
				String originalFilename = i.getOriginalFilename(); // 원본이름
				int p = originalFilename.lastIndexOf("."); // 마지막 점의 위치
				String ext = originalFilename.substring(p+1);
				// 중복되지 않는 문자이름 생성
				String prename = UUID.randomUUID().toString().replace("-", "");
				String filename = prename;
				
				activityImage.setActivityImageName(filename);
				activityImage.setActivityImageExt(ext);
				activityImage.setActivityImageSize(i.getSize());
				log.debug("☆[지혜]service☆ activityImage : " + activityImage);
								
				// 2-1) 테이블에 저장
				activityMapper.insertActivityImage(activityImage);
				
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
		
		// 3) 체험의 주소 입력 : activityAddress 입력
		ActivityAddress activityAddress = activityForm.getActivityAddress();
		activityAddress.setActivityNo(activity.getActivityNo());
		log.debug("☆[지혜]service☆ activityAddress : " + activityAddress);
		// 3-1) 테이블에 저장
		activityMapper.insertActivityAddress(activityAddress);
		
		// 4) 체험의 추천장소 입력
		// activitySpotForm으로 체험의 추천장소와 주소 리스트도 같이 불러와 저장한다
		List<ActivitySpotForm> spotList = activityForm.getActivitySpotForm();
		if(spotList != null) {
			for(ActivitySpotForm s : spotList) {
				ActivitySpot activitySpot = new ActivitySpot();
				activitySpot.setActivityNo(activity.getActivityNo());
				activitySpot.setActivitySpotName(s.getActivitySpot().getActivitySpotName());
				activitySpot.setActivitySpotCategory(s.getActivitySpot().getActivitySpotCategory());
				activitySpot.setActivitySpotDescription(s.getActivitySpot().getActivitySpotDescription());
				log.debug("☆[지혜]service☆ activitySpot : " + activitySpot);
			
				// 4-1) 테이블에 저장
				activityMapper.insertActivitySpot(activitySpot);
				
				// 4-2)
				// 입력시 만들어진 key 값을 리턴 받아야 함 -> 매개변수 activitySpotNo 값 입력해줌
				// activitySpotNo = auto increment로 입력된 값
				log.debug("☆[지혜]service☆ activitySpotNo : " + activitySpot.getActivitySpotNo());
				SpotAddress spotAddress = new SpotAddress();
				spotAddress.setSpotNo(activitySpot.getActivitySpotNo());
				spotAddress.setSpotAddressPotalCode(s.getSpotAddress().getSpotAddressPotalCode());
				spotAddress.setSpotAddressZip(s.getSpotAddress().getSpotAddressZip());
				spotAddress.setSpotAddressDetail(s.getSpotAddress().getSpotAddressDetail());
				log.debug("☆[지혜]service☆ spotAddress : " + spotAddress);
				
				// 4-3) 테이블에 저장
				activityMapper.insertActivitySpotAddress(spotAddress);
			}
		}
		
		// 5) 체험의 해시태그 입력
		List<Hashtag> hashtagList = activityForm.getHashtag();
		if(hashtagList != null) {
			for(Hashtag h : hashtagList) {
				Hashtag hashtag = new Hashtag();
				hashtag.setIdenNo(activity.getActivityNo());
				hashtag.setTableName("체험");
				hashtag.setHashtag(h.getHashtag());
				log.debug("☆[지혜]service☆ hashtag : " + hashtag);
				
				// 5-1) 테이블에 저장
				activityMapper.insertActivityHashtag(hashtag);
			}
		}
	}
}
