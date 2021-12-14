package com.gdu.voyage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gdu.voyage.service.NoticeService;
import com.gdu.voyage.vo.NoticeFile;
import com.gdu.voyage.vo.NoticeForm;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class NoticeController {
	@Autowired NoticeService noticeService;
	
	@GetMapping("/noticeList") // 공지사항 게시판 리스트
	public String getAccomProduct() {
		System.out.println("NoticeController() 실행");
	      
		return "/templates_citylisting/noticeList";
	}
	@GetMapping("/admin/addNotice")
	public String addNotice() {
		return "/admin/addNotice";
	}
	
	@PostMapping("/admin/addNotice")
	public String addNotice(NoticeForm noticeForm) {
		log.debug(noticeForm.toString());
		//noticeService.addNotice(noticeForm);
		return "redirect:/noticefileList";
	}
	
	@GetMapping("/noticefileList") 
	public String getAccomProduct(Model fmodel) {
		System.out.println("NoticeController() 실행");
		//List<NoticeFile> list = noticeService.getNoticeFileList();
	    //fmodel.addAttribute("list",list);
		return "noticefileList";
	}
}