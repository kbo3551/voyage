package com.gdu.voyage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdu.voyage.mapper.AdminMapper;
import com.gdu.voyage.vo.Admin;
import com.gdu.voyage.vo.AdminAddress;

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
}
