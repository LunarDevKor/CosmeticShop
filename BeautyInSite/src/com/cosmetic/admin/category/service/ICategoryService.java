package com.cosmetic.admin.category.service;

import java.util.List;

import com.cosmetic.admin.category.vo.CategoryVO;

public interface ICategoryService {

	List<CategoryVO> getCategoryCodeList();

	int categoryUpdate(CategoryVO cateVO);

	int categoryCreate(CategoryVO cateVO);

	int categoryDelete(String commCode);

}
