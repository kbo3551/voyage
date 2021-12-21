package com.gdu.voyage.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdu.voyage.mapper.AdminMapper;
import com.gdu.voyage.vo.Admin;
import com.gdu.voyage.vo.AdminAddress;
import com.gdu.voyage.vo.Host;
import com.gdu.voyage.vo.HostAsk;
import com.gdu.voyage.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class AdminService {
	@Autowired AdminMapper adminMapper;
	// admin 정보 변경
	public void  updateAdmin(Admin admin) {
		log.debug("☆☆☆[bryeong]AdminService 어드민 정보 변경☆☆☆"+admin);
		adminMapper.updateAdmin(admin);
		return;
	}
	// admin 주소 변경
	public void  updateAdminAddress(AdminAddress aAddress) {
		log.debug("☆☆☆[bryeong]AdminService 어드민 주소 정보 변경☆☆☆"+aAddress);
		adminMapper.updateAdminAddress(aAddress);
		return;
	}
	// admin ID 중복 검사
	public String adminIdCheck(Admin admin) {
		log.debug("☆☆☆[bryeong]AdminService 중복검사☆☆☆"+admin.toString());
		int idCheck = adminMapper.selectAdminId(admin);
		if(idCheck == 1) {
			return "아이디중복";
		}
		return "중복없음";
	}
	// admin 주소 추가
	public void addAdminAddress(AdminAddress aAddress) {
		log.debug("☆☆☆[bryeong]AdminService 주소☆☆☆"+aAddress.toString());
		adminMapper.insertAdminAddress(aAddress);
		return;
	}
	// admin 추가
	public void addAdmin(Admin admin) {
		log.debug("☆☆☆[bryeong]AdminService 어드민 추가☆☆☆");
		adminMapper.insertAdmin(admin);
		return;
	}
	// 회원 목록 상세보기
	public Member getMemberOne(String memberId) {
		log.debug("☆☆☆[bryeong]AdminService 회원목록 상세보기☆☆☆"+memberId);
		return adminMapper.selectMemberOne(memberId);
	}
	// 회원 목록 리스트
	public Map<String, Object> getMemberList(int currentPage, int rowPerPage){
		
		Map<String, Object> paraMap = new HashMap<>();
		int beginRow = (currentPage-1) * rowPerPage;
		
		paraMap.put("beginRow", beginRow);
		paraMap.put("rowPerPage", rowPerPage);
		
		List<Member> memberList = adminMapper.selectMemberList(paraMap);
		
		Map<String, Object> returnMap = new HashMap<>();
		
		int lastPage = 0;
		int totalCount = adminMapper.memberTotalCount();
		
		lastPage = totalCount / rowPerPage;
		
		if(totalCount % rowPerPage !=0) {
			lastPage += 1;
		}
		
		returnMap.put("memberList", memberList);
		returnMap.put("lastPage", lastPage);
		
		return returnMap;
		
	}
	// 회원 등급/상태 수정 
	public void updateMember(Member member) {
		log.debug("☆☆☆[bryeong]AdminService 회원 수정☆☆☆"+member.toString());
		adminMapper.updateMember(member);
		return ;
	}
	// 사업자 신청 목록 리스트
	public Map<String, Object> getHostAskList(int currentPage, int rowPerPage){
		
		Map<String, Object> paraMap = new HashMap<>();
		int beginRow = (currentPage-1) * rowPerPage;
		
		paraMap.put("beginRow", beginRow);
		paraMap.put("rowPerPage", rowPerPage);
		
		List<HostAsk> hostAskList = adminMapper.selectHostAskList(paraMap);
		
		Map<String, Object> returnMap = new HashMap<>();
		
		int lastPage = 0;
		int totalCount = adminMapper.hostAskTotalCount();
	
		lastPage = totalCount / rowPerPage;
		
		if(totalCount % rowPerPage !=0) {
			lastPage += 1;
		}
		
		returnMap.put("hostAskList", hostAskList);
		returnMap.put("lastPage", lastPage);
		return returnMap;
	}
	// 사업자 신청 승인/거부 
	public void updateHostAsk(HostAsk hostAsk) {
		log.debug("☆☆☆[bryeong]AdminService 사업자 등급 수정☆☆☆"+hostAsk.toString());
		adminMapper.updateHostAsk(hostAsk);
	}
	// 승인후 사업자 생성
	public void insertHost(String memberId,String adminId) {
		adminMapper.insertHost(memberId,adminId);
	}
	// 승인후 회원 등급 수정
	public void updateMemberLv(String memberId) {
		log.debug("☆☆☆[bryeong]AdminService 사업자 등급 수정☆☆☆");
		adminMapper.updateMemberLv(memberId);
	}
}