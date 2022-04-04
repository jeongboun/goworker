package org.mvc.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import org.mvc.bean.AdminDTO;
import org.mvc.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@Log4j
@RequestMapping("/admin/")
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@RequestMapping("post_manage_gather")
	public String list(Model model, String pageNum) {
		
		int pageSize = 10;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd HH:mm");
		if (pageNum == null) {
			pageNum = "1";
		}
			    
	    int currentPage = Integer.parseInt(pageNum);
	    int startRow = (currentPage - 1) * pageSize + 1;
	    int endRow = currentPage * pageSize;
	    int count = 0;
	    int number = 0;
	    
	    count = service.count();
	    number=count-(currentPage-1)*pageSize;
	    
	    model.addAttribute("pageNum", pageNum);
	    model.addAttribute("currentPage", currentPage);
	    model.addAttribute("startRow", startRow);
	    model.addAttribute("endRow", endRow);
	    model.addAttribute("count", count);
	    model.addAttribute("number", number);
	    model.addAttribute("pageSize", pageSize);
	   
			List<AdminDTO> list = service.getRecipeList(startRow, endRow);  
			model.addAttribute("searchList", list);
			return "admin/manage_board/post_manage_gather";  

	}
	
	@RequestMapping("good")
	public String goodList(Model model, String pageNum) {
		
		int pageSize = 10;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd HH:mm");
		if (pageNum == null) {
			pageNum = "1";
		}
			    
	    int currentPage = Integer.parseInt(pageNum);
	    int startRow = (currentPage - 1) * pageSize + 1;
	    int endRow = currentPage * pageSize;
	    int count = 0;
	    int number = 0;
	    
	    count = service.count();
	    number=count-(currentPage-1)*pageSize;
	    
	    model.addAttribute("pageNum", pageNum);
	    model.addAttribute("currentPage", currentPage);
	    model.addAttribute("startRow", startRow);
	    model.addAttribute("endRow", endRow);
	    model.addAttribute("count", count);
	    model.addAttribute("number", number);
	    model.addAttribute("pageSize", pageSize);
	   
			List<AdminDTO> list = service.getRecipeGoodList(startRow, endRow); 
			model.addAttribute("searchList", list);
			return "admin/manage_board/descList";
	}
	
	@RequestMapping("visit")
	public String visitList(Model model, String pageNum) {
		
		int pageSize = 10;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd HH:mm");
		if (pageNum == null) {
			pageNum = "1";
		}
			    
	    int currentPage = Integer.parseInt(pageNum);
	    int startRow = (currentPage - 1) * pageSize + 1;
	    int endRow = currentPage * pageSize;
	    int count = 0;
	    int number = 0;
	    
	    count = service.count();
	    number=count-(currentPage-1)*pageSize;
	    
	    model.addAttribute("pageNum", pageNum);
	    model.addAttribute("currentPage", currentPage);
	    model.addAttribute("startRow", startRow);
	    model.addAttribute("endRow", endRow);
	    model.addAttribute("count", count);
	    model.addAttribute("number", number);
	    model.addAttribute("pageSize", pageSize);
	   
		
			List<AdminDTO> list = service.getRecipeVisitList(startRow, endRow);  
			model.addAttribute("searchList", list);
			return "admin/manage_board/descList";
	}
	
	@RequestMapping("goodDesc")
	public String goodListDesc(Model model, String pageNum) {
		
		int pageSize = 10;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd HH:mm");
		if (pageNum == null) {
			pageNum = "1";
		}
			    
	    int currentPage = Integer.parseInt(pageNum);
	    int startRow = (currentPage - 1) * pageSize + 1;
	    int endRow = currentPage * pageSize;
	    int count = 0;
	    int number = 0;
	    
	    count = service.count();
	    number=count-(currentPage-1)*pageSize;
	    
	    model.addAttribute("pageNum", pageNum);
	    model.addAttribute("currentPage", currentPage);
	    model.addAttribute("startRow", startRow);
	    model.addAttribute("endRow", endRow);
	    model.addAttribute("count", count);
	    model.addAttribute("number", number);
	    model.addAttribute("pageSize", pageSize);
	   
			List<AdminDTO> list = service.getRecipeGoodListDesc(startRow, endRow); 
			model.addAttribute("searchList", list);
			return "admin/manage_board/post_manage_gather";
	}
	
	@RequestMapping("visitDesc")
	public String visitListDesc(Model model, String pageNum) {
		
		int pageSize = 10;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd HH:mm");
		if (pageNum == null) {
			pageNum = "1";
		}
			    
	    int currentPage = Integer.parseInt(pageNum);
	    int startRow = (currentPage - 1) * pageSize + 1;
	    int endRow = currentPage * pageSize;
	    int count = 0;
	    int number = 0;
	    
	    count = service.count();
	    number=count-(currentPage-1)*pageSize;
	    
	    model.addAttribute("pageNum", pageNum);
	    model.addAttribute("currentPage", currentPage);
	    model.addAttribute("startRow", startRow);
	    model.addAttribute("endRow", endRow);
	    model.addAttribute("count", count);
	    model.addAttribute("number", number);
	    model.addAttribute("pageSize", pageSize);
	   
		
			List<AdminDTO> list = service.getRecipeVisitListDesc(startRow, endRow);  
			model.addAttribute("searchList", list);
			return "admin/manage_board/post_manage_gather";
	}
	
	@RequestMapping("delete")
	public String delete(@ModelAttribute("num") int num) {
		return "admin/manage_board/delete";
	}
	
	@RequestMapping("deletePro")
	public String deletePro(int num , Model model){
		model.addAttribute("result", service.adminDelete(num));	
		return "admin/manage_board/deletePro";
	}
	
	@RequestMapping("unDelete")
	public String unDelete(@ModelAttribute("num") int num) {
		return "admin/manage_board/unDelete";
	}
	
	@RequestMapping("unDeletePro")
	public String unDeletePro(int num , Model model){
		model.addAttribute("result", service.adminUnDelete(num));	
		return "admin/manage_board/unDeletePro";
	}
	
	@RequestMapping("stats")
	public String stats(Model model , AdminDTO dto) {
		int resultK = service.getKoreaCount(dto);
		int resultJ = service.getJapanCount(dto);
		int resultU = service.getUsaCount(dto);
		int resultC = service.getChinaCount(dto);
		int resultM = service.getMexicoCount(dto);
		int resultI = service.getItalyCount(dto);
		int resultV = service.getVitnamCount(dto);
		model.addAttribute(resultK);
		model.addAttribute(resultJ);
		model.addAttribute(resultU);
		model.addAttribute(resultC);
		model.addAttribute(resultI);
		model.addAttribute(resultM);
		model.addAttribute(resultV);
		double sum = (double)(resultK+resultJ+resultC+resultM+resultI+resultV+resultU);
		return "admin/manage_board/stats";
		
	}
	
}
