package com.cosmetic.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import com.cosmetic.util.MyBatisUtil;

public class MyBatisDao {
	public <T> T selectOne(String statment) {
		
		//세션열기 
		SqlSession sql = MyBatisUtil.getInstance();
		
		T obj = null; 
		
		try {
			obj = sql.selectOne(statment);
		} catch (PersistenceException ex) {
			throw new RuntimeException("데이터 조회작업중 예외발생", ex);
			
		}finally {
			sql.close();
		}
		return obj;
	}
public <T> T selectOne(String string ,String search) {
		
		//세션열기 
		SqlSession sql = MyBatisUtil.getInstance();
		
		T obj = null; 
		
		try {
			obj = sql.selectOne((String) string , search);
		} catch (PersistenceException ex) {
			throw new RuntimeException("데이터 조회작업중 예외발생", ex);
			
		}finally {
			sql.close();
		}
		return obj;
	}

public <T> T selectOne(String string ,Map<String, Object> searchMap) {
	
	//세션열기 
	SqlSession sql = MyBatisUtil.getInstance();
	
	T obj = null; 
	
	try {
		obj = sql.selectOne((String) string , searchMap);
	} catch (PersistenceException ex) {
		throw new RuntimeException("데이터 조회작업중 예외발생", ex);
		
	}finally {
		sql.close();
	}
	return obj;
}
public <T> List<T> selectList(String statement, Object parameter) {
		
		// 세션 열기
		SqlSession session = MyBatisUtil.getInstance();
		
		List<T> list = null;
		
		try {
			
			list = session.selectList(statement, parameter);
			
		}catch(PersistenceException ex) {
			throw new RuntimeException("데이터 목록조회 작업 중 예외발생!!!", ex);
			
		}finally {
			session.close(); // 세션 닫기
		}
		
		return list;
		
	}
}
