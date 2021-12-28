package com.gdu.voyage.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.gdu.voyage.service.ChatService;
import com.gdu.voyage.vo.Chat;
import com.gdu.voyage.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class ChatController {
	@Autowired ChatService chatService;
	
	// from 클라이언트 메세지 -> 매개
	// from 서버 메세지 -> 리턴(JSON)
	/*@MessageMapping("/fromClient")
	@SendTo("/fromServer")
	@ResponseBody
	public Chat message(Chat formClientMsg) {
		log.debug("★★★★★★★★★★ "+formClientMsg.toString());
		//  백앤드단에서 메세지 가공코드 추가
		return formClientMsg;
	}*/
	
	/*
	// [사용자] 나의 채팅 목록 조회 
	@GetMapping("/chat")
	public String chatMain(HttpSession session ,Model model) {
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
		// 조회한 채팅 목록을 페이지로 보내줌 
		model.addAttribute("chatList", map.get("chatList"));
		
		return "/chat/chatMain";
	}
	*/
	
	@GetMapping("/chat")
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
}
