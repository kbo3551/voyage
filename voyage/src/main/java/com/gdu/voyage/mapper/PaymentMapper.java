package com.gdu.voyage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.voyage.vo.AccomPayment;
import com.gdu.voyage.vo.ActivityPayment;

@Mapper
public interface PaymentMapper {
	// 숙소
	
	// 결제 취소
	int cancelAccomPayment(int accomPaymentNo);
	
	// 숙소 결제 상세(예비용)
	AccomPayment selectAccomPaymentOne(int accomPaymentNo);
	// 숙소 결제 목록
	List<AccomPayment> selectAccomPayment(Map<String, Object> map);
	// 페이징을 위한 갯수
	int selectAccomCountPage(String memberId);
	
	
	
	// 체험
	
	// 결제 취소
	int cancelActivityPayment(int activityPaymentNo);
	
	// 상세(예비용)
	ActivityPayment selectActivityPaymentOne(int activityPaymentNo);
	// 체험 결제 목록
	List<ActivityPayment> selectActivityPayment(Map<String, Object> map);
	int selectActivityCountPage(String memberId);
}
