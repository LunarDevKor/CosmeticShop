package com.cosmetic.admin.dao;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import com.cosmetic.admin.vo.ChartVO;
import com.cosmetic.util.MyBatisUtil;

public class ChartDao {
	private static ChartDao instance;

	private ChartDao() {
	}

	public static ChartDao getInstance() {
		if (instance == null)
			instance = new ChartDao();
		return instance;
	}

	public List<ChartVO> getDailyCharts() {

		List<ChartVO> dailyList = null;

		try (SqlSession sql = MyBatisUtil.getInstance(true)) {
			
			dailyList = sql.selectList("chart.getDailyCharts");

		} catch (PersistenceException e) {
			e.printStackTrace();
		}
		return dailyList;
	}

	public List<ChartVO> getMonthlyCharts() {
		List<ChartVO> monthList = null;

		try (SqlSession sql = MyBatisUtil.getInstance(true)) {
			
			monthList = sql.selectList("chart.getMonthlyCharts");

		} catch (PersistenceException e) {
			e.printStackTrace();
		}
		return monthList;
	}

	public List<ChartVO> getMonthlyBuyer() {
		List<ChartVO> monthList = null;

		try (SqlSession sql = MyBatisUtil.getInstance(true)) {
			
			monthList = sql.selectList("chart.getMonthlyBuyer");

		} catch (PersistenceException e) {
			e.printStackTrace();
		}
		return monthList;
	}
}
