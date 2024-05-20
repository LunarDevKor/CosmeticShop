package com.cosmetic.member.point.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import com.cosmetic.member.account.vo.AccountVO;
import com.cosmetic.member.point.vo.PointVO;
import com.cosmetic.util.MyBatisUtil;

public class PointDaoImpl implements IPointDao {

	SqlSession sql = null;

	private static IPointDao instance = null;

	private PointDaoImpl() {
	}

	public static IPointDao getInstance() {
		if (instance == null)
			instance = new PointDaoImpl();
		return instance;
	}

	@Override
	public List<PointVO> getPointHistory(int accNo) {

		List<PointVO> pointList = null;

		try (SqlSession sql = MyBatisUtil.getInstance()) {
			pointList = sql.selectList("point.getPointHistory", accNo);
		} catch (PersistenceException e) {
			e.printStackTrace();
		}

		return pointList;
	}

	@Override
	public List<AccountVO> pointManage() {
		SqlSession sql = MyBatisUtil.getInstance();
		List<AccountVO> list = null;
		try {
			list = sql.selectList("manage.pointManage");
		} catch (Exception e) {
			e.printStackTrace();
		}finally { 
			sql.close();
		}
		return list;
	}

	@Override
	public int updatePoint(Map<String, Object> map) {
		SqlSession sql = MyBatisUtil.getInstance();
		
		int cnt = 0;
		
		 try {
		        // 첫 번째로 update 작업 수행
		        cnt = sql.update("manage.updatePoint", map);
		        
		        // update 작업이 성공했다면 (cnt > 0), insert 작업 수행
		        if (cnt > 0) {
		            cnt += sql.insert("manage.insertPoint", map); // insert 성공 시 cnt 값을 증가
		        }
		       
		        // update와 insert 모두 성공했을 때만 commit
		        if (cnt > 1) { // 여기서 cnt > 1 조건은 update와 insert 둘 다 성공했음을 의미
		            sql.commit();
		        } else {
		            // update는 성공했지만 insert가 실패했을 경우 롤백
		            sql.rollback();
		        }
		    } catch (Exception e) {
		        sql.rollback(); // 예외 발생 시 롤백
		        e.printStackTrace();
		    } finally {
		        sql.close(); // 세션을 닫음
		    }
		    return cnt; // 성공한 작업의 수를 반환
		}

	@Override
	public int accruePoint(Map<String, Object> map) {
		
		int result = 0;
		
		try (SqlSession sql = MyBatisUtil.getInstance(true)) {

			result = sql.delete("point.accruePoint", map);
			
			if(result > 0) sql.commit();

		} catch (PersistenceException e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
