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
public class OutProductVO {

	private long opNo;
	private long prodNo;
	private long opQty;
	private LocalDate opDate;
	private long opPrice;
}
