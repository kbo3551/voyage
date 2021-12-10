package com.gdu.voyage.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.voyage.vo.Member;
import com.gdu.voyage.vo.MemberAddress;

@Mapper
public interface MemberMapper {
	int selectMemberId(Member member);
	int selectMemberNickName(Member member);
	void insertMemberAddress(MemberAddress maddress);
	void insertMember(Member member);
}
