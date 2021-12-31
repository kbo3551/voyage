package com.gdu.voyage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdu.voyage.mapper.AccomReviewMapper;
import com.gdu.voyage.mapper.ActivityReviewMapper;
import com.gdu.voyage.vo.ActivityReview;

@Service
public class ActivityReviewService {
	@Autowired ActivityReviewMapper activityReviewMapper;
	
	// 체험 후기 목록
	public Map<String, Object> getActivityReviewList(String Review, int currentPage, int rowPerPage) {

		Map<String, Object> paraMap = new HashMap<>();
		int beginRow = (currentPage - 1) * rowPerPage;
		
		paraMap.put("beginRow", beginRow);
		paraMap.put("rowPerPage", rowPerPage);

		List<ActivityReview> activityReviewList = activityReviewMapper.selectActivityReviewList(paraMap);
		
		Map<String, Object> returnMap = new HashMap<>();
		
		int lastPage = 0;
		int totalCount = activityReviewMapper.selectReviewTotalCount(Review);
		
		lastPage = (totalCount / rowPerPage);
		if (totalCount % rowPerPage != 0) {
			lastPage += 1;
		}
		returnMap.put("activityReviewList", activityReviewList);
		returnMap.put("lastPage", lastPage);
		returnMap.put("totalCount", totalCount);
		
		return returnMap;

	}
	
}
