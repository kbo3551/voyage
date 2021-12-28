package com.gdu.voyage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gdu.voyage.service.PaymentService;
import com.gdu.voyage.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Controller
public class PaymentController {
	@Autowired PaymentService paymentService;
	
	@GetMapping("payment/paymentCancel")
	public String calcelPayment(HttpSession session,Model model, String memberId, @Nullable String accomPaymentNo, @Nullable String activityPaymentNo) {
		log.trace("PaymentController() 실행");
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		// 방어코드
		if(!(memberId.equals(loginMember.getMemberId()))) {
			model.addAttribute("msg", "잘못된 접근입니다.");
		    model.addAttribute("url", "redirect:/index");
		    return "/alert";
		}

		if(accomPaymentNo != null) {
			int accomPaymentNoInt = Integer.parseInt(accomPaymentNo);
			paymentService.cancelAccomPayment(accomPaymentNoInt);
			model.addAttribute("msg", "취소가 완료되었습니다.\n환불까지는 은행사 사정에 따라 1~2일정도 걸립니다.");
		    model.addAttribute("url", "redirect:member/selectMyOrderList");
		    return "/alert";
		}
		if(activityPaymentNo != null) {
			int activityPaymentNoInt = Integer.parseInt(activityPaymentNo);
			paymentService.cancelActivityPayment(activityPaymentNoInt);
			model.addAttribute("msg", "취소가 완료되었습니다.\n환불까지는 은행사 사정에 따라 1~2일정도 걸립니다.");
		    model.addAttribute("url", "redirect:member/selectMyOrderList");
		    return "/alert";
		}
		
		return "member/selectMyOrderList";
	}
}
