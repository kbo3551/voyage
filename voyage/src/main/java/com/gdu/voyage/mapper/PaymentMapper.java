package com.gdu.voyage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.voyage.vo.AccomPayment;
import com.gdu.voyage.vo.ActivityPayment;

@Mapper
public interface PaymentMapper {
	
	// 숙소+결제 //
	//  해당 사업자의 총 수익, 월별 총수익
	int selectAllProfitByHost(int hostNo, Integer month);
	
	// 숙소 //
	// 결제 취소
	int cancelAccomPayment(int accomPaymentNo);
	// 숙소 결제 상세(예비용)
	AccomPayment selectAccomPaymentOne(int accomPaymentNo);
	// 숙소 결제 목록
	List<AccomPayment> selectAccomPayment(Map<String, Object> map);
	// 페이징을 위한 갯수
	int selectAccomCountPage(String memberId);
	// 해당 사업자의 숙소 총 수익, 월별 총수익
	int selectAccomProfitByHost(int hostNo, Integer month);
	// 해당 사업자의 분기별(3개월) 가장 많은 수익을 벌어들인 숙소
	int selectAccomProfitByQuarterly(int hostNo);
	// 최근 한달간 일별 수익
	int selectAccomProfitByMonthToDate(int hostNo);
	
	
	// 체험 //
	// 결제 취소
	int cancelActivityPayment(int activityPaymentNo);
	// 상세(예비용)
	ActivityPayment selectActivityPaymentOne(int activityPaymentNo);
	// 체험 결제 목록
	List<ActivityPayment> selectActivityPayment(Map<String, Object> map);
	// 페이징을 위한 갯수
	int selectActivityCountPage(String memberId);
	// 해당 사업자의 체험 총 수익, 월별 총수익
	int selectActivityProfitByHost(int hostNo, Integer month);
	// 해당 사업자의 분기별(3개월) 가장 많은 수익을 벌어들인 체험
	int selectActivityProfitByQuarterly(int hostNo);
	// 최근 한달간 일별 수익
	int selectActivityProfitByMonthToDate(int hostNo);
}
