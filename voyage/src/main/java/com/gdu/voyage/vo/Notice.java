package com.gdu.voyage.vo;

import lombok.Data;

@Data
public class Notice {
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private String createDate;
	private String updateDate;
}
