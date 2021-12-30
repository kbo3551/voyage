package com.gdu.voyage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gdu.voyage.mapper.ChatMapper;
import com.gdu.voyage.service.ChatService;
import com.gdu.voyage.vo.Chat;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ChatController {
	@Autowired ChatService chatService;
	// sessionId로 특정 user에게만 메세지를 보내고자 하는 경우
	@Autowired SimpMessagingTemplate simpMessagingTemplate;
	
	//로그아웃
	@GetMapping("/test")
	public String logout(HttpSession session) {
		log.trace("testPage");
		return "/chat/chat";
	}
	
	// [사용자] STOMP를 이용한 1:1 채팅 처리
	@MessageMapping("/chat/send")
	public void sendMsg(Chat chatMessage) {
		String chatRoom = Integer.toString(chatMessage.getChatRoom());
		log.debug(chatRoom);
		chatService.equals(chatMessage);
		
		// 발행
		simpMessagingTemplate.convertAndSend("/vovoChat/"+chatRoom, chatMessage);
	}
	
	// from 클라이언트 메세지 -> 매개
	// from 서버 메세지 -> 리턴(JSON)
	//@MessageMapping("/fromClient")
	//@SendTo("/fromServer")
	//@ResponseBody
	//public Chat message(Chat formClientMsg) {
	//	log.debug("★★★★★★★★★★ "+formClientMsg.toString());
		//  백앤드단에서 메세지 가공코드 추가
	//	return formClientMsg;
	//}
}
