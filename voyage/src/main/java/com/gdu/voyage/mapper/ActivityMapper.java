package com.gdu.voyage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdu.voyage.vo.Activity;
import com.gdu.voyage.vo.ActivityAddress;
import com.gdu.voyage.vo.ActivityImage;
import com.gdu.voyage.vo.ActivityInterest;
import com.gdu.voyage.vo.ActivitySpot;
import com.gdu.voyage.vo.Hashtag;
import com.gdu.voyage.vo.SpotAddress;
@Mapper
public interface ActivityMapper {
	// 체험 조회 list
	List<Activity> selectActivityList(Map<String, Object> map);
	int selectCountPage(@RequestParam(value = "hostNo" , required = false) Integer hostNo);
		
	// 체험 조회 one
	Activity selectActivityOne(int activityNo);
	
	// 승인완료된 체험 목록
	List<Activity> selectAccessActivity();
	
	// 회원
	// 이미지가 포함된 관심상품 목록
	List<Activity> selectActivityByInterest(Map<String, Object> map);
	//갯수
	int selectInterestedActivityCount(String memberId);
	
	// 관심상품 추가
	void insertActivityByInterest(ActivityInterest activityInterest);
	// 관심상품 중복 방지
	int selectActivityByInterests(ActivityInterest activityInterest);
	// 관심상품 제거
	int deleteActivityByInterest(int ActivityNo, String memberId);
	// 관심상품 확인
	int selectActivityByInterestOne(int ActivityNo, String memberId);
	
	// 사업자별 신청 대기중인 체험 리스트
	List<Activity> selectReqActivityListByHost(Map<String, Object> map);
	//갯수
	int selectReqActivityCountByHost(int hostNo);
		
	// 숙소 공개,승인여부 수정
	int activityUpdate(Activity activity);
		
	// 체험 입력 : 체험 정보 + 이미지 + 추천장소 + 해시태그
	int insertActivity(Activity activity);
	int insertActivityImage(ActivityImage activityImage);
	int insertActivityAddress(ActivityAddress activityAddress);
	int insertActivitySpot(ActivitySpot activitySpot);
	int insertActivitySpotAddress(SpotAddress spotAddress);
	int insertActivityHashtag(Hashtag hashtag);
	
	// 체험 수정 : 체험 정보 + 이미지 + 추천장소
	int updateActivity(Activity activity);
	int updateActivityImage(ActivityImage activityImage);
	int updateActivityAddress(ActivityAddress activityAddress);
	int updateActivitySpot(ActivitySpot activitySpot);
	int updateActivitySpotAddress(SpotAddress spotAddress);
	
	// 해시태그 삭제
	int deleteActivityHashtag(Hashtag hashtag);
	
	// 체험 비공개처리
	int deleteActivity(Activity activity);
	
	// 체험 삭제 요청
	int updateDormantActivity();
}
