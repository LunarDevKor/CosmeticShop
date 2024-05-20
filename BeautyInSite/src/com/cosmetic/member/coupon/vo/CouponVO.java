package com.cosmetic.member.coupon.vo;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CouponVO {
	 private int cpNo;
	 private int accNo;
	 private int cpDiscount;
	 private String cpName;
	 private LocalDateTime cpPmtdate;
	 private LocalDateTime cpExpdate;
}
