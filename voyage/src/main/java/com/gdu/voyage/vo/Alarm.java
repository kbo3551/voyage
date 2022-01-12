package com.gdu.voyage.vo;

import lombok.Data;

@Data
public class Alarm {
	private int alarmNo;
	private String memberId;
	private String alarmContent;
	private int alarmRead;
	private String alarmLink;
	private String createDate;
	private Member member;
}
