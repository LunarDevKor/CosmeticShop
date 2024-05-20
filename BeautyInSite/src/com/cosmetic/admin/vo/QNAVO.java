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
public class QNAVO {
	private long sbNo;
	private long accNo;
	private long prodNo;
	private String sbTitle;
	private String sbContent;
	private LocalDateTime sbCreateDate;
	private LocalDateTime sbModyDate;
	private String sbPublic;
	private String sbProcessed;
	private long sbCate;
	private long sbAnswer;
	
}
