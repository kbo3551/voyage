package com.gdu.voyage.vo;

import lombok.Data;

@Data
public class Chat {
	private int chatNo;
	private String toMemberId;
	private String fromMemberId;
	private String chatContent;
	private String createDate;
	private int chatRead;
	private Member member; // Member의 닉네임을 조회하기 위
}
