package com.gdu.voyage;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@EnableScheduling
@ServletComponentScan
@SpringBootApplication
@EnableWebSocketMessageBroker
public class VoyageApplication implements WebSocketMessageBrokerConfigurer{

	public static void main(String[] args) {
		SpringApplication.run(VoyageApplication.class, args);
	}
	// 클라이언트가 연결할 수 있도록 맵핑
	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		// SockJS 연결주소 : "/websocket"
		// .withSockJS() : 낮은 버전의 브라우저에서도 적용 가능
		registry.addEndpoint("/websocket").withSockJS();
	}
	
	// 서버가 보내느 메세지를 클라이언트가 받을 수 있도록 맵핑
	@Override
	public void configureMessageBroker(MessageBrokerRegistry registry) {
		// 해당 주소를 구독하고 있는 클라이언트들에게 메세지 전달
		registry.enableSimpleBroker("/fromServer");
	}
}
