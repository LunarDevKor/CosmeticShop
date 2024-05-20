package com.cosmetic.product.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.jsp.tagext.TryCatchFinally;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;
import com.cosmetic.util.MyBatisUtil;
import com.cosmetic.admin.dao.MyBatisDao;
import com.cosmetic.common.vo.AtchFileDetailVO;
import com.cosmetic.product.vo.ProdVO;

public class ProdDaoImpl extends MyBatisDao implements IProdDao {

	private static IProdDao instance = null;

	private ProdDaoImpl() {
	}

	public static IProdDao getInstance() {
		if (instance == null)
			instance = new ProdDaoImpl();
		return instance;
	}

	// 상품리스트 출력
	public List<ProdVO> getAllProducts() {

		List<ProdVO> list = new ArrayList<>();

		try {
			SqlSession sql = MyBatisUtil.getInstance(true);
			list = sql.selectList("prod.getAllProducts");

			sql.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}

		return list;

	}
	

	// 상품등록
	public int addProduct(ProdVO pv) {

		int result = 0;

		try (SqlSession sql = MyBatisUtil.getInstance()) {

			result = sql.insert("prod.addProduct", pv);

			if (result > 0)
				sql.commit();

		} catch (PersistenceException e) {
			e.printStackTrace();
		}

		return result;
	}

	// 상품 수정
	@Override
	public int updateProduct(ProdVO pv) {

		SqlSession sqlSession = MyBatisUtil.getInstance();

		int cnt = 0;
		try {
			cnt = sqlSession.update("prod.updateProduct", pv);

			if (cnt > 0) {
				sqlSession.commit();
			}

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return cnt;
	}

	// 상품가져오기
	public ProdVO getproduct(String prodNo) {

		SqlSession sqlSession = MyBatisUtil.getInstance(true);

		ProdVO pv = null;

		try {

			pv = sqlSession.selectOne("prod.getProduct", prodNo);

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return pv;
	}

	@Override
	// 상품삭제하기
	public int deleteProduct(ProdVO pv) {

		SqlSession sqlSession = MyBatisUtil.getInstance();
		int cnt = 0;

		try {

			cnt = sqlSession.delete("prod.deleteProduct", pv);
			if (cnt > 0) {
				sqlSession.commit();
			}
		} catch (PersistenceException ex) {
			ex.printStackTrace();

		} finally {
			sqlSession.close();
		}
		return cnt;
	}

	// 상품여러개 삭제
	public int multiDelete(String[] prod_no) {
		// db계정연결
		try {
//			cnt = SqlSession.
		} catch (Exception e) {
			// TODO: handle exception
		}

		return 0;

	}

/////////////////////////////////////////////////////////////////////
	@Override
	public List<AtchFileDetailVO> fileselectAll() {

		List<AtchFileDetailVO> fileList = new ArrayList<AtchFileDetailVO>();

		SqlSession sqlSession = MyBatisUtil.getInstance(true);

		try {
			fileList = sqlSession.selectList("prod.fileselectAll");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return fileList;
	}

	@Override
	public int getFileDetNo(long fileNo) {
		int fileDetNo = 0;

		SqlSession session = MyBatisUtil.getInstance();

		try {
			fileDetNo = session.selectOne("prod.getFileDetNo", fileNo);
		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return fileDetNo;
	}

	@Override
	public List<Map<String, Object>> prodSearch(Map<String, Object> map) {
		List<Map<String, Object>> list = null;

		SqlSession sql = MyBatisUtil.getInstance();

		try {
			list = sql.selectList("prod.prodSearch", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}

		return list;
	}

	@Override
	public int countList(String search) {
		return selectOne("prod.countList", search);
	}

	@Override
	public List<Map<String, Object>> getBestProducts() {
		List<Map<String, Object>> bestList = new ArrayList<>();
		try {
			SqlSession sql = MyBatisUtil.getInstance(true);
			bestList = sql.selectList("prod.getBestProducts");

			sql.close();
		} catch (Exception e) {

			e.printStackTrace();
		} finally {

		}

		return bestList;
	}

	@Override
	public List<Map<String, Object>> getNewProducts() {

		List<Map<String, Object>> newList = new ArrayList<>();
		try {
			SqlSession sql = MyBatisUtil.getInstance(true);
			newList = sql.selectList("prod.getNewProducts");

			sql.close();
		} catch (Exception e) {

			e.printStackTrace();
		} finally {

		}

		return newList;
	}

	@Override
	public List<Map<String, Object>> cateList(Map<String, Object> map) {
		SqlSession sql = MyBatisUtil.getInstance();

		List<Map<String, Object>> list = null;
		try {
			list = sql.selectList("prod.cateList", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}

		return list;
	}

	@Override
	public int cateCountList(Map<String, Object> map) throws SQLException {
		return selectOne("prod.cateCountList", map);
	}

	@Override
	public List<ProdVO> getProdDetailByOrder(Map<String, Object> map) {

		List<ProdVO> prodList = null;

		try (SqlSession sql = MyBatisUtil.getInstance(true)) {
			prodList = sql.selectList("getProdDetailByOrder", map);

			System.out.println(prodList);
		} catch (PersistenceException e) {
			e.printStackTrace();
		}
		return prodList;
	}

	public List<Map<String, Object>> listSearch(Map<String, Object> searchMap) {
		SqlSession sql = MyBatisUtil.getInstance();
		List<Map<String, Object>> prodSerchList = null;
		try {
			prodSerchList = sql.selectList("prod.listSearch", searchMap);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}

		return prodSerchList;

	}

	@Override
	public List<Map<String, Object>> getNewProducts(long grdNo) {

		List<Map<String, Object>> getNewProducts = null;

		try (SqlSession sql = MyBatisUtil.getInstance()) {
			getNewProducts = sql.selectList("getMainNewProducts", grdNo);

		} catch (PersistenceException e) {
			e.printStackTrace();
		}

		return getNewProducts;
	}

	@Override
	public List<Map<String, Object>> getBestProducts(long grdNo) {

		List<Map<String, Object>> getBestProducts = null;

		try (SqlSession sql = MyBatisUtil.getInstance()) {
			getBestProducts = sql.selectList("getMainBestProducts", grdNo);

		} catch (PersistenceException e) {
			e.printStackTrace();
		}

		return getBestProducts;
	}

	@Override
	public List<Map<String, Object>> AdminProdSearch(Map<String, Object> searchMap) {

		System.out.println("searchMap>>Dao" + searchMap);
		
		SqlSession sql = MyBatisUtil.getInstance();
		List<Map<String, Object>> prodSearchList = null;
		try {
			prodSearchList = sql.selectList("prod.adminProdSearch", searchMap);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			sql.close();
		}

		return prodSearchList;
	}

	@Override
	public int countList() throws SQLException {

		return selectOne("prod.countList");
	}

	 //관리자 상품 리스트 전체  
	@Override
	public List<Map<String, Object>> prodList(Map<String, Object> countMap) throws SQLException {

		return selectList("prod.prodCountList", countMap);
	}

	//검색한 상품 관리 리스트 출력
	@Override
	public int searchCountList(Map<String, Object> searchMap) throws SQLException{
		
		return selectOne("prod.admincountList",searchMap);
	}
}
