package com.gdu.voyage.mapper;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.voyage.vo.Admin;
import com.gdu.voyage.vo.AdminAddress;
import com.gdu.voyage.vo.Host;
import com.gdu.voyage.vo.HostAsk;
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
   void updateMember(Member memeber);
   // 멤버 상세보기
   Member selectMemberOne(String memberId);
   // 사업자 신청한 list
   List<HostAsk> selectHostAskList(Map<String, Object> Map);
   // 사업자 신청한 수
   int hostAskTotalCount();
   // 사업자 승인/거절 
   void updateHostAsk(HostAsk hostAsk);
//   // 사업자 신청 상세보기
//   HostAsk selectHostAskOne(int HostAskNo);
   // 승인후 사업자 테이블에 생성
   void insertHost(String memberId, String adminId);
   // 승인후 멤버 레벨 조정
   void updateMemberLv(String memberId);
   //  사업자 List
   List<Host> selectHostList(Map<String, Object> map);
   // 사업자 수
   int hostTotalCount();
}
