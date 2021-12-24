package com.gdu.voyage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.voyage.vo.Chat;

@Mapper
public interface ChatMapper {
	// [사용자] 나의 채팅 목록 조회 
	List<Chat> selectChatListById(String memberId);
}
