package com.cosmetic.member.account.vo;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class AccountVO {
	private int accNo;
	private int grdNo;
	private int skNo;
	private String auth = "0";
	private String id;
	private String pw;
	private String name;
	private String gender;
	private String ssn;
	private String email;
	private String tel;
	private String zipCode;
	private String addr1;
	private String addr2;
	private int point;
	private LocalDate regDate;
	private String imgProfile;
}
