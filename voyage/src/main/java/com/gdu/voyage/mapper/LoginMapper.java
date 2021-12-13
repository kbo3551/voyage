package com.gdu.voyage.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.voyage.vo.Member;

@Mapper
public interface LoginMapper {
	Member login(Member member);
}
