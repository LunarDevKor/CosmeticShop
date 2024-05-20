package com.cosmetic.member.account.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class SkinVO {
	private int skNo;
	private int accNo;
	private String skType;
	private String atopi;
	private String mingam;
	private String scne;
	private String mibaeg;
	private String pigi;
	private String dark;
	private String dry;
	private String juleum;
	private String hongjo;
	private String gagjil;
}
