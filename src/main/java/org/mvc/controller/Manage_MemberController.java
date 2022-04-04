package org.mvc.controller;

import java.util.List;

import javax.inject.Inject;

import org.mvc.bean.Manage_MemberDTO;
import org.mvc.service.Manage_MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class Manage_MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	Manage_MemberService memberService;


	@RequestMapping("member/list")
	public String memberList(Model model){
		List<Manage_MemberDTO> list = memberService.memberList();
		model.addAttribute("list", list);
		return "member/member_list";
	}

	@RequestMapping("member/write")
	public String memberWrite(){

		return "member/member_write";
	}

	@RequestMapping("member/insert")
	public String memberInsert(@ModelAttribute Manage_MemberDTO dto){
		memberService.insertMember(dto);
		return "redirect:/member/list";
	}

	@RequestMapping("member/view")
	public String memberView(@RequestParam String Id, Model model){
		model.addAttribute("dto", memberService.viewMember(Id));
		logger.info("클릭한 아이디 : "+Id);
		return "member/member_view";
	}
	@RequestMapping("member/update")
	public String memberUpdate(@ModelAttribute Manage_MemberDTO dto, Model model){
		boolean result = memberService.checkPw(dto.getId(), dto.getPw());
		if(result){
			memberService.updateMember(dto);
			return "redirect:/member/list";
		} else {
			Manage_MemberDTO dto2 = memberService.viewMember(dto.getId());
			dto.setRegdate(dto2.getRegdate());
			dto.setUpdatedate(dto2.getUpdatedate());
			model.addAttribute("DTO", dto);
			model.addAttribute("message", "비밀번호 불일치");
			return "member/member_view";
		}

	}

	@RequestMapping("member/delete.do")
	public String memberDelete(@RequestParam String Id, @RequestParam String Pw, Model model){
		boolean result = memberService.checkPw(Id, Pw);
		if(result){
			memberService.deleteMember(Id);
			return "redirect:/member/list.do";
		} else {
			model.addAttribute("message", "비밀번호 불일치");
			model.addAttribute("dto", memberService.viewMember(Id));
			return "member/member_view";
		}
	}
}
