package com.gdu.voyage.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

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
	Notice notice = new Notice();
	//관리자
	
	//noticeList
	@GetMapping("/admin/adminNoticeList")
	public String notcieList(Model model, @RequestParam(defaultValue = "1") int currentPage, @RequestParam @Nullable String searchNotice) {
		//리스트를 불러오는 코드
		Map<String, Object> noticeMap = noticeService.getNoticeListByTop(currentPage, ROW_PER_PAGE, searchNotice);
		log.debug(noticeMap.toString()+"★★★ [DoHun] Notice List Controller 실행, noticeMap ★★★");
		
		
		//페이징
		int controllPage = (currentPage * ROW_PER_PAGE) - (ROW_PER_PAGE - 1);
		//검색과 페이징
		model.addAttribute("controllPage", controllPage);
		model.addAttribute("searchnotice", searchNotice);
		model.addAttribute("noticeList", noticeMap.get("noticeList"));
		model.addAttribute("lastPage", noticeMap.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		//페이징
		int pageNo = ((controllPage / 100) * 10 + 1);
		
		model.addAttribute("pageNo", pageNo);
			
		return "/admin/adminNoticeList";
	}
	
	//noticeOne
	@GetMapping("/admin/adminNoticeOne")
	public String noticeOne(Model model, int noticeNo) {
		log.debug(noticeNo+"★★★ [DoHun] Notice One Controller 실행, noticeNo ★★★");
		//상세정보를 불러오는 코드
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
		//사진
		String realPath = request.getServletContext().getRealPath("resources/image/notice//");
		//입력하는 코드
		noticeService.insertNoticeOne(noticeForm, realPath);

		return "redirect:/admin/adminNoticeList";
	}
	//delete
	@GetMapping("/admin/removeNotice")
	public String removeNoticeOne(int noticeNo) {
		noticeService.deleteNoticeOne(noticeNo);
		return "/admin/adminNoticeList";
	}
	//update
	@GetMapping("/admin/modifyNotice")
	public String updateNoticeOne(int noticeNo) {
		return "redirect:/admin/modifyNotice";
	}
	
	@PostMapping("/admin/modifyNotice")
	public String modifyNoticeOne(int noticeNo) {
		return "redirect:/admin/adminNoticeList";
	}
	
	//일반사용자
	
	//noticeList
	@GetMapping("/noticeList")
	public String notcieListByAll(Model model, @RequestParam(defaultValue = "1") int currentPage, @RequestParam @Nullable String searchNotice, HttpServletRequest request) {
		//리스트를 불러오는 코드
		Map<String, Object> noticeMap = noticeService.getNoticeListByTop(currentPage, ROW_PER_PAGE, searchNotice);
		log.debug(noticeMap.toString()+"★★★ [DoHun] Notice List Controller 실행, noticeMap ★★★");
		
		log.debug(searchNotice+"★★★ [DoHun] Notice List Controller 실행, searchNotice ★★★");	
		//페이징
		int controllPage = (currentPage * ROW_PER_PAGE) - (ROW_PER_PAGE - 1);
		//검색과 페이징
		model.addAttribute("controllPage", controllPage);	
		model.addAttribute("noticeList", noticeMap.get("noticeList"));
		model.addAttribute("lastPage", noticeMap.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		//페이징
		int pageNo = ((controllPage / 100) * 10 + 1);
		
		model.addAttribute("pageNo", pageNo);
	
		model.addAttribute("searchnotice", searchNotice);
		
		log.debug(notice.getSearchNotice()+"★★★ [DoHun] Notice List Controller 실행, notice.searchNotice ★★★");		
		return "/noticeList";
	}
	
	//noticeOne
	@GetMapping("/noticeOne")
	public String noticeOneByAll(Model model, int noticeNo) {
		log.debug(noticeNo+"★★★ [DoHun] Notice One Controller 실행, noticeNo ★★★");
		//상세정보를 불러오는 코드
		Notice notice = new Notice();
		notice = noticeService.getNoticeOne(noticeNo);
		//조회수를 증가시키는 코드, 모두가 사용하는 페이지는 페이지에 들어온다면 조회수가 증가한다.
		int noticeViewCnt = notice.getNoticeViewCnt()+1;
		notice.setNoticeViewCnt(noticeViewCnt);
		noticeService.updateNoticeViewCnt(noticeNo, noticeViewCnt);
		
		
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
