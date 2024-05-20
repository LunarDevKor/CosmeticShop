package com.cosmetic.admin.management.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.cosmetic.admin.dao.MyBatisDao;
import com.cosmetic.admin.vo.BrandVO;
import com.cosmetic.admin.vo.GradeVO;
import com.cosmetic.member.account.vo.AccountVO;
import com.cosmetic.product.vo.ProdVO;
import com.cosmetic.util.MyBatisUtil;

public class ManagementDaoImpl extends MyBatisDao implements IManagementDao {

	private static IManagementDao instance = null;

	private ManagementDaoImpl() {
	}

	public static IManagementDao getInstance() {
		if (instance == null)
			instance = new ManagementDaoImpl();
		return instance;
	}

	

	@Override
	public List<GradeVO> gradeList() {
		SqlSession sql = MyBatisUtil.getInstance(true);
		
		List<GradeVO> list = null;
		
		try {
			list = sql.selectList("manage.gradeList");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sql.close();
		}
		
		return list;
	}

	@Override
	public int gradeUpdate(GradeVO gdv) {
		SqlSession sql = MyBatisUtil.getInstance();
		int cnt = 0;
		try {
			cnt = sql.update("manage.gradeUpdate",gdv);
			if(cnt>0) { 
				sql.commit();
			}
		} catch (Exception e) {
		e.printStackTrace();
		}finally { 
			sql.close();
		}
		return cnt;
	}

	@Override
	public List<Map<String, Object>> listSearch(Map<String, Object> map) {
		SqlSession sql = MyBatisUtil.getInstance();
		List<Map<String, Object>> list = null;
		try {
			list = sql.selectList("manage.listSearch", map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sql.close();
		}
		
		return list;
	}

	@Override
	public int manageUpdate(AccountVO av) {
		SqlSession sql = MyBatisUtil.getInstance(true);
		int cnt = 0;
		try {
			cnt = sql.update("manage.manageUpdate" , av);
			if(cnt>0) { 
				sql.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally { 
			sql.close();
		}
		return cnt;
	}
	@Override
	public int countList() throws SQLException {
		return selectOne("manage.countList");
	}

	@Override
	public AccountVO manageDetail(String accNo) {
		SqlSession sql = MyBatisUtil.getInstance();
		AccountVO av = null; 
		try {
			av = sql.selectOne("manage.manageDetail", accNo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally { 
			sql.close();
		}
		return av;
	}

	@Override
	public List<Map<String, Object>> boardList(Map<String, Object> countMap) throws SQLException {
		return selectList("manage.manageList",countMap);

	}

	@Override
	public int searchCountList(Map<String, Object> searchMap) throws SQLException {
		System.out.println("grdNo 여기까지오냐 ?" + searchMap);
		return selectOne("manage.searchCountList", searchMap);
	}

	@Override
	public List<BrandVO> brandList() {
		SqlSession sql = MyBatisUtil.getInstance();
		List<BrandVO> list = null;
		
		try {
			list = sql.selectList("manage.brandList");
		} catch (Exception e) {
			e.printStackTrace();
		}finally { 
			sql.close();
		}
		return list;
	}

	@Override
	public List<ProdVO> brandDetailList(String brNo) {
		SqlSession sql = MyBatisUtil.getInstance();
		
		List<ProdVO> list = null;
		
		try {
			list= sql.selectList("manage.brandDetailList", brNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally { 
			sql.close();
		}
		return list;
	}

	@Override
	public List<BrandVO> brandsearchList(String search) {
		SqlSession sql = MyBatisUtil.getInstance();
		List<BrandVO> list = null;
		
		try {
			list = sql.selectList("manage.brandsearchList", search);
		} catch (Exception e) {
			e.printStackTrace();
		}finally { 
			sql.close();
		}
		
		return list;
	}

	@Override
	public int brandCountList(String brNo) throws SQLException {
		return selectOne("manage.brandCountList", brNo);
		}

	@Override
	public List<ProdVO> recommendList() {
		SqlSession sql = MyBatisUtil.getInstance();
		List<ProdVO> list = null;
		try {
			list = sql.selectList("manage.recommendList");
		} catch (Exception e) {
			e.printStackTrace();
		}finally { 
			sql.close();
		}
		return list;
	}
	}



