package com.gdu.voyage.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdu.voyage.service.NoticeService;
import com.gdu.voyage.vo.Notice;
import com.gdu.voyage.vo.NoticeFile;
import com.gdu.voyage.vo.NoticeForm;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class NoticeController {
	@Autowired NoticeService noticeService;
	
	private final int ROW_PER_PAGE = 10;
	
	//noticeList
	@GetMapping("/admin/adminNoticeList")
	public String notcieList(Model model,
								@RequestParam(defaultValue = "1") int currentPage) {
		
		Map<String, Object> noticeMap = noticeService.getNoticeListByTop(currentPage, ROW_PER_PAGE);
		log.debug(noticeMap.toString()+"★★★ [DoHun] Notice List Controller 실행, noticeMap ★★★");
		
		model.addAttribute("noticeList", noticeMap.get("noticeList"));
		model.addAttribute("lastPage", noticeMap.get("lastPage"));
		
		return "/admin/adminNoticeList";
	}
	//noticeOne
	@GetMapping("/admin/adminNoticeOne")
	public String noticeOne(Model model, int noticeNo) {
		log.debug(noticeNo+"★★★ [DoHun] Notice One Controller 실행, noticeNo ★★★");
		Notice notice = noticeService.getNoticeOne(noticeNo);
		log.debug(notice+"★★★ [DoHun] Notice One Controller 실행, notice ★★★");
		
		model.addAttribute("notice", notice);
		log.debug(model+"★★★ [DoHun] Notice One Controller 실행, notice model ★★★");
		
		return "/admin/adminNoticeOne";
	}
	//insert
	@GetMapping("/admin/addNotice")
	public String addNoticeOne() {
		return "/admin/addNotice";
	}
	
	@PostMapping("/admin/addNotice")
	public String addNoticeOne(Notice notice,NoticeFile noticeFile, NoticeForm noticeForm) {
		log.debug(notice+"★★★ [DoHun] Notice insert Controller 실행, notice ★★★");
		log.debug(noticeFile+"★★★ [DoHun] Notice insert Controller 실행, notice File ★★★");
		noticeService.insertNoticeOne(notice, noticeFile, noticeForm);

		return "/admin/adminNoticeList";
	}
	//delete
	@GetMapping("/admin/removeNotice")
	public String removeNoticeOne() {
		return "/admin/removeNotice";
	}
	
	@PostMapping("/admin/removeNotice")
	public String deleteNoticeOne(Notice notice, NoticeFile noticeFile) {
		log.debug(notice.toString()+"★★★ [DoHun] Notice delete Controller 실행, notice ★★★");
		log.debug(noticeFile+"★★★ [DoHun] Notice delete Controller 실행, notice File ★★★");
		noticeService.deleteNoticeOne(notice, noticeFile);
		
		return "/admin/adminNoticeList";
	}
	//update
	@GetMapping("/admin/modifyNotice")
	public String updateNoticeOne() {
		return "/admin/modifyNotice";
	}
	
	@PostMapping("/admin/modifyNotice")
	public String modifyNoticeOne(Notice notice,NoticeFile noticeFile, NoticeForm noticeForm) {
		log.debug(notice.toString()+"★★★ [DoHun] Notice update Controller 실행, notice ★★★");
		noticeService.updateNoticeOne(notice, noticeFile, noticeForm);
		log.debug(notice.toString()+"★★★ [DoHun] Notice update Controller 실행, notice ★★★");
		
		return "/admin/adminNoticeList";
	}
	
	/*
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
	*/
}