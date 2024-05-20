package com.cosmetic.admin.category.dao;

import java.util.List;

import javax.servlet.http.HttpServlet;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import com.cosmetic.admin.category.vo.CategoryVO;
import com.cosmetic.util.MyBatisUtil;

public class CategoryDaoImpl implements ICategoryDao {

	private static ICategoryDao instance;

	private CategoryDaoImpl() {
	}

	public static ICategoryDao getInstance() {
		if (instance == null)
			instance = new CategoryDaoImpl();
		return instance;
	}

	@Override
	public List<CategoryVO> getCategoryCodeList() {

		List<CategoryVO> cateList = null;

		try (SqlSession sql = MyBatisUtil.getInstance(true)) {
			cateList = sql.selectList("category.getCategoryCodeList");
		} catch (PersistenceException e) {
			e.printStackTrace();
		}

		return cateList;
	}

	@Override
	public int categoryUpate(CategoryVO cateVO) {

		int result = 0;

		System.out.println("cate DAO >> " + cateVO);

		try (SqlSession sql = MyBatisUtil.getInstance()) {
			if (cateVO.getCommCode() == 0) {
				result = sql.update("category.categoryUpdate", cateVO);
			} else {
				result = sql.update("category.categoryCommUpdate", cateVO);
			}

			if (result > 0)
				sql.commit();

		} catch (PersistenceException e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public int categoryCreate(CategoryVO cateVO) {

		int result = 0;

		System.out.println(cateVO);

		try (SqlSession sql = MyBatisUtil.getInstance()) {
			result = sql.insert("category.categoryCreate", cateVO);

			if (result > 0)
				sql.commit();

		} catch (PersistenceException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int categoryDelete(String commCode) {

		int result = 0;

		try (SqlSession sql = MyBatisUtil.getInstance()) {

			result = sql.delete("category.categoryDelete", commCode);
			
			if(result > 0) sql.commit();
			
		} catch (PersistenceException e) {
			e.printStackTrace();
		}

		return result;
	}

}
