package com.gdu.voyage.vo;

import lombok.Data;

@Data
public class Admin {
	private String adminId;
	private String adminFirstName;
	private String adminLastName;
	private String adminPhone;
	private String adminEmail;
	private String adminActive;
	private String createDate;
	private String updateDate;
	
	private AdminAddress adminAddress;
}
