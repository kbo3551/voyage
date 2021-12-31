package com.gdu.voyage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdu.voyage.mapper.HostMapper;
import com.gdu.voyage.vo.HostAsk;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class HostService {
	@Autowired private HostMapper hostMapper;
	
	// 사업자 신청
	public void insertRequestHost(HostAsk hostAsk) {
		log.trace("☆service☆ : "+hostAsk);
		hostMapper.insertRequestHost(hostAsk);
		return;
	}
	
	// 사업자 승인대기중인 값이 있는지 확인
	public int selectRequestingHost(String memberId) {
		return hostMapper.selectRequestingHost(memberId);
	}
	
	// [사업자] 상품 등록시 host_no 검색
	public int selectHostNo(String memberId) {
		// 받아온 memberId 디버깅 
		log.debug("☆[지혜]service☆ memberId : " + memberId);
		 
		// 받아온 memberId로 hostNo 조회
		int hostNo = hostMapper.selectHostNo(memberId);
		return hostNo;
	}
}
