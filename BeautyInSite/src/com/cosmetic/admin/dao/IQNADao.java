package com.cosmetic.admin.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.cosmetic.admin.vo.QNAVO;

public interface IQNADao {

	public int insertQna(QNAVO qnaVO);

	public List<Map<String, Object>> qnaList(int accNo);

	public Map<String, Object> qnaDetail(long sbNo);
	
	public int qnaAnswer(QNAVO qnaVO);

	public Map<String, Object> getAnswer(long sbNo);

}
