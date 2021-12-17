package com.gdu.voyage.mapper;



import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.voyage.vo.Admin;
import com.gdu.voyage.vo.AdminAddress;
import com.gdu.voyage.vo.Member;

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
	// 멤버 회원 수
	int memberTotalCount();
	// 멤버 리스트 출력
	List<Member> selectMemberList(Map<String, Object> map);
	// 멤버 등급수정
	int modifyMemberList(Member memeber);
	// 멤버 상세보기
	Member selectMemberOne(String memberId);
}