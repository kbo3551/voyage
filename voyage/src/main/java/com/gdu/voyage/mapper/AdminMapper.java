package com.gdu.voyage.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.voyage.vo.Admin;
import com.gdu.voyage.vo.AdminAddress;

@Mapper
public interface AdminMapper {
	int selectAdminId(Admin admin);
	void insertAdminAddress(AdminAddress aaddress);
	void insertAdmin(Admin admin);
}