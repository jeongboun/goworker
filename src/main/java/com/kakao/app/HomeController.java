package com.kakao.app;


import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.mvc.bean.MemberDTO;
import org.mvc.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class HomeController {
	@Autowired
	private MemberService service;


	KakaoAPI kakaoApi = new KakaoAPI();

	@RequestMapping(value="/member/kakaologin")
	public ModelAndView login(@RequestParam("code") String code, HttpSession session,MemberDTO dto) {
		ModelAndView mav = new ModelAndView();
		// 1번 인증코드 요청 전달
		String accessToken = kakaoApi.getAccessToken(code);
		// 2번 인증코드로 토큰 전달
		HashMap<String, Object> userInfo = kakaoApi.getUserInfo(accessToken);

		System.out.println("login info : " + userInfo.toString());


		String kid =(String) userInfo.get("id");
		String connected_at = (String) userInfo.get("connected_at");
		String gender = (String) userInfo.get("gender");


		System.out.println("eeeeeeeeeeeee"+connected_at); // 가입 날짜


//		String kmail = (String) userInfo.get("email");
		if(service.getKakaoId(kid) == 0) {

			service.kakaoInsert(kid, gender, connected_at); //db 저장
//			service.kakaoInsert(kid, connected_at);


//			System.out.println(userInfo.get("email"));
//			System.out.println(kmail);
			System.out.println("eeeeeeeeeeeeeeeeee");

			System.out.println("eeeeeeee"+userInfo.get("connected_at"));
		}
		if(service.getKakaoId(kid) == 1) {

			System.out.println("fffffffffff");
		}

		/*
		 * if(userInfo.get("email") != null) { session.setAttribute("userId",
		 * userInfo.get("email")); session.setAttribute("accessToken", accessToken); }
		 */

		session.setAttribute("id", kid);


		mav.addObject("userId", userInfo.get("email"));
		mav.setViewName("member/test2");
		return mav;
	}

	@RequestMapping(value="/kakaologout")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mav = new ModelAndView();

		kakaoApi.kakaoLogout((String)session.getAttribute("accessToken"));
		session.removeAttribute("accessToken");
		session.removeAttribute("userId");
		mav.setViewName("index");
		return mav;
	}



}