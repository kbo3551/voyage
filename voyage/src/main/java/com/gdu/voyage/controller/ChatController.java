package com.gdu.voyage.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import com.gdu.voyage.service.ChatService;
import com.gdu.voyage.vo.Chat;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ChatController {
	@Autowired ChatService chatService;
	// sessionId로 특정 user에게만 메세지를 보내고자 하는 경우
	@Autowired SimpMessagingTemplate simpMessagingTemplate;
	
	// 배너 페이지
	//@GetMapping("/banner")
    //public String getBanner() {
    //   return "partial/banner";
	//}
	
	// [사용자] STOMP를 이용한 1:1 채팅 처리
	@MessageMapping("/vovoChat")
	@SendTo("/vovoChatServer")
	public Chat chat(Chat vovoChatMsg) {
		log.debug("★[지혜]controller★ vovoChatMsg : " + vovoChatMsg.toString());
		
		// chat 내용 DB에 저장 
		chatService.addChat(vovoChatMsg);
		
		// 발행, 백엔드단에서 메세지 가공코드 추가 
		return vovoChatMsg;
	}
	
	//@MessageMapping("/chat")  //메시지 처리 
	//public void chat(ChatMessage chatMessage) {
	//	int id = chatMessageMapper.selectCount();
	//	chatMessageMapper.insertChatMessage(id+1,chatMessage.getChatMessage_type().toString(),
	//			chatMessage.getChatMessage_writer(), chatMessage.getChatMessage_message(), 
	//			chatMessage.getIdChatRoom());
	//	template.convertAndSend("/topic/chat/"+chatMessage.getIdChatRoom() , chatMessage); //발행 
	//}
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
