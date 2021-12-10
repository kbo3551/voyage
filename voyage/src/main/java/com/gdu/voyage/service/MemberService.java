package com.gdu.voyage.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdu.voyage.mapper.MemberMapper;
import com.gdu.voyage.vo.Address;
import com.gdu.voyage.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class MemberService {
	private MemberMapper memberMapper;
	
	// 회원 주소 추가
	public void addMemberAddress(Address address) {
		log.trace(address.toString());
		memberMapper.insertMemberAddress(address);
		return;
	}
	
	public void addMember(Member member) {
		log.trace(member.toString());
		memberMapper.insertMember(member);
		return;
	}

}
