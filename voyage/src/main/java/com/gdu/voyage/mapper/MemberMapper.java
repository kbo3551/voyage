package com.gdu.voyage.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.voyage.vo.Address;
import com.gdu.voyage.vo.Member;

@Mapper
public interface MemberMapper {
	void insertMemberAddress(Address address);
	void insertMember(Member member);
}
