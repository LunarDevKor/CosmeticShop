package com.cosmetic.common.vo;



import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class AtchFileDetailVO {
	private long fileDetNo;			//상세파일번호
	private long fileNo;			//파일아이디
	private String filePath;		//파일경로
	private String stFilenm; 		//저장파일명
	private String originFilenm;	//원본파일명
	private String fileExt;			//파일확장자
	private String fileContents;	//파일내용
	private long fileSize;			//파일사이즈

	
	
	
}
