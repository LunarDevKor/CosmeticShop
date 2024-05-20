package com.cosmetic.admin.notice.vo;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class NoticeVO {
	
	private long noticeNo;
	private long accNo;
	private String noticeTitle;
	private String noticeContent;
	private LocalDateTime noticeDate;
}
