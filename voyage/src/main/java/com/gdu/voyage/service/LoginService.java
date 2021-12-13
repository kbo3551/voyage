package com.gdu.voyage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdu.voyage.mapper.LoginMapper;
import com.gdu.voyage.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class LoginService {
	@Autowired LoginMapper loginMapper;
	
	public Member login(Member member) {
		log.trace("☆service☆"+member.toString());
		Member loginMember = loginMapper.login(member);
		return loginMember;
	}
}
