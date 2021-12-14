package com.gdu.voyage.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.voyage.vo.Member;
import com.gdu.voyage.vo.MemberAddress;

@Mapper
public interface MemberMapper {
	void updateMemberNickname(Member member);
	void updateMember(Member member);
	void updateMemberAddress(MemberAddress mAddress);
	int selectMemberId(Member member);
	int selectMemberNickName(Member member);
	void insertMemberAddress(MemberAddress mAddress);
	void insertMember(Member member);
	void insertCreateId(String memberId);
}
