package com.cosmetic.member.point.vo;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class PointVO {
	private long phNo;
	private long accNo;
	private long pointUsed;
	private String pointType;
	private LocalDateTime updDate;
	private String updContent;
}
