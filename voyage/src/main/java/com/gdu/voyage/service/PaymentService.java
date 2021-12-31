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
	
	// 최근 한달간 체험 일별 수익
	public List<ActivityPayment> selectActivityProfitByMonthToDate(int hostNo) {
		return paymentMapper.selectActivityProfitByMonthToDate(hostNo);
	}
	
	// 최근 한달간 숙소 일별 수익
	public List<AccomPayment> selectAccomProfitByMonthToDate(int hostNo) {
		return paymentMapper.selectAccomProfitByMonthToDate(hostNo);
	}
	
	// 해당 사업자의 분기별(3개월) 가장 많은 수익을 벌어들인 체험
	public ActivityPayment selectActivityProfitByQuarterly(int hostNo) {
		return paymentMapper.selectActivityProfitByQuarterly(hostNo);
	}
	
	// 해당 사업자의 분기별(3개월) 가장 많은 수익을 벌어들인 숙소
	public AccomPayment selectAccomProfitByQuarterly(int hostNo) {
		return paymentMapper.selectAccomProfitByQuarterly(hostNo);
	}
	
	// 해당 사업자의 체험 월별 총 수익
	public long selectActivityProfitByHostToMonth(int hostNo) {
		return paymentMapper.selectActivityProfitByHost(hostNo, 1);
	}
	
	// 해당 사업자의 체험 총 수익
	public long selectActivityProfitByHost(int hostNo) {
		return paymentMapper.selectActivityProfitByHost(hostNo, null);
	}
	
	// 해당 사업자의 숙소 월별 총 수익
	public long selectAccomProfitByHostToMonth(int hostNo) {
		return paymentMapper.selectAccomProfitByHost(hostNo, 1);
	}
	
	// 해당 사업자의 숙소 총 수익
	public long selectAccomProfitByHost(int hostNo) {
		return paymentMapper.selectAccomProfitByHost(hostNo, null);
	}
	
	// 해당 사업자의 월별 총 수익
	public long selectAllProfitByHostToMonth(int hostNo) {
		return paymentMapper.selectAllProfitByHost(hostNo, 1);
	}
	
	// 해당 사업자의 총 수익
	public long selectAllProfitByHost(int hostNo) {
		return paymentMapper.selectAllProfitByHost(hostNo, null);
	}
	
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
