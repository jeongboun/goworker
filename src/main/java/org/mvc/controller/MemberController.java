package org.mvc.controller;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mvc.bean.MemberDTO;
import org.mvc.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller

@RequestMapping("/member/")
public class MemberController {

	@Autowired
	private MemberService service;

//	@RequestMapping("member_myWrite") //유저가 작성한 글 목록
//	public String member_myWrite(String pageNum , Model model) {
//		int pageSize = 10;
//	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//	    if(pageNum == null) {
//	    	pageNum = "1";
//	    }
//
//	    int currentPage = Integer.parseInt(pageNum);
//	    int startRow = (currentPage-1) * pageSize +1;
//	    int endRow = currentPage * pageSize;
//	    int count = 0;
//	    int number = 0;
//
//	    count = service.count();
//	    List articleList = null;
//	    if(count > 0) {
//	    	articleList = service.getList(startRow, endRow);
//	    }
//	    number=count - (currentPage-1) * pageSize;
//
//	    model.addAttribute("pageNum", pageNum);
//	    model.addAttribute("currentPage", currentPage);
//	    model.addAttribute("startRow", pageNum);
//	    model.addAttribute("endRow", endRow);
//	    model.addAttribute("count", count);
//	    model.addAttribute("number", number);
//	    model.addAttribute("pageSize", pageSize);
//	    model.addAttribute("articleList", articleList);
//
//
//
//		return "member/member_myWrite";
//	}
	@RequestMapping("member_myComment")
	public String member_myComment() {
		return "member/member_myWrite";
	}
	@RequestMapping("member_myPoint")
	public String member_myPoint() {
		System.out.println("gggggggggggggggg");
		Calendar date = Calendar.getInstance();
		int year = date.get(Calendar.YEAR);
		int month = date.get(Calendar.MONDAY)+4;
		int day = date.get(Calendar.DAY_OF_MONTH);

		date.set(year,month,0);
		System.out.println("sssssssssssss"+date);
		System.out.println("sssssssssssss"+month);
		System.out.println("sssssssssssss"+year);

		return "member/member_myPoint";
	}



	@RequestMapping("find_username")
	public String find_username() {


		return "member/find_username";
	}
	@RequestMapping("find_usernamePro")
	public String find_usernamePro(MemberDTO dto, HttpSession session) {
		if(service.findmemberName(dto)==1) {
			session.setAttribute("userEmail", dto.getEmail());
		}

		return "member/find_usernamePro_step1";
	}


	@RequestMapping("find_userpw")
	public String find_userpw() {
		return "member/find_userpw";
	}
	@RequestMapping("join_step") //약관 페이지
	public String join_step() {
		return "member/join_step";
	}

	@RequestMapping("member_list")
	public String member_list() {
		return "member/member_list";
	}

	@RequestMapping("member_userinfo")
	public String member_userinfo() {
		return "member/member_userinfo";
	}

	@RequestMapping("find_id")
	public String find_id(MemberDTO dto, Model model) {
		System.out.println("%%%%%%%%%%%%%%%"+dto);
		System.out.println("111111111111"+ service.findId(dto));
		String result1="";




		if(service.findId(dto) !="" ) {
			result1 = service.findId(dto);
		}else {
			result1="no";
		}

		model.addAttribute("result1" , result1);




		return "member/find_id";
	}
	@RequestMapping("find_pw")
	public String find_pw(MemberDTO dto, Model model) {
		System.out.println("%%%%%%%%%%%%%%%"+dto);
		String result2="";




		if(service.findPw(dto) !="" ) {
			result2 = service.findPw(dto);
		}else {
			result2="no";
		}

		model.addAttribute("result2" , result2);




		return "member/find_pw";
	}





	@RequestMapping("index")
	public String index() {
		return "member/index";
	}
	@RequestMapping("input")
	public String input() {
		return "member/input";

	}


	@RequestMapping("idCheck")
	public @ResponseBody String idCheck(String id) {
		String result = "";
		if( service.idCheck(id) == 0) {
			result = "0";
		} else if(service.idCheck(id) == 1 ) {
			result = "1";
		}
		return result;
	}






	@RequestMapping("inputPro")
	public String inputPro(MemberDTO dto, Model model, HttpServletRequest req)
		throws IllegalStateException, IOException{



		model.addAttribute("result", service.memberInsert(dto));


//		if(memberBean.getId()!=null) {
//			service.memberUserInfoUpdate(memberBean); //id값 가지고 오면 테이블2 sql 실행
//		}
//
//		memberBean.setRole(null); //계급
//		memberBean.setLast_login(0);
//		memberBean.setIp(null);
//
//		memberBean.setPoint(100); //초기 포인트 100
//		memberBean.setConAttendDay(1); //초기 출석일1
//		memberBean.setTotalAttendDay(1); //초기 출석일1
//
//		model.addAttribute(sdf);
//

//		service.memberUserInfoUpdate(memberBean); // update userinfo to sql table_info

		return "member/inputPro";
	}

	@RequestMapping("login")
	public String login() {
		return "member/login";
	}

	@RequestMapping("loginPro")
	public String loginPro(MemberDTO dto, HttpSession session) {

		if(service.userLoginCheck(dto) == 1) {
			session.setAttribute("id", dto.getId());
		}


		//model.addAttribute("username" ,memberBean.getUsername()); //메인에 아이디값 보내는

		return "member/loginPro";
	}

	@RequestMapping("test2")
	public String test() {
		return "member/test2";
	}

}
