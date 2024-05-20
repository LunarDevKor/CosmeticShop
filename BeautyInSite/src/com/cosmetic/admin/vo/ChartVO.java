package com.cosmetic.admin.vo;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ChartVO {
	private String purchaseDate;
	private int salesCount;
	private long prodPrice;
	private String name;
	private String imgProfile;
}
