package com.cosmetic.admin.category.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class CategoryVO {
	private String parentCode;
	private String codeName;
	private int commCode;
	private String commCodeName;
}
