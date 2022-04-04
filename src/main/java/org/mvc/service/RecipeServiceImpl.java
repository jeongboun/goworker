package org.mvc.service;

import java.util.ArrayList;
import java.util.List;

import org.mvc.bean.RecipeDTO;
import org.mvc.mybatis.RecipeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;

@Service
public class RecipeServiceImpl implements RecipeService {

	@Setter(onMethod_ = @Autowired) // lombok 활용 의존성 주입.
	private RecipeMapper mapper;

	@Override
	public int recipeWrite(RecipeDTO recipeDTO) {
		return mapper.write(recipeDTO);
	}

	@Override
	public int recipeImgUpdate(RecipeDTO recipeDTO) {
		return mapper.imgUpdate(recipeDTO);
	}

	@Override
	public List<RecipeDTO> getList(String searchWord, String searchCategory, int startRow, int endRow) {
		// TODO Auto-generated method stub
		return mapper.getArticles(searchWord, searchCategory, startRow, endRow);
	}

	@Override
	public RecipeDTO read(Long num) {
		// TODO Auto-generated method stub
		return mapper.read(num);
	}

	@Override
	public int count(String searchWord,String searchCategory) {
		// TODO Auto-generated method stub
		return mapper.getArticleCount(searchWord,searchCategory);
	}

	@Override
	public RecipeDTO getArticle(int num) {
		// TODO Auto-generated method stub
		return mapper.getArticle(num);
	}

	@Override
	public void readcountUpdate(int num) {
		mapper.readcountUpdate(num);

	}

	@Override
	public void updateArticle(RecipeDTO dto) {
		// TODO Auto-generated method stub
		mapper.updateArticle(dto);
	}

	@Override
	public int articleDelete(int num) {
		// TODO Auto-generated method stub
		return mapper.articleDelete(num);
	}

	@Override
	public int getSearchCount(String searchRecipe) {
		// TODO Auto-generated method stub
		return mapper.getSearchCount(searchRecipe);
	}

	@Override
	public List<RecipeDTO> getRecipes(String searchRecipe, int startRow, int endRow) {
		// TODO Auto-generated method stub
		return mapper.getRecipes(searchRecipe,startRow, endRow);
	}

	@Override
	public int goodUpdate(int num) {
		// TODO Auto-generated method stub
		return mapper.goodUpdate(num);
		
	}

	@Override
	public List<RecipeDTO> getRecipeList(String ingredient_meat, String ingredient_vegetable, String ingredient_fish,
			String ingredient_egg, String ingredient_instant, String ingredient_grain, String ingredient_fruit,
			String ingredient_nut, int startRow, int endRow) {
		// TODO Auto-generated method stub
		return mapper.getRecipeList(ingredient_meat, ingredient_vegetable, ingredient_fish, ingredient_egg, ingredient_instant, ingredient_grain, ingredient_fruit, ingredient_nut, startRow, endRow);
	}

	@Override
	public int getRecipeCount(String ingredient_meat, String ingredient_vegetable, String ingredient_fish,
			String ingredient_egg, String ingredient_instant, String ingredient_grain, String ingredient_fruit,
			String ingredient_nut) {
		// TODO Auto-generated method stub
		return mapper.getRecipeCount(ingredient_meat, ingredient_vegetable, ingredient_fish, ingredient_egg, ingredient_instant, ingredient_grain, ingredient_fruit, ingredient_nut);
	}

	@Override
	public List<RecipeDTO> getBestList(String searchWord, String searchCategory, int startRow, int endRow) {
		// TODO Auto-generated method stub
		return mapper.getBestList(searchWord, searchCategory, startRow, endRow);
	}

	@Override
	public int getBestCount(String searchWrod, String searchCategory) {
		// TODO Auto-generated method stub
		return mapper.getBestCount(searchWrod, searchCategory);
	}

	@Override
	public List<RecipeDTO> getMainList(RecipeDTO RecipeDTO) {
		// TODO Auto-generated method stub
		return mapper.getMainList(RecipeDTO);
	}




}
