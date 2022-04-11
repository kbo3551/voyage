package com.gdu.voyage.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gdu.voyage.service.adminPaymentCheckService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@Transactional
public class adminPaymentCheckController {
	@Autowired adminPaymentCheckService paymentCheckService;
	
	@GetMapping("/admin/adminIndex")
	public String adminIndexChartData(Model model) {
		//수익
		long totalPaymentMonth = paymentCheckService.sumPaymentThisMonth();
		long totalPaymentYear = paymentCheckService.sumPaymentThisYear();
		//결제건수
		int totalPersonMonth = paymentCheckService.sumPersonThisMonth();
		int totalPersonYear = paymentCheckService.sumPersonThisYear();
		//12개월 이내의 각 월 수익
		ArrayList<Integer> payList= paymentCheckService.paymentMonthlyYear();
		ArrayList<String> calendarList= paymentCheckService.paymentMonthlyYearCalendar();
		//총 체험 숙소 결제건수
		int totalPersonAccom = paymentCheckService.sumPersonAccom();
		int totalPersonActivity = paymentCheckService.sumPersonActivity();
		
		model.addAttribute("totalPaymentMonth", totalPaymentMonth);
		model.addAttribute("totalPaymentYear", totalPaymentYear);
		model.addAttribute("totalPersonMonth", totalPersonMonth);
		model.addAttribute("totalPersonYear", totalPersonYear);
		model.addAttribute("payList",payList);
		model.addAttribute("calendarList",calendarList);
		model.addAttribute("totalPersonAccom",totalPersonAccom);
		model.addAttribute("totalPersonActivity",totalPersonActivity);
		
		log.debug("★★★[dohun] admin index chart data ★★★" + model);
		
		return "/admin/adminIndex";
	}
}