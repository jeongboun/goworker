package org.mvc.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.mvc.bean.CsDTO;
import org.mvc.service.CsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@Log4j
@RequestMapping("/cs/")
public class CsController {

	@Autowired
	public CsService service;

	@RequestMapping("write")
	public String write(HttpSession session) {
		String id = (String) session.getAttribute("userName");
		log.info("==============id @" + id);
		if (id == null) {
			return "redirect:/member/login";
		}
		return "cs/customWrite";
	}

	@RequestMapping("writePro")
	public String writePro(CsDTO dto, Model model, MultipartFile save) {
		log.info("dto ==========" + dto);
		model.addAttribute("result", service.csWrite(dto));
		log.info("======image img===" + save);
		String type = save.getContentType().split("/")[0];
		String orgName = save.getOriginalFilename();
		if (type.equals("image")) {
			File folder = new File("d://fileSave//");
			String[] list = folder.list();
			int count = 0;
			for (String fileName : list) {
				if (fileName.equals(orgName)) {
					orgName = (++count) + orgName;
				}
			}
			File f = new File("d://fileSave//" + orgName);
			try {
				save.transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();
			}
			dto.setImage(orgName);
			log.info("orgname==========" + orgName);
			log.info("num------------" + dto.getNum());
			service.csFileUpload(dto);
		}
		return "cs/customWritePro";
	}

	@RequestMapping("list")
	public String main(String pageNum, HttpSession session, Model model) {
		String id = (String) session.getAttribute("userName");
		log.info("==============id =" + id);
		if (id == null) {
			return "redirect:/member/login";
		}
		int pageSize = 10;
		if (pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startNum = (currentPage - 1) * pageSize + 1;
		int endNum = currentPage * pageSize;
		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd HH:mm");

		int count = 0;
		List<CsDTO> list = null;
		count = service.getCountMyQNA(id);
		if (count > 0) {
			list = service.getMyQNA(id, startNum, endNum);
			log.info("==============list=" + list);
		}
		model.addAttribute("list", list);
		model.addAttribute("startPage", startNum);
		model.addAttribute("endPage", endNum);
		model.addAttribute("count", count);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("sdf", sdf);

		return "cs/csCenter";
	}

	@RequestMapping("readcount")
	public String readcount(int num, String pageNum, RedirectAttributes rttr) {
		log.info("==============readcount up!============== num=" + num);
		service.readCountUpdate(num);
		rttr.addAttribute("num", num);
		rttr.addAttribute("pageNum", pageNum);
		return "redirect:/cs/content";
	}

	@RequestMapping("content")
	public String content(int num, String pageNum, Model model) {
		model.addAttribute("dto", service.read(num));
		model.addAttribute("pageNum", pageNum);
		return "cs/customContent";
	}

	@RequestMapping("update")
	public String update() {
		return "cs/customUpdate";
	}

	@RequestMapping("updatePro")
	public String updatePro(int num, String pageNum, Model model) {
		model.addAttribute("dto", service.update(num));
		return "cs/customUpdatePro";
	}
}
