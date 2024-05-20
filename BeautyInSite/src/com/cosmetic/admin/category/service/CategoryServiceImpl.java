package com.cosmetic.admin.category.service;

import java.util.List;

import com.cosmetic.admin.category.dao.CategoryDaoImpl;
import com.cosmetic.admin.category.dao.ICategoryDao;
import com.cosmetic.admin.category.vo.CategoryVO;

public class CategoryServiceImpl implements ICategoryService{
	
	private static ICategoryService instance;

	private CategoryServiceImpl() {
	}

	public static ICategoryService getInstance() {
		if (instance == null)
			instance = new CategoryServiceImpl();
		return instance;
	}
	
	ICategoryDao cateDao = CategoryDaoImpl.getInstance();

	@Override
	public List<CategoryVO> getCategoryCodeList() {
		return cateDao.getCategoryCodeList();
	}

	@Override
	public int categoryUpdate(CategoryVO cateVO) {
		return cateDao.categoryUpate(cateVO);
	}

	@Override
	public int categoryCreate(CategoryVO cateVO) {
		return cateDao.categoryCreate(cateVO);
	}

	@Override
	public int categoryDelete(String commCode) {
		return cateDao.categoryDelete(commCode);
	}
	
	
}
