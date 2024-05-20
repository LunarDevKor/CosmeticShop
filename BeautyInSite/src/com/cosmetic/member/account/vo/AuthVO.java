package com.cosmetic.member.account.vo;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class AuthVO {
	private long accNo;
	private String authNaverid;
	private String authKakaoid;
}
