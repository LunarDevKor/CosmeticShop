package com.cosmetic.admin.vo;

import java.time.LocalDate;
import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderVO {
	private long ordNo;
	private long accNo;
	private long ordTotalamt;
	private long ordUserdPoint;
	private long ordShipcost;
	private String ordPaymethod;
	private LocalDateTime ordDate;
	private String refundStatus;
	private String ordReq;
	private String ordStatus;
	private String productName;
	private int totalPrice;
	private int quantity;
	private String userID;
	private String userName;
	private int ProdPrice;
	private int fileNo;
	private String addrOne;
	private String addrTwo;
	private String userTel;
	private String shipNotice;
	private String ordRecpname;
	private String ordRecpaddr;
	private String ordRecptel;
	private String ordShipnotice;
	private int prodNo;
	private String prodImg;
}
