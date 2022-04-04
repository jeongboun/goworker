package org.mvc.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.mvc.bean.RecipeDTO;
import org.mvc.service.RecipeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

import org.springframework.core.env.Environment;
import org.springframework.expression.ParseException;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

@Controller

@Slf4j
@Log4j
@RequestMapping("/recipe/")
public class RecipeController{
	
	@Autowired
    private static int count=0;
	
	@Autowired
	private RecipeService service;

	@RequestMapping("write")
	public String write() {
		log.info("레시피 작성");
		return "recipe/recipeWrite";
	}

	@RequestMapping("writePro")
	public String writePro(RecipeDTO recipeDTO, Model model, MultipartFile save) {
		model.addAttribute("result", service.recipeWrite(recipeDTO));
		String ftype=save.getContentType().split("/")[0];
		String orgName =save.getOriginalFilename();
		if(ftype.equals("image")) {
			File folder = new File("d://fileSave//");
			String [] list = folder.list();
			for(String fileName : list) {
				if(fileName.equals(orgName)) {
					orgName = (++count)+orgName;
				}
			}
			File f = new File("d://fileSave//"+orgName);
			try {
				save.transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();
			}
			recipeDTO.setImage(orgName);
			service.recipeImgUpdate(recipeDTO);
		}
		return "recipe/recipeWritepro";
	}
	
	@RequestMapping("good")
	public String good(int num, Model model, String pageNum) {
		
		model.addAttribute("result", service.goodUpdate(num));
		model.addAttribute("article", service.getArticle(num));
		model.addAttribute("pageNum", pageNum);
		
		return "recipe/recipe_good";
	}
	
	@RequestMapping("search")
	public String search() {

		return "recipe/recipe_material_search";
	}
	@RequestMapping("readcount")
	public String readcount(int num, String pageNum, RedirectAttributes rttr) {
		log.info("==============readcount up!============== num="+num);
		service.readcountUpdate(num);
		rttr.addAttribute("num", num);
		rttr.addAttribute("pageNum",pageNum);
		return "redirect:/recipe/content";
	}
	@RequestMapping("content")
	public String content(int num, String pageNum, Model model) {
		model.addAttribute("article", service.getArticle(num));
		model.addAttribute("pageNum", pageNum);
		return "recipe/recipe_content";
	}

	// 리스트 조회
	@RequestMapping("list")
	public String list(
			@RequestParam Map<String, String> param,
			String searchWord, 
			String searchCategory, 
			String pageNum,
			Model model) {
		
		// System.out.println("body:" + request.getParameterMap());
		System.out.println("param: " + param);

		int pageSize = 10;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm", Locale.KOREAN);
		if (pageNum == null) {
			pageNum = "1";
		}

		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;

		count = service.count(searchWord, searchCategory);
		List<RecipeDTO> articleList = null;
		if (count > 0) {
			articleList = service.getList(searchWord, searchCategory, startRow, endRow);
		}
		number = count - (currentPage - 1) * pageSize;
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startRow", startRow);
		model.addAttribute("endRow", endRow);
		model.addAttribute("count", count);
		model.addAttribute("number", number);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("articleList", articleList);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("searchCategory", searchCategory);

		return "recipe/recipe_list";
	}

	
	@RequestMapping("searchList")
	public String searchList(@RequestParam Map<String, String> param, String searchRecipe,String pageNum, Model model) {
		System.out.println("param" + param);
		System.out.println("searchRecipe" + searchRecipe);

		int pageSize = 10;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		if (pageNum == null) {
			pageNum = "1";
		}

		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int searchCount = 0;
		int number = 0;

		searchCount = service.getSearchCount(searchRecipe);
		List getRecipes = null;
		if (searchCount > 0) {
			getRecipes = service.getRecipes(searchRecipe,startRow, endRow);
		}
		number = searchCount - (currentPage - 1) * pageSize;
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startRow", startRow);
		model.addAttribute("endRow", endRow);
		model.addAttribute("count", searchCount);
		model.addAttribute("number", number);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("getRecipe", getRecipes);
		model.addAttribute("searchRecipe", searchRecipe);

		return "recipe/recipe_material_searchList";
	}
	
