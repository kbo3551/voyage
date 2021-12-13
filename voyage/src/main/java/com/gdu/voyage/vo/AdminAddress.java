package com.gdu.voyage.vo;

import lombok.Data;

@Data
public class AdminAddress {
	private String adminId;
	private int adminAddressPostalCode;
	private String adminAddressZip;
	private String adminAddressDetail;
}
