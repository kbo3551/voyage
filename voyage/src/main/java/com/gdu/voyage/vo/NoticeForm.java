package com.gdu.voyage.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class NoticeForm {
	private Notice notice;
	private MultipartFile noticeFile;
}
