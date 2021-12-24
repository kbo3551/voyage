package com.gdu.voyage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdu.voyage.mapper.ChatMapper;
import com.gdu.voyage.vo.Chat;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class ChatService {
	@Autowired ChatMapper chatMapper;
	
	// [사용자] 나의 채팅 목록 조회 
	public Map<String, Object> getChatListById(String memberId) {
		// 받아온 memberId를 디버깅 
		log.debug("☆[지혜]service☆ memberId : " + memberId);
		
		// 채팅 목록을 불러옴 
		List<Chat> chatList = chatMapper.selectChatListById(memberId);
		log.debug("☆[지혜]service☆ getChatListById.chatList : " + chatList);
		Map<String,Object> returnMap = new HashMap<>();
		returnMap.put("chatList", chatList);
		
		return returnMap;
	}
}
