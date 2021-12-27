package com.gdu.voyage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.voyage.vo.ActivityPayment;

@Mapper
public interface ActivityPaymentMapper {
	// 상세
	ActivityPayment selectActivityPaymentOne(int activityPaymentNo);
	// 체험 결제 목록
	List<ActivityPayment> selectActivityPayment(Map<String, Object> map);
	int selectCountPage(String memberId);
}
