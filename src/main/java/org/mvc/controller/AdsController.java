package org.mvc.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.List;

import org.mvc.bean.AdminDTO;
import org.mvc.bean.AdsDTO;
import org.mvc.bean.RecipeDTO;
import org.mvc.service.AdminService;
import org.mvc.service.AdsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@Log4j
@RequestMapping("/ads/")
public class AdsController {
	
	@Autowired
	private static int count=0;
	
	@Autowired
	private AdsService service;
	
	@RequestMapping("ads")
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
	  
	    List<AdsDTO> list = service.getAdsList(startRow, endRow); 
		model.addAttribute("adsList", list);
	    return "advertisement/ads";
	}
	
	@RequestMapping("ads_insert")
	public String ads_insert() {
		return "advertisement/ads_insert";
	}
	
	@RequestMapping("ads_insertPro")
	public String ads_insertPro(AdsDTO adsDTO, Model model, MultipartFile save) {
		model.addAttribute("result", service.adsInsert(adsDTO));
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
			adsDTO.setAds_img(orgName);
			service.adsImgUpdate(adsDTO);
		}
		return "advertisement/ads_insertPro";
	}
	
	@RequestMapping("ads_show")
	public String ads_show(Model model, String pageNum) {
		
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
	  
	    List<AdsDTO> list = service.getAdsList(startRow, endRow ); 
		model.addAttribute("adsList", list);
	    return "advertisement/ads_showPro";
	}
	
	@RequestMapping("ads_showPro")
	public String ads_showPro(AdsDTO adsDTO, Model model) {
		service.getShow(adsDTO);
		String url = adsDTO.getAds_url();	
		String img = adsDTO.getAds_img();
		
		model.addAttribute("url", url);
		model.addAttribute("img", img);
		return "recipe/main";
	}
	
}
