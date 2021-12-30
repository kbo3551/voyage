package com.gdu.voyage.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdu.voyage.service.NoticeService;
import com.gdu.voyage.vo.AccomRoomForm;
import com.gdu.voyage.vo.Notice;
import com.gdu.voyage.vo.NoticeFile;
import com.gdu.voyage.vo.NoticeForm;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class NoticeController {
	@Autowired NoticeService noticeService;
	
	private final int ROW_PER_PAGE = 10;
	//관리자
	
	//noticeList
	@GetMapping("/admin/adminNoticeList")
	public String notcieList(Model model, @RequestParam(defaultValue = "1") int currentPage, @RequestParam @Nullable String searchNotice) {
		Map<String, Object> noticeMap = noticeService.getNoticeListByTop(currentPage, ROW_PER_PAGE, searchNotice);
		log.debug(noticeMap.toString()+"★★★ [DoHun] Notice List Controller 실행, noticeMap ★★★");

		
		int controllPage = (currentPage * ROW_PER_PAGE) - (ROW_PER_PAGE - 1);
		
		model.addAttribute("controllPage", controllPage);
		model.addAttribute("searchnotice", searchNotice);
		model.addAttribute("noticeList", noticeMap.get("noticeList"));
		model.addAttribute("lastPage", noticeMap.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		
		int pageNo = ((controllPage / 100) * 10 + 1);
		
		model.addAttribute("pageNo", pageNo);
			
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
	public String addNoticeOne(NoticeForm noticeForm, HttpServletRequest request) {
		log.debug(noticeForm+"★★★ [DoHun] Notice insert Controller 실행, notice ★★★");
		
		String realPath = request.getServletContext().getRealPath("resources/image/notice//");
		
		noticeService.insertNoticeOne(noticeForm, realPath);

		return "/admin/adminNoticeList";
	}
	//delete
	@GetMapping("/admin/removeNotice")
	public String removeNoticeOne(int noticeNo) {
		noticeService.deleteNoticeOne(noticeNo);
		return "/admin/adminNoticeList";
	}
	//update
	@GetMapping("/admin/modifyNotice")
	public String updateNoticeOne() {
		return "/admin/modifyNotice";
	}
	
	@PostMapping("/admin/modifyNotice")
	public String modifyNoticeOne() {
		return "/admin/modifyNotice";
	}
	
	//일반사용자
	
	//noticeList
	@GetMapping("/noticeList")
	public String notcieListByAll(Model model, @RequestParam(defaultValue = "1") int currentPage, @RequestParam @Nullable String searchNotice) {
		Map<String, Object> noticeMap = noticeService.getNoticeListByTop(currentPage, ROW_PER_PAGE, searchNotice);
		log.debug(noticeMap.toString()+"★★★ [DoHun] Notice List Controller 실행, noticeMap ★★★");

		
		int controllPage = (currentPage * ROW_PER_PAGE) - (ROW_PER_PAGE - 1);
		
		model.addAttribute("controllPage", controllPage);
		model.addAttribute("searchnotice", searchNotice);
		model.addAttribute("noticeList", noticeMap.get("noticeList"));
		model.addAttribute("lastPage", noticeMap.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		
		int pageNo = ((controllPage / 100) * 10 + 1);
		
		model.addAttribute("pageNo", pageNo);
			
		return "/noticeList";
	}
	
	//noticeOne
	@GetMapping("/noticeOne")
	public String noticeOneByAll(Model model, int noticeNo) {
		log.debug(noticeNo+"★★★ [DoHun] Notice One Controller 실행, noticeNo ★★★");
		Notice notice = noticeService.getNoticeOne(noticeNo);
		log.debug(notice+"★★★ [DoHun] Notice One Controller 실행, notice ★★★");
		
		model.addAttribute("notice", notice);
		log.debug(model+"★★★ [DoHun] Notice One Controller 실행, notice model ★★★");
		
		return "/noticeOne";
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
