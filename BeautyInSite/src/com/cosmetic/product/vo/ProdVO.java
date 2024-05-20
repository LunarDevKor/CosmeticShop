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
public class ProdVO {

	private long prodNo;
	private long brNo;
	private String prodName;
	private long prodPrice;
	private long prodCateNo;
	private String prodContent;
	private LocalDate prodDate;
	private String prodImg;   
	private long fileNo;
	private String commCodeName;
	private long grdAccr;
	private long cartQty;
	private long uid;
	private List<AtchFileDetailVO> atchfileDetList;
	
     
}
