package org.mvc.controller;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mvc.bean.AdminDTO;
import org.mvc.bean.MemberDTO;
import org.mvc.bean.NoticeDTO;
import org.mvc.service.AdminService;
import org.mvc.service.MemberService;
import org.mvc.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;


@Controller

@Slf4j
@Log4j
@RequestMapping("/notice/")

public class NoticeController {
	private static int count = 0;

	@Autowired
	private NoticeService service;
	private MemberService service2;
	
	@RequestMapping("notice_list")
	public String notice_list(String pageNum, Model model,MemberDTO dto , NoticeDTO dto1) {
		int pageSize = 10;
	    SimpleDateFormat sdf =  new SimpleDateFormat("yyyy-MM-dd HH:mm");
	    if (pageNum == null) {
	        pageNum = "1";
	    }
		
	    int currentPage = Integer.parseInt(pageNum);
	    int startRow = (currentPage - 1) * pageSize + 1;
	    int endRow = currentPage * pageSize;
	    int count = 0;
	    int number=0;
	    
	    count = service.count();
	    List articleList = null;
	    if (count >0 ) {
	    	articleList = service.getList(startRow, endRow);
	    }
	    
	    number=count-(currentPage-1)*pageSize;
	    model.addAttribute("pageNum", pageNum);
	    model.addAttribute("currentPage", currentPage);
	    model.addAttribute("startRow", startRow);
	    model.addAttribute("endRow", endRow);
	    model.addAttribute("count", count);
	    model.addAttribute("number", number);
	    model.addAttribute("pageSize", pageSize);
	    model.addAttribute("articleList", articleList);

		
		return "notice/notice_list";

	}
	@RequestMapping("notice_write") 
	public String notice_write()   {
		return "notice/notice_write";
	}
	
	
	@RequestMapping("notice_content")
	public String notice_content(Long num, Model model) {
		
		service.getContent(num);
		
		model.addAttribute("content", service.getContent(num));
		
		return "notice/notice_content";
	}
	
	@RequestMapping("notice_move") //새로고침 조회수 증가 방지 
	public String notice_move(Long num) {
		
		service.readUP(num);
		return "redirect:/notice/notice_content";
		
	}
	
	
	
	
	
//	@RequestMapping(value="SummerNoteImageFile" , method = RequestMethod.POST)
//	public @ResponseBody JsonObject SummerNoteImageFile(@RequestParam("file") MultipartFile file) {
//		JsonObject jsonObject = pls.SummerNoteImageFile(file);
//		 System.out.println(jsonObject);
//		return jsonObject;
//	}
	
	
	@RequestMapping("notice_writePro")
	public String notice_writePro(NoticeDTO noticeDTO, Model model)   {


		
		
		int result =  service.noticeWrite(noticeDTO);
		model.addAttribute("result", result);
		
		return "notice/notice_writePro";
	}
		
	
	@RequestMapping("notice_del")
	public String notice_del(Long num) {
		service.notice_del(num);
		
		return "redirect:/notice/notice_list";
		
	}
	@RequestMapping("notice_update")
	public String notice_update(Long num, Model model) {
		model.addAttribute("content", service.getContent(num));
		
		
		return "notice/notice_update";
		
	}
	@RequestMapping("notice_updatePro")
	public String notice_updatePro(NoticeDTO dto) {
		
		
		return "notice/notice_updatePro";
		
		
	}
	
	@RequestMapping("member_list1")
	public String member_list1() {
		
		
		return "notice/member_list1";
		
		
	}
	
		
	
	
}
