package com.gdu.voyage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdu.voyage.mapper.AccomPaymentMapper;
import com.gdu.voyage.vo.AccomPayment;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class PaymentService {
	@Autowired private AccomPaymentMapper accomPaymentMapper;
	
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
