package com.gdu.voyage.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.gdu.voyage.mapper.ReviewMapper;
import com.gdu.voyage.vo.Review;

@Service
public class ReviewService {
	@Autowired ReviewMapper reviewMapper;

	// [Member] Review 게시판 목록 작성
	/*
	 * public void addAccomReview(Review review) throws Exception { // qnaForm값 디버깅
	 * 코드 log.debug("**********[상훈] ReviewService_ debug" + .toString());
	 */
	public Map<String, Object> getAccomReviewList(String Review, int currentPage, int rowPerPage) {

		Map<String, Object> paraMap = new HashMap<>();
		int beginRow = (currentPage - 1) * rowPerPage;
		
		paraMap.put("beginRow", beginRow);
		paraMap.put("rowPerPage", rowPerPage);

		List<Review> accomReviewList = reviewMapper.selectAccomReviewList(paraMap);
		
		Map<String, Object> returnMap = new HashMap<>();
		
		int lastPage = 0;
		int totalCount = reviewMapper.selectReviewTotalCount(Review);
		
		lastPage = (totalCount / rowPerPage);
		if (totalCount % rowPerPage != 0) {
			lastPage += 1;
		}
		returnMap.put("accomReviewList", accomReviewList);
		returnMap.put("lastPage", lastPage);
		returnMap.put("totalCount", totalCount);
		
		return returnMap;

	}

	// 페이징
	public int[] countPage(int currentPage) {
		int[] num = new int[10];
		int listNum = reviewMapper.selectCountPage();
		listNum = (listNum / 10) + (listNum % 10);
		for (int i = 1; i <= 10; i++) {
			if (currentPage <= 10) {
				num[i - 1] = (currentPage / 10) + i;
			} else {
				if (listNum == ((currentPage / 10) * 10) + i) {
					break;
				}
				num[i - 1] = ((currentPage / 10) * 10) + i;
			}
		}
		return num;
	}
}
