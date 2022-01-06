package com.gdu.voyage.vo;

import lombok.Data;

@Data
public class Report {
	private int reportNo;
	private int idenNo;
	private String table;
	private String memberId;
	private String reportCategory;
	private String createDate;
}
