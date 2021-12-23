package com.gdu.voyage.vo;

import lombok.Data;

@Data
public class Chat {
	private int chatNo;
	private String toMemberNickName;
	private String fromMemberNickName;
	private String createDate;
	private int chatRead;
}