	@RequestMapping("recipeList")
	public String recipeList(@RequestParam Map<String, String> param, 
			String ingredient_meat,String ingredient_vegetable,
			String ingredient_fish, String ingredient_egg, 
			String ingredient_instant, String ingredient_grain, 
			String ingredient_fruit, String ingredient_nut,
			String pageNum, Model model) {
		System.out.println("param" + param);
		System.out.println("ingredient_meat" + ingredient_meat);

		int pageSize = 10;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		if (pageNum == null) {
			pageNum = "1";
		}

		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int recipeCount = 0;
		int number = 0;

		recipeCount = service.getRecipeCount(ingredient_meat,ingredient_vegetable,ingredient_fish, 
				ingredient_egg, ingredient_instant, ingredient_grain, ingredient_fruit, ingredient_nut
				);
		List getRecipeList = null;
		if (recipeCount > 0) {
			getRecipeList = service.getRecipeList(ingredient_meat,ingredient_vegetable,
					ingredient_fish, ingredient_egg, ingredient_instant, ingredient_grain, ingredient_fruit,
					ingredient_nut, startRow, endRow);
		}
		number = recipeCount - (currentPage - 1) * pageSize;
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startRow", startRow);
		model.addAttribute("endRow", endRow);
		model.addAttribute("count", recipeCount);
		model.addAttribute("number", number);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("getRecipeList", getRecipeList);
		model.addAttribute("ingredient_meat", ingredient_meat);
		model.addAttribute("ingredient_vegetable", ingredient_vegetable);
		model.addAttribute("ingredient_fish", ingredient_fish);
		model.addAttribute("ingredient_egg", ingredient_egg);
		model.addAttribute("ingredient_instant",ingredient_instant);
		model.addAttribute("ingredient_grain", ingredient_grain);
		model.addAttribute("ingredient_fruit", ingredient_fruit);
		model.addAttribute("ingredient_nut", ingredient_nut);

		return "recipe/recipe_recipeList";
	}

	@RequestMapping("bestList")
	public String bestList(
			@RequestParam Map<String, String> param,
			String searchWord, 
			String searchCategory, 
			String pageNum,
			Model model) {
		
		// System.out.println("body:" + request.getParameterMap());
		System.out.println("param: " + param);

		int pageSize = 10;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm", Locale.KOREAN);
		if (pageNum == null) {
			pageNum = "1";
		}

		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;

		count = service.getBestCount(searchWord, searchCategory);
		List<RecipeDTO> articleList = null;
		if (count > 0) {
			articleList = service.getBestList(searchWord, searchCategory, startRow, endRow);
		}
		number = count - (currentPage - 1) * pageSize;
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startRow", startRow);
		model.addAttribute("endRow", endRow);
		model.addAttribute("count", count);
		model.addAttribute("number", number);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("articleList", articleList);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("searchCategory", searchCategory);

		return "recipe/recipe_bestList";
	}

	@RequestMapping("update")
	public String updateForm(int num, String pageNum, Model model) {

		model.addAttribute("article", service.getArticle(num));
		model.addAttribute("pageNum", pageNum);

		return "recipe/recipe_update";
	}

	
	@RequestMapping("updatePro")
	public String updatePro(RecipeDTO dto,String pageNum , Model model) {
		service.updateArticle(dto);
		model.addAttribute("pageNum", pageNum);

		return "recipe/recipe_updatePro";
	}

	@RequestMapping("delete")
	public String delete(@ModelAttribute("num") Long num) {
		return "recipe/recipe_delete";
	}

	@RequestMapping("deletePro")
	public String deletePro(int num, Model model) {
		model.addAttribute("result", service.articleDelete(num));
		return "reicpe/recipe_deletePro";
	}
	
	@RequestMapping("main")
	public String test(RecipeDTO RecipeDTO ,String searchRecipe, Model model) {
		int count = 0;
		List<RecipeDTO> article = service.getMainList(RecipeDTO);
		count = service.count(searchRecipe, "");
		System.out.println("======="+article.size());
		model.addAttribute("count", count);
		model.addAttribute("article", article);
	
		return "recipe/recipe_main";
	}
	

}
