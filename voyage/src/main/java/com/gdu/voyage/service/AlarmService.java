package com.gdu.voyage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdu.voyage.mapper.AlarmMapper;
import com.gdu.voyage.vo.Alarm;
import com.gdu.voyage.vo.CouponMember;
import com.gdu.voyage.vo.HostAsk;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class AlarmService {
	@Autowired AlarmMapper alarmMapper;
	
	// 쿠폰 발급 시 알림 
	public void addCouponAlarm(CouponMember couponMember) {
		// 매개변수 디버깅 //couponMember  --> 쿠폰 정보 + 멤버 ID
		log.debug("☆[지혜] AlarmService☆ couponMember : " + couponMember.toString());
		
		// 알림 메세지 가공 
		String alarmContent = "쿠폰이 발급되었습니다 !";
		
		// 알림 링크 가공 
		String alarmLink = "redirect:/member/coupon";
		
		// 매개변수 가공
		Alarm alarm = new Alarm();
		alarm.setMemberId(couponMember.getMemberId());
		alarm.setAlarmContent(alarmContent);
		alarm.setAlarmLink(alarmLink);
		
		// 알림 메세지 추가 
		alarmMapper.insertAlarm(alarm);
		// 알림 메세지 추가 완료 
		log.debug("☆[지혜] AlarmService☆ : 쿠폰 발급 알림 생성");
	}
	
	// 사업자 승인 시 알림
	public void modifyHostAlarm(HostAsk hostAsk) {
		// 매개변수 디버깅 //hostAsk  --> 사업자 신청 데이터
		log.debug("☆[지혜] AlarmService☆ hostAsk : " + hostAsk.toString());
		
		// 알림 메세지 가공 
		String alarmContent = "사업자 등록 승인이 완료되어 등급이 변경되었습니다 ! 상품 등록을 해주세요.";
		
		// 알림 링크 가공 
		String alarmLink = "redirect:/host/hostIndex";
		
		// 매개변수 가공
		Alarm alarm = new Alarm();
		alarm.setMemberId(hostAsk.getMemberId());
		alarm.setAlarmContent(alarmContent);
		alarm.setAlarmLink(alarmLink);
		
		// 알림 메세지 추가 
		alarmMapper.insertAlarm(alarm);
		// 알림 메세지 추가 완료 
		log.debug("☆[지혜] AlarmService☆ : 사업자 승인 알림 생성");
	}
	
	// 사업자 승인거부 시 알림
	public void modifyRejectingHostAlarm(HostAsk hostAsk) {
		// 매개변수 디버깅 //hostAsk  --> 사업자 신청 데이터
		log.debug("☆[지혜] AlarmService☆ hostAsk : " + hostAsk.toString());
		
		// 알림 메세지 가공 
		String alarmContent = "사업자 등록 승인이 거부되었습니다. 재신청 부탁드립니다.";
		
		// 알림 링크 가공 
		String alarmLink = "#";
		
		// 매개변수 가공
		Alarm alarm = new Alarm();
		alarm.setMemberId(hostAsk.getMemberId());
		alarm.setAlarmContent(alarmContent);
		alarm.setAlarmLink(alarmLink);
		
		// 알림 메세지 추가 
		alarmMapper.insertAlarm(alarm);
		// 알림 메세지 추가 완료 
		log.debug("☆[지혜] AlarmService☆ : 사업자 승인 거 알림 생성");
	}
}
