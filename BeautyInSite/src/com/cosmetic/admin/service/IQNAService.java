package com.cosmetic.admin.service;

import java.util.List;
import java.util.Map;

import com.cosmetic.admin.vo.QNAVO;
import com.cosmetic.product.vo.ProdVO;

public interface IQNAService {
	
	int insertQna(QNAVO qnaVO);

	List<Map<String, Object>> qnaList(int i);

	Map<String, Object> qnaDetail(String sbNo);

	Map<String, Object> getAnswer(String sbNo);

	int qnaAnswer(QNAVO qnaVO);
	
	
}
