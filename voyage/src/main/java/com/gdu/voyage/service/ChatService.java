package com.gdu.voyage.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdu.voyage.mapper.ChatMapper;
import com.gdu.voyage.vo.Chat;
import com.gdu.voyage.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class ChatService {
	@Autowired ChatMapper chatMapper;
	
	// [사용자] 나의 채팅 목록 조회 
	public Map<String, Object> getChatListById(Member loginMember) {
		// 받아온 memberId와 memberNickname 디버깅 
		log.debug("☆[지혜]service☆ memberId : " + loginMember.getMemberId());
		log.debug("☆[지혜]service☆ memberNickname : " + loginMember.getMemberNickname());
		
		// 1. 채팅번호와 채팅방 번호를 조회해줌
		List<Chat> chatNumList = chatMapper.selectChatNumListById(loginMember.getMemberId());
		log.debug("☆[지혜]service☆ getChatListById.chatNumList : " + chatNumList);
		// 1-1. 채팅방이 존재 한다면 (null이 아니라면)
		// 리턴값 가공을 위한 선언
		Map<String, Object> returnMap = new HashMap<>();
		List<Chat> chatList = new ArrayList<Chat>();
		if(chatNumList != null) {
			for(Chat c : chatNumList) {
				// 매개변수 가공
				Map<String, Object> paramMap = new HashMap<>();
				
				paramMap.put("chatNo", c.getChatNo());
				paramMap.put("chatRoom", c.getChatRoom());
				paramMap.put("memberNickname", loginMember.getMemberNickname());
				
				// 1-2. 해당 번호를 가지고 있는 채팅을 조회
				Chat chatOne = chatMapper.selectChatListByNo(paramMap);
				// 리턴값 가공 
				chatList.add(chatOne);
			}
			// 리턴값 가공
			returnMap.put("chatList", chatList);
		}
		return returnMap;
	}
	
	// [사용자] 채팅방 접속 시 채팅 내용 조회 및 chatRead = 0으로 수
	public List<Map<String, Object>> getChatgetChatByToMember(Member loginMember, int chatRoom) {
		// 받아온 memberId와 memberNickname 디버깅 
		log.debug("☆[지혜]service☆ memberId : " + loginMember.getMemberId());
		log.debug("☆[지혜]service☆ memberNickname : " + loginMember.getMemberNickname());
		log.debug("☆[지혜]service☆ chatRoom : " + chatRoom);
		
		// 매개변수 가공
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("chatRoom", chatRoom);
		paramMap.put("memberNickname", loginMember.getMemberNickname());
		paramMap.put("memberId", loginMember.getMemberId());
		
		// chatRead 수정 : chatRoom과 자신의 아이디를 사용해 update
		chatMapper.updateChatRead(paramMap);
		
		// 채팅 내용 조회 
		List<Map<String, Object>> chatListByToMember = chatMapper.selectChatByToChatRoom(paramMap);
		log.debug("☆[지혜]service☆ getChatgetChatByToMember.chatListByToMember : " + chatListByToMember);

		return chatListByToMember;
	}
	
	// [사용자] 채팅 보내기
	public void addChat(Chat chat) {
		// 매개변수 디버깅
		log.debug("☆[지혜]service☆ chat : " + chat.toString());
		chatMapper.insertChat(chat);
	}
}
