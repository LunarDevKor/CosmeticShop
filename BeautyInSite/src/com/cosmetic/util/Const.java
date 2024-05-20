package com.cosmetic.util;

public enum Const {
	
	NAVER_CLIENT_ID("i0LsxRxT765SUvfAXb99"),
	NAVER_CLIENT_SECRET("bp3bIVT11w"),
	KAKAO_CLIENT_ID("e72e4d0693a0fdc8740e1de284fb4ff0"),
	SUCCESS("SUCCESS"),
	FAILURE("FAILURE"),
	EMAIL_APP_PASS("zrzctxdvsqsebyou"),
	PHONE_API_KEY("d6f0fdf6"),
	PHONE_SECRET_KEY("BPDMsTy2seaZQNcR");
	
	private final String val;
	
	Const(String val) {
		this.val = val;
	}
	
	public String getVal() {
		return val;
	}
}
