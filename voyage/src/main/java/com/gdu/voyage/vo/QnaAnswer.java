package com.gdu.voyage.vo;

import lombok.Data;

@Data
public class QnaAnswer {
	private int qnaAnswerNo;
	private int qnaNo;
	private String adminId;
	private String answerContent;
	private String createDate;
}
