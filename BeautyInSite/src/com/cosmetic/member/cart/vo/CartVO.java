package com.cosmetic.member.cart.vo;

import java.time.LocalDate;

import com.cosmetic.product.vo.ProdVO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartVO {
	private long cartNo;
	private long accNo;
	private long prodNo;
	private long cartQty;
	private long grdAccr;
	private ProdVO prodVO;
}
