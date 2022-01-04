package com.gdu.voyage.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdu.voyage.service.AccomReviewService;
import com.gdu.voyage.vo.AccomReview;
import com.gdu.voyage.vo.AccomReviewForm;
import com.gdu.voyage.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AccomReviewController {
	@Autowired AccomReviewService accomReviewService;
	private final int ROW_PER_PAGE = 6;
	
	@GetMapping("/setReviewCategory")
	public String setProductCategory() {
		System.out.println("ActivityReviewController() 실행");	      
		return "/product/setReviewCategory";
	}
	
	// [Member] 숙소 후기 목록 조회
	@GetMapping("/getAccomReviewList")
	public String getAccomReviewList(Model model, @RequestParam(defaultValue="1") int currentPage, @RequestParam @Nullable String Review) {
		log.debug("*********[상훈]ReviewController() 실행");
		Map<String, Object> map = accomReviewService.getAccomReviewList(Review, currentPage, ROW_PER_PAGE);
		int controllPage = (currentPage * ROW_PER_PAGE) - (ROW_PER_PAGE - 1);
		int pageNo = ((controllPage / 100) * 10 + 1);

		model.addAttribute("controllPage", controllPage);
		model.addAttribute("accomReviewList", map.get("accomReviewList"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("totalCount", map.get("totalCount"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageNo", pageNo);
		
		return "/templates_citylisting/getAccomReviewList";
	}
	
	@GetMapping("/getReviewOne")
	public String getReviewOne() {
		System.out.println("ReviewController() 실행");
	      
		return "/templates_citylisting/getReviewOne";
	}
	
	// [Member] 후기 작성 get
		@GetMapping("/addAccomReview")
		public String addAccomReview(HttpSession session) {
			log.debug("addAccomReviewController() 실행");
			// session에서 로그인한 회원 정보 가져옴
			Member loginMember = (Member)session.getAttribute("loginMember");
			// 비회원일 경우, 로그인 후 이용 가능
			if(loginMember == null) {
				return "redirect:/login";
			}
			return "/templates_citylisting/addAccomReview";
		}
		// [Member] 후기 작성 post
		@PostMapping("/addAccomReview")
		public String addAccomReview(HttpServletRequest request, AccomReviewForm accomReviewForm, 
				HttpSession session) throws Exception {
			// accomPaymentDetails값을 세션에서 가져옴
			AccomReview imforAccomReview = (AccomReview) session.getAttribute("imforAccomReview");
			Member loginMember = (Member) session.getAttribute("loginMember");
			
			String memberId = loginMember.getMemberId();
			String memberNickname = loginMember.getMemberNickname();
			
			int accomPaymentDetails = imforAccomReview.getAccomPaymentDetails();
			// 디버그 코드
			log.debug("***** [상훈] addAccomReview_qnaForm_Controller() debug" + accomReviewForm.toString());
			// 이미지 파일 절대 경로 설정
			String realPath = request.getServletContext().getRealPath("resources/image/accomReview/");
			
			accomReviewService.addAccomReview(accomReviewForm, realPath, accomPaymentDetails, memberId, memberNickname);
			
			return "redirect:/getAccomReviewList?pageNo=1";
		}

}
