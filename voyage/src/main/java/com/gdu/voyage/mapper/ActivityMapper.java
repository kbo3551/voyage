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
	
	// 체험 입력 : 체험 정보 + 이미지 + 추천장소 + 해시태그
	int insertActivity(Activity activity);
	int insertActivityImage(ActivityImage activityImage);
	int insertActivityAddress(ActivityAddress activityAddress);
	int insertActivitySpot(ActivitySpot activitySpot);
	int insertActivitySpotAddress(SpotAddress spotAddress);
	int insertActivityHashtag(Hashtag hashtag);
}
