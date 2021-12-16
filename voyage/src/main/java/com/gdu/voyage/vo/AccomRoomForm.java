package com.gdu.voyage.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class AccomRoomForm {
	private AccomRoom accomRoom;
	private List<MultipartFile> accomRoomImage;
	private List<AccomRoomItem> accomRoomItem;
	private List<Hashtag> hashtag;
}
