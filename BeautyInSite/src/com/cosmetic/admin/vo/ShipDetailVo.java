package com.cosmetic.admin.vo;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ShipDetailVo {
	
	private long shipNo;
	private long ordNo;
	private String recpName;
	private String recpAddr;
	private String recpTel;
	private LocalDate shipStdate;
	private LocalDate shipCpdate;
	private long shipInvoiceno;
	private String shipStatus;
	private String shipNotice;
}
