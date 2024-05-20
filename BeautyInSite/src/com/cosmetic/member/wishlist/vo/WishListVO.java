package com.cosmetic.member.wishlist.vo;

import java.time.LocalDate;
import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class WishListVO {
	private long accNo;
	private long prodNo;
	private LocalDate wishDate;
}
