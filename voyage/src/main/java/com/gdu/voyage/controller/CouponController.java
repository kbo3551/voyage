package com.gdu.voyage.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdu.voyage.service.CouponService;
import com.gdu.voyage.vo.Coupon;
import com.gdu.voyage.vo.CouponMember;
import com.gdu.voyage.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Controller
public class CouponController {
	@Autowired
	CouponService couponService;
	private final int ROW_PER_PAGE = 10;
	// 회원 쿠폰 발급
	@PostMapping("/member/addMemberCoupon")
	public String postAddMemberCoupon(CouponMember couponMember,HttpSession session, Coupon coupon,Model model) {
		System.out.println("★★★[boryeong]CouponController_postAddMemberCoupon실행★★★");
		
		// 회원 세션 정보
		String memberId = ((Member) session.getAttribute("loginMember")).getMemberId();
		String deadLine = coupon.getDeadLine();
		int couponNo = coupon.getCouponNo();
		
		// 값
		CouponMember cm = new CouponMember();
		
		cm.setCouponNo(couponNo);
		cm.setDeadLine(deadLine);
		cm.setMemberId(memberId);
		
		log.debug("★★★[boryeong]CouponController★★★"+cm.toString());
		
		// 중복 발행 검사
		String duplCheck = couponService.duplMemberCoupon(cm);
		if(duplCheck.equals("쿠폰중복")) {
			model.addAttribute("msg", "이미 발급된 쿠폰입니다");
		    model.addAttribute("url", "redirect:/member/coupon");
			return "/alert";
		}
		couponService.addMemberCoupon(cm);
		model.addAttribute("msg", "쿠폰이 발급 되었습니다.");
	    model.addAttribute("url", "redirect:/member/coupon");
		return "/alert";
	}
	// 회원이 발급받은 쿠폰 list, 발급할 쿠폰list
		@GetMapping("/member/coupon")
		public String getMemberCouponList(Model model, @RequestParam(defaultValue = "1") int memberCouponPage, HttpSession session,
				@RequestParam(defaultValue = "1") int couponPage) {
			System.out.println("CouponController()_coupon실행");
			log.debug("★★★[boryeong]CouponController★★★" + memberCouponPage);
			// 회원 ID
			String memberId = ((Member) session.getAttribute("loginMember")).getMemberId();
			// 회원이 발급받은 쿠폰 페이징
			int memberCouponBeginRow = (memberCouponPage * ROW_PER_PAGE) - (ROW_PER_PAGE - 1);
			int memberCouponPageNo = ((memberCouponBeginRow / 100) * 10 + 1);
			// 발급가능한 쿠폰 페이징
			int couponBeginRow =  (couponPage * ROW_PER_PAGE) - (ROW_PER_PAGE - 1);
			int couponPageNo = ((couponBeginRow / 100) * 10 + 1);
			
			// 쿠폰발급 list,회원이 발급받은 쿠폰 list
			Map<String, Object> memberCouponMap = couponService.getMemberCouponList(memberCouponPage, ROW_PER_PAGE, memberId);
			Map<String, Object> couponMap = couponService.getCouponList(couponPage, ROW_PER_PAGE, memberId);
			
			model.addAttribute("ROW_PER_PAGE", ROW_PER_PAGE);
			// 회원이 발급받은 쿠폰 list
			model.addAttribute("memberCouponBeginRow", memberCouponBeginRow);
			model.addAttribute("memberCouponList", memberCouponMap.get("memberCouponList"));
			model.addAttribute("memberCouponlastPage", memberCouponMap.get("lastPage"));
			model.addAttribute("memberCouponPage", memberCouponPage);
			model.addAttribute("memberCouponPageNo", memberCouponPageNo);
			model.addAttribute("memberCouponCount", memberCouponMap.get("totalCount"));
			log.debug("★★★[boryeong]CouponController_memberCouponPageNo★★★" + memberCouponPageNo);
			// 쿠폰 발급가능 list
			model.addAttribute("couponBeginRow", couponBeginRow);
			model.addAttribute("couponList", couponMap.get("couponList"));
			model.addAttribute("couponLastPage", couponMap.get("lastPage"));
			model.addAttribute("couponPage", couponPage);
			model.addAttribute("couponPageNo", couponPageNo);
			model.addAttribute("couponCount", couponMap.get("totalCount"));
			log.debug("★★★[boryeong]CouponController_couponPageNo★★★" + couponPageNo);
			
			
			return "member/coupon";
		}
	// 관리자 쿠폰 list 출력
	@GetMapping("/admin/couponList")
	public String getCouponList(Model model, @RequestParam(defaultValue = "1") int currentPage,String memberId) {
		System.out.println("CouponController()_coupon실행");
		log.debug("★★★[boryeong]CouponController★★★" + currentPage);

		int beginRow = (currentPage * ROW_PER_PAGE) - (ROW_PER_PAGE - 1);

		Map<String, Object> map = couponService.getCouponList(currentPage, ROW_PER_PAGE, memberId);
		// 값
		model.addAttribute("beginRow", beginRow);
		model.addAttribute("ROW_PER_PAGE", ROW_PER_PAGE);
		model.addAttribute("couponList", map.get("couponList"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		int pageNo = ((beginRow / 100) * 10 + 1);
		log.debug("★★★[boryeong]CouponController_pageNo★★★" + pageNo);
		model.addAttribute("pageNo", pageNo);

		return "admin/couponList";
	}
	// 쿠폰 생성
	@GetMapping("/admin/addCoupon")
	public String getAddCoupon() {
		System.out.println("★★★[boryeong]CouponController_GETaddCoupon실행★★★");
		return "admin/addCoupon";
	}
	@PostMapping("/admin/addCoupon")
	public String postAddCoupon(Coupon coupon) {
		System.out.println("★★★[boryeong]CouponController_POSTaddCoupon실행★★★");
		couponService.addCoupon(coupon);
		return "redirect:/admin/couponList";
	}
	// 쿠폰 활성화/비활성화
	@PostMapping("/admin/updateCoupon")
	public String postUpdateCoupon(Coupon coupon) {
		System.out.println("★★★[boryeong]CouponController_POSTUpdateCoupon실행★★★");
		couponService.updateCoupon(coupon);
		return "redirect:/admin/couponList";
	}
}
