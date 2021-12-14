package com.gdu.voyage.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.voyage.vo.Admin;
import com.gdu.voyage.vo.AdminAddress;

@Mapper
public interface AdminMapper {
	int selectAdminId(Admin admin);
	// 어드민 회원가입
	void insertAdminAddress(AdminAddress aaddress);
	void insertAdmin(Admin admin);
	// 어드민 회원정보수정
	void updateAdmin(Admin admin);
	// 어드민 주소 변경
	void updateAdminAddress(AdminAddress aaddress);
}