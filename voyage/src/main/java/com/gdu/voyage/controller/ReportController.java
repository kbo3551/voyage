package com.gdu.voyage.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdu.voyage.service.AccomReviewService;
import com.gdu.voyage.service.ActivityReviewService;
import com.gdu.voyage.service.ProductService;
import com.gdu.voyage.service.ReportService;

import com.gdu.voyage.vo.Member;
import com.gdu.voyage.vo.Report;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ReportController {
	@Autowired ReportService reportService;
	@Autowired ProductService productService;
	@Autowired AccomReviewService accomReviewService;
	@Autowired ActivityReviewService activityReviewService;
	private final int ROW_PER_PAGE = 10;
	
	// [Admin] 신고 목록 
	@GetMapping("/admin/reportList")
	public String reportList() {
	
		return null;
	}
	
	// [admin] 신고 내용 상세
	@GetMapping("/admin/reportOne")
	public String reportOne() {
		
		return null;
	}
	// [Member] 신고 작성 
	@GetMapping("/addReport")
	public String addReport(HttpSession session, HttpServletResponse response, Model model,
			HttpServletRequest request, int idenNo, String table) throws IOException {
		log.debug("addReport_Controller() 실행");
		// 세션에서 로그인 정보를 가져와 member 객체에 저장
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		idenNo = Integer.parseInt(request.getParameter("idenNo"));
		table = request.getParameter(table);
		// 디버깅 코드
		log.debug("★★★★★★★★★★★ [다원] addReport_idenNo_Controller() debug" + idenNo);
		log.debug("★★★★★★★★★★★ [다원] addReport_table_Controller() debug" + table);
	
		model.addAttribute(idenNo);
		model.addAttribute(table);
		// 비회원인 경우
		if(loginMember == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('비회원 계정입니다. 로그인해주세요.');location.href='/voyage/login';</script>");
			out.flush();
			return "redirect:/login"; 
		}
		return "/addReport";
	}
	
	@PostMapping("/addReport")
	public String addReport(HttpSession session, Report report, int idenNo, String table,
			HttpServletRequest request) {
		// 세션에서 로그인 정보를 가져와 member 객체에 저장
		Member loginMember = (Member)session.getAttribute("loginMember");
		// 변수에 값 셋팅 
		String memberId = loginMember.getMemberId();
		idenNo = Integer.parseInt(request.getParameter("idenNo"));
		table = request.getParameter(table);
		// 서비스로 값 전달
		reportService.addReport(report, idenNo, table, memberId);
		
		return "redirect:/index";
	} 
}
