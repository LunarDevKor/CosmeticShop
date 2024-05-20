package com.cosmetic.product.vo;

import java.time.LocalDate;
import java.util.List;

import com.cosmetic.common.vo.AtchFileDetailVO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewVO {
	private long rvNo;
	private long prodNo;
	private long accNo;
	private long rvRating;
	private String rvContent;
	private LocalDate rvCreateDate;
	private LocalDate rvEditDate;
	private long fileNo;
	private List<AtchFileDetailVO> atchfileDetList;
	private String skType;
	private String Id;
	private int cnt;
	private int likeCnt;
	
	
	
	
}
