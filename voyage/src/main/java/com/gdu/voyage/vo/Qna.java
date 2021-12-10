package com.gdu.voyage.vo;

import java.util.List;

import lombok.Data;

@Data
public class Qna {
	private int qnaNo;
	private String memberNickname;
	private String qnaCategory;
	private String qnaTitle;
	private String qnaContent;
	private String qnaSecret;
	private String updateDate;
	private String createDate;
	private List<QnaImg> qnaImg;
}
