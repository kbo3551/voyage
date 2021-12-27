package com.gdu.voyage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdu.voyage.mapper.AccomPaymentMapper;
import com.gdu.voyage.mapper.ActivityPaymentMapper;
import com.gdu.voyage.vo.AccomPayment;
import com.gdu.voyage.vo.ActivityPayment;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class PaymentService {
	@Autowired private AccomPaymentMapper accomPaymentMapper;
	@Autowired private ActivityPaymentMapper activityPaymentMapper;
	
	// 체험 주문 상세
	public ActivityPayment selActivityPaymentOne(int activityPaymentNo) {
		return activityPaymentMapper.selectActivityPaymentOne(activityPaymentNo);
	}
	
	// 숙소 주문 상세
	public AccomPayment selectAccomPaymentOne(int accomPaymentNo) {
		return accomPaymentMapper.selectAccomPaymentOne(accomPaymentNo);
	}
	
	// 체험 주문 내역
	public Map<String, Object> selectActivityPayment(int currentPage, int rowPerPage,String memberId) {
		Map<String, Object> paraMap = new HashMap<>();
		int beginRow = (currentPage-1) * rowPerPage;
		
		paraMap.put("beginRow", beginRow);
		paraMap.put("rowPerPage", rowPerPage);
		paraMap.put("memberId", memberId);
		
		log.trace("☆service☆"+paraMap);
		
		List<ActivityPayment> activityPaymentList = activityPaymentMapper.selectActivityPayment(paraMap);
		
		Map<String, Object> returnMap = new HashMap<>();
		
		int lastPage = 0;
		int totalCount = activityPaymentMapper.selectCountPage(memberId);
		
		lastPage = totalCount / rowPerPage;
		
		if(totalCount % rowPerPage !=0) {
			lastPage += 1;
		}
		
		returnMap.put("activityPaymentList", activityPaymentList);
		returnMap.put("lastPage", lastPage);
		returnMap.put("totalCount", totalCount);
		
		log.trace("☆service☆"+returnMap);
		
		return returnMap;
	}
	
	
	// 숙소 주문 내역
	public Map<String, Object> selectAccomPayment(int currentPage, int rowPerPage,String memberId) {
		Map<String, Object> paraMap = new HashMap<>();
		int beginRow = (currentPage-1) * rowPerPage;
		
		paraMap.put("beginRow", beginRow);
		paraMap.put("rowPerPage", rowPerPage);
		paraMap.put("memberId", memberId);
		
		log.trace("☆service☆"+paraMap);
		
		List<AccomPayment> accomPaymentList = accomPaymentMapper.selectAccomPayment(paraMap);
		
		Map<String, Object> returnMap = new HashMap<>();
		
		int lastPage = 0;
		int totalCount = accomPaymentMapper.selectCountPage(memberId);
		
		lastPage = totalCount / rowPerPage;
		
		if(totalCount % rowPerPage !=0) {
			lastPage += 1;
		}
		
		returnMap.put("accomPaymentList", accomPaymentList);
		returnMap.put("lastPage", lastPage);
		returnMap.put("totalCount", totalCount);
		
		log.trace("☆service☆"+returnMap);
		
		return returnMap;
	}
}
