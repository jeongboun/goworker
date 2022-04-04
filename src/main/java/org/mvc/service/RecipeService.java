package org.mvc.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mvc.bean.RecipeDTO;

public interface RecipeService {

	public int recipeWrite(RecipeDTO recipeDTO);

	public int recipeImgUpdate(RecipeDTO recipeDTO);

	public List<RecipeDTO> getList(String searchWord, String searchCategory, int startRow, int endRow);
	
	public List<RecipeDTO> getBestList(String searchWord, String searchCategory, int startRow, int endRow);

	public List<RecipeDTO> getRecipes(String searchRecipe, int startRow, int endRow);

	public List<RecipeDTO> getRecipeList(String ingredient_meat,String ingredient_vegetable,String ingredient_fish,
			String ingredient_egg, String ingredient_instant,String ingredient_grain,String ingredient_fruit,
			String ingredient_nut ,int startRow, int endRow);
	
	public List<RecipeDTO> getMainList(RecipeDTO RecipeDTO);

	public RecipeDTO read(Long num);

	public int count(String searchWord, String searchCategory);
	
	public int getBestCount(String searchWrod, String searchCategory);

	public int getSearchCount(String searchRecipe);

	public int getRecipeCount(String ingredient_meat, String ingredient_vegetable,String ingredient_fish,
			String ingredient_egg, String ingredient_instant,String ingredient_grain,String ingredient_fruit,
			String ingredient_nut);

	public RecipeDTO getArticle(int num);

	public void readcountUpdate(int num);

	public int goodUpdate(int num);

	public void updateArticle(RecipeDTO dto);

	public int articleDelete(int num);

}
