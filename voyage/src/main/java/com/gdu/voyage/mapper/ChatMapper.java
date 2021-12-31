package com.gdu.voyage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.voyage.vo.Chat;

@Mapper
public interface ChatMapper {
	// [사용자] 나의 채팅 목록 조회 
	// 1. 채팅번호와 채팅방 번호를 조회
	List<Chat> selectChatNumListById(String memberId);
	// 2. 해당 번호를 가지고 있는 채팅을 조회
	Chat selectChatListByNo(Map<String, Object> map);
	
	// [사용자] 채팅방 접속 시 채팅 내용 조회 
	List<Map<String, Object>> selectChatByToChatRoom(Map<String, Object> map);
}
