package com.gdu.voyage.vo;

import lombok.Data;

@Data
public class MemberAddress {
	private String memberId;
	private int memberAddressPostalCode;
	private String memberAddressZip;
	private String memberAddressDetail;
}
