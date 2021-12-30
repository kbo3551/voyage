package com.gdu.voyage.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.gdu.voyage.service.ChatService;
import com.gdu.voyage.vo.Member;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/voyage")
@Slf4j
@RestController
public class VoyageChatRestController {
	@Autowired ChatService chatService;
	
	// [사용자] 나의 채팅 목록 조회 
	@GetMapping("/chatRoomList")
	@ResponseBody
	public Map<String, Object> getChatList(HttpSession session) {
		log.debug("ChatController 실행");
		
		// memberId와 memberNickname을 알기 위해 세션을 가져옴 
		Member loginMember = (Member) session.getAttribute("loginMember");
		
		//가져온 memberId로 나의 채팅 목록을 조회함 
		String memberId = loginMember.getMemberId();
		String memberNickname = loginMember.getMemberNickname();
		log.debug("★[지혜]controller★ memberId : " + memberId);
		log.debug("★[지혜]controller★ memberNickname : " + memberNickname);
		Map<String, Object> map = chatService.getChatListById(loginMember);
		log.debug("★[지혜]controller★ map" + map);
		
		return map;
	}
	
	// [사용자] 채팅방 접속 시 채팅 내용 조회 
	@GetMapping("/chatRoom")
	@ResponseBody
	public List<Map<String, Object>> getChatByToMember(HttpSession session, int chatRoom) {
		log.debug("ChatController 실행");
		
		// memberId와 memberNickname을 알기 위해 세션을 가져옴 
		Member loginMember = (Member) session.getAttribute("loginMember");
		
		// 받아온 login 세션 정보와 채팅방 번호로 채팅 내용을 조회함
		List<Map<String, Object>> map = chatService.getChatgetChatByToMember(loginMember, chatRoom);
		log.debug("★[지혜]controller★ map" + map);
		
		return map;
	}
}