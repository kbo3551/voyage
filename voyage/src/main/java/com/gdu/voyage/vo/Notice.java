package com.gdu.voyage.vo;

import lombok.Data;

@Data
public class Notice {
	private int noticeNo;
	private String adminId;
	private String noticeTitle;
	private String noticeContent;
	private String noticeTop;
	private int noticeViewCnt;
	private String createDate;
	private String updateDate;
}
