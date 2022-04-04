package org.mvc.mybatis;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mvc.bean.RecipeDTO;

public interface RecipeMapper {

	public List<RecipeDTO> getList(int startRow, int endRow);

	public RecipeDTO read(Long num);

	// 카운트
	public int getArticleCount(@Param("searchWord") String searchWord, @Param("searchCategory") String searchCategory);

	public int getBestCount(@Param("searchWord") String searchWord, @Param("searchCategory") String searchCategory);
	
	public int getSearchCount(@Param("searchRecipe") String searchRecipe);
	
	public int getRecipeCount(@Param("ingredient_meat") String ingredient_meat, @Param("ingredient_vegetable") String ingredient_vegetable,
							  @Param("ingredient_fish") String ingredient_fish, @Param("ingredient_egg") String ingredient_egg,
							  @Param("ingredient_instant") String ingredient_instant, @Param("ingredient_grain") String ingredient_grain,
							  @Param("ingredient_fruit") String ingredient_fruit, @Param("ingredient_nut") String ingredient_nut);
	
	public List<RecipeDTO> getArticles(
			@Param("searchWord") String searchWord,
			@Param("searchCategory") String searchCategory, 
			@Param("startRow") int startRow,
			@Param("endRow") int endRow);
	
	public List<RecipeDTO> getBestList(
			@Param("searchWord") String searchWord,
			@Param("searchCategory") String searchCategory, 
			@Param("startRow") int startRow,
			@Param("endRow") int endRow);
	
	public List<RecipeDTO> getRecipes(@Param("searchRecipe") String searchRecipe, 
			@Param("startRow") int startRow,
			@Param("endRow") int endRow);
	
	public List<RecipeDTO> getRecipeList(@Param("ingredient_meat") String ingredient_meat, 
			@Param("ingredient_vegetable") String ingredient_vegetable,
			@Param("ingredient_fish") String ingredient_fish, @Param("ingredient_egg") String ingredient_egg,
			@Param("ingredient_instant") String ingredient_instant, @Param("ingredient_grain") String ingredient_grain,
			@Param("ingredient_fruit") String ingredient_fruit, @Param("ingredient_nut") String ingredient_nut,
			@Param("startRow") int startRow,
			@Param("endRow") int endRow);
	
	public List<RecipeDTO> getMainList(RecipeDTO RecipeDTO);
	
	public RecipeDTO getArticle(int num);

	public void readcountUpdate(int num);

	public int goodUpdate(int num);
	
	public void updateArticle(RecipeDTO dto);

	public int articleDelete(int num);

	public ArrayList<RecipeDTO> search(String name);

	public int recipeSearch(RecipeDTO dto);

	public List<RecipeDTO> searchArticles(@Param("startRow") int startRow, @Param("endRow") int endRow);

	public int write(RecipeDTO recipeDTO);

	public int imgUpdate(RecipeDTO recipeDTO);

}
