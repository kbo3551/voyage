package com.gdu.voyage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.voyage.vo.Activity;
import com.gdu.voyage.vo.ActivityAddress;
import com.gdu.voyage.vo.ActivityImage;
import com.gdu.voyage.vo.ActivitySpot;
import com.gdu.voyage.vo.Hashtag;
import com.gdu.voyage.vo.SpotAddress;
@Mapper
public interface ActivityMapper {
	// 체험 조회 list
	List<Activity> selectActivityList(int pageNo);
	int selectCountPage();
		
	// 체험 조회 one
	Activity selectActivityOne(int activityNo);
	
	// 승인완료된 체험 목록
	Activity selectAccessActivity(int activityNo);
	
	// 사업자별 체험리스트
	List<Activity> selectActivityListByHost(int hostNo);
	
	// 사업자별 신청 대기중인 체험 리스트
	List<Activity> selectReqActivityListByHost(int hostNo);
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
}
