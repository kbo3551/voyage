package com.gdu.voyage.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gdu.voyage.vo.Chat;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ChatController {
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
	
	@GetMapping("chat")
	public String chatMain() {
		log.debug("ChatController 실행");
		return "chat/chatMain";
	}
}
