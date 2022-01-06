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

import com.gdu.voyage.service.ActivityReviewService;
import com.gdu.voyage.vo.ActivityReview;
import com.gdu.voyage.vo.ActivityReviewForm;
import com.gdu.voyage.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ActivityReviewController {
	@Autowired ActivityReviewService activityReviewService;
	private final int ROW_PER_PAGE = 6;
	
	// [Member] 숙소 후기 목록 조회
		@GetMapping("/getActivityReviewList")
		public String getActivityReviewList(Model model, @RequestParam(defaultValue="1") int currentPage, @RequestParam @Nullable Integer activityPaymentNo) {
			log.debug("ReviewController() 실행");
			Map<String, Object> map = activityReviewService.getActivityReviewList(activityPaymentNo, currentPage, ROW_PER_PAGE);
			int controllPage = (currentPage * ROW_PER_PAGE) - (ROW_PER_PAGE - 1);
			int pageNo = ((controllPage / 100) * 10 + 1);

			model.addAttribute("controllPage", controllPage);
			model.addAttribute("activityReviewList", map.get("activityReviewList"));
			model.addAttribute("lastPage", map.get("lastPage"));
			model.addAttribute("totalCount", map.get("totalCount"));
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("pageNo", pageNo);
			
			return "/templates_citylisting/getActivityReviewList";
		}
		
		// 숙소 후기 상세 보기
		@GetMapping("/activityReviewOne")
		public String getActivityReviewOne(Model model, int activityReviewNo) {
			log.debug(activityReviewNo+"***** [상훈] activityReviewOne 실행 activityReviewNo");
			ActivityReview activityReview = activityReviewService.getActivityReviewOne(activityReviewNo);
			
			int activityReviewViewCnt = activityReview.getActivityReviewViewCnt()+1;
			activityReviewService.activityReviewViewCnt(activityReviewNo);
			
			model.addAttribute("activityReview", activityReview);
			model.addAttribute("accomReviewViewCnt", activityReviewViewCnt);
			log.debug(model+"***** [상훈] activityReviewOne 실행 model");
			return "activityReviewOne";
		}
		
		// [Member] 후기 작성 get
		@GetMapping("/addActivityReview")
		public String addActivityReview(HttpSession session, Model model) {
			log.debug("addActivityReviewController() 실행");
			// session에서 로그인한 회원 정보 가져옴
			Member loginMember = (Member)session.getAttribute("loginMember");
			model.addAttribute("loginMember", loginMember);
			// 비회원일 경우, 로그인 후 이용 가능
			if(loginMember == null) {
				return "redirect:/login";
			}
			return "/templates_citylisting/addActivityReview";
		}
		
		// [Member] 후기 작성 post
		@PostMapping("/addActivityReview")
		public String addActivityReview(HttpServletRequest request, ActivityReviewForm activityReviewForm, 
				HttpSession session) throws Exception {
			Member loginMember = (Member) session.getAttribute("loginMember");
			int activityPaymentNo = Integer.parseInt(request.getParameter("activityPaymentNo"));
			String memberId = loginMember.getMemberId();
			String memberNickname = loginMember.getMemberNickname();
			
				// 디버그 코드
				log.debug("***** [상훈] addActivityReview_qnaForm_Controller() debug" + activityReviewForm.toString());
				// 이미지 파일 절대 경로 설정
				String realPath = request.getServletContext().getRealPath("resources/image/activityReview/");
				
				activityReviewService.addActivityReview(activityReviewForm, realPath, activityPaymentNo, memberId, memberNickname);
				
				return "redirect:/getActivityReviewList?pageNo=1";
			}

	}
