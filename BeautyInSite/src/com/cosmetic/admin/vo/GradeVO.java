package com.cosmetic.admin.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class GradeVO {
	private long grdNo;
	private String grdName;
	private long grdAccr;
	private long grdPrice;
}
