package com.gdu.voyage.vo;

import lombok.Data;

@Data
public class Member {
	private String memberId;
	private String memberPw;
	private String memberFirstName;
	private String memberLastName;
	private String memberNickname;
	private String memberPhone;
	private String memberEmail;
	private String memberReg;
	private String memberDescription;
	private int memberLevel;
	private String memberActive;
	private String createDate;
	private String updateDate;
}
