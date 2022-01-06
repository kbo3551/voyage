package com.gdu.voyage.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AlarmMapper {
	// 쿠폰 발급 시 알림
	int couponInsertAlarm(Map<String, Object> map);
	// 사업자 승인 확인 시 알림
	int hostInsertAlarm(Map<String, Object> map);
	// 숙소 결제 시 알림
	int accomPaymentAlarm(Map<String, Object> map);
	// 숙소 취소&환불 확인 시 알림
	int accomCancelAlarm(Map<String, Object> map);
	// 숙소 결제 시 알림
	int activityPaymentAlarm(Map<String, Object> map);
	// 숙소 취소&환불 확인 시 알림
	int activityCancelAlarm(Map<String, Object> map);
	// qna 답변 알림
	int addAAlarm(Map<String, Object> map);
	// 채팅 도착 시 알림
	int chatInsertAlarm(Map<String, Object> map);
}
