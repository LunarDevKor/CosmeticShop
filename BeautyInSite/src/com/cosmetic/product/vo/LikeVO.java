package com.cosmetic.product.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class LikeVO {
	private long likeNo;
	private long accNo;
	private long rvNo;
	private Date likeDate;
}
