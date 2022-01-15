package com.gdu.voyage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdu.voyage.mapper.LoginMapper;
import com.gdu.voyage.vo.Admin;
import com.gdu.voyage.vo.Host;
import com.gdu.voyage.vo.Member;

import lombok.extern.slf4j.Slf4j;


//MemberController에서도 참조
@Service
@Transactional
@Slf4j
public class LoginService {
	@Autowired LoginMapper loginMapper;
	
	public Host hostLogin(String memberId) {
		log.trace("☆service☆"+memberId);
		Host loginHost = loginMapper.hostLogin(memberId);
		return loginHost;
	}
	
	public void updateEnableActive(String memberId) {
		loginMapper.updateEnableActive(memberId);
		return;
	}
	
	public void updateLastLogin(String memberId) {
		loginMapper.updateLastLogin(memberId);
		return;
	}
	
	public int selectBanMember(String memberId) {
		return loginMapper.selectBanMember(memberId);
	}
	
	public int selectDeleteMember(String memberId) {
		return loginMapper.selectDeleteMember(memberId);
	}
	
	public int selectUncertifiedMember(String memberId) {
		return loginMapper.selectUncertifiedMember(memberId);
	}
	
	public String selectMemberEmail(String memberId) {
		return loginMapper.selectMemberEmail(memberId);
	}
	
	public Member login(Member member) {
		log.trace("☆service☆"+member.toString());
		Member loginMember = loginMapper.login(member);
		return loginMember;
	}
	
	public Admin adminLogin(String memberId) {
		log.debug("☆☆☆[bryeong]LoginService_Admin☆☆☆"+memberId);
		Admin loginAdmin = loginMapper.adminLogin(memberId);
		return loginAdmin;
	}
}
