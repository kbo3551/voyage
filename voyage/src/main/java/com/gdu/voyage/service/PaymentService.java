package com.gdu.voyage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdu.voyage.mapper.PaymentMapper;
import com.gdu.voyage.vo.AccomPayment;
import com.gdu.voyage.vo.ActivityPayment;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class PaymentService {
	@Autowired private PaymentMapper paymentMapper;
	
	// 체험 결제 취소
	public int cancelActivityPayment(int activityPaymentNo) {
		return paymentMapper.cancelActivityPayment(activityPaymentNo);
	}
	
	// 숙소 결제 취소
	public int cancelAccomPayment(int accomPaymentNo) {
		return paymentMapper.cancelAccomPayment(accomPaymentNo);
	}
	
	// 체험 주문 상세
	public ActivityPayment selActivityPaymentOne(int activityPaymentNo) {
		return paymentMapper.selectActivityPaymentOne(activityPaymentNo);
	}
	
	// 숙소 주문 상세
	public AccomPayment selectAccomPaymentOne(int accomPaymentNo) {
		return paymentMapper.selectAccomPaymentOne(accomPaymentNo);
	}
	
	// 체험 주문 내역
	public Map<String, Object> selectActivityPayment(int currentPage, int rowPerPage,String memberId) {
		Map<String, Object> paraMap = new HashMap<>();
		int beginRow = (currentPage-1) * rowPerPage;
		
		paraMap.put("beginRow", beginRow);
		paraMap.put("rowPerPage", rowPerPage);
		paraMap.put("memberId", memberId);
		
		log.trace("☆service☆"+paraMap);
		
		List<ActivityPayment> activityPaymentList = paymentMapper.selectActivityPayment(paraMap);
		
		Map<String, Object> returnMap = new HashMap<>();
		
		int lastPage = 0;
		int totalCount = paymentMapper.selectActivityCountPage(memberId);
		
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
		
		List<AccomPayment> accomPaymentList = paymentMapper.selectAccomPayment(paraMap);
		
		Map<String, Object> returnMap = new HashMap<>();
		
		int lastPage = 0;
		int totalCount = paymentMapper.selectAccomCountPage(memberId);
		
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
