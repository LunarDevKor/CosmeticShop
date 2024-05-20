package com.cosmetic.admin.category.dao;

import java.util.List;

import com.cosmetic.admin.category.vo.CategoryVO;

public interface ICategoryDao {

	List<CategoryVO> getCategoryCodeList();

	int categoryUpate(CategoryVO cateVO);

	int categoryCreate(CategoryVO cateVO);

	int categoryDelete(String commCode);

}
