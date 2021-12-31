package com.gdu.voyage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gdu.voyage.service.PaymentService;
import com.gdu.voyage.vo.AccomPayment;
import com.gdu.voyage.vo.ActivityPayment;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@CrossOrigin
public class PaymentRestController {
	@Autowired PaymentService paymentService;
	
	// 최근 한달간 체험 일별 수익
	@GetMapping("/selectAccomProfitByMonthToDate")
	public List<ActivityPayment> selectActivityProfitByMonthToDate(int hostNo) {
		 log.trace("PaymentRestController 실행");
		 
		 List<ActivityPayment> activityMonthDateProfit = paymentService.selectActivityProfitByMonthToDate(hostNo);
		 log.trace("★controller★ activityMonthDateProfit : "+activityMonthDateProfit);
		 
		 return activityMonthDateProfit;
	}
	
	// 최근 한달간 숙소 일별 수익
	@GetMapping("/selectAccomProfitByMonthToDate")
	public List<AccomPayment> selectAccomProfitByMonthToDate(int hostNo) {
		 log.trace("PaymentRestController 실행");
		 
		 List<AccomPayment> accomMonthDateProfit = paymentService.selectAccomProfitByMonthToDate(hostNo);
		 log.trace("★controller★ accomMonthDateProfit : "+accomMonthDateProfit);
		 
		 return accomMonthDateProfit;
	}
	
	// 해당 사업자의 분기별(3개월) 가장 많은 수익을 벌어들인 체험
	@GetMapping("/selectActivityProfitByQuarterly")
	public ActivityPayment selectActivityProfitByQuarterly(int hostNo) {
		 log.trace("PaymentRestController 실행");
		 
		 ActivityPayment activityQuarterlyProfit = paymentService.selectActivityProfitByQuarterly(hostNo);
		 log.trace("★controller★ activityQuarterlyProfit : "+activityQuarterlyProfit);
		 
		 return activityQuarterlyProfit;
	}
	
	// 해당 사업자의 분기별(3개월) 가장 많은 수익을 벌어들인 숙소
	@GetMapping("/selectAccomProfitByQuarterly")
	public AccomPayment selectAccomProfitByQuarterly(int hostNo) {
		 log.trace("PaymentRestController 실행");
		 
		 AccomPayment accomQuarterlyProfit = paymentService.selectAccomProfitByQuarterly(hostNo);
		 log.trace("★controller★ accomQuarterlyProfit : "+accomQuarterlyProfit);
		 
		 return accomQuarterlyProfit;
	}
	
	// 사업자 체험 총 수익
	@GetMapping("/selectActivityProfitByHostToMonth")
	public long selectActivityProfitByHostToMonth(int hostNo) {
		 log.trace("PaymentRestController 실행");
		 
		 long activityMonthTotalProfit = paymentService.selectActivityProfitByHostToMonth(hostNo);
		 log.trace("★controller★ activityMonthTotalProfit : "+activityMonthTotalProfit);
		 
		 return activityMonthTotalProfit;
	}
		
	// 사업자 체험 총 수익
	@GetMapping("/selectActivityProfitByHost")
	public long selectActivityProfitByHost(int hostNo) {
		 log.trace("PaymentRestController 실행");
		 
		 long activityTotalProfit = paymentService.selectActivityProfitByHost(hostNo);
		 log.trace("★controller★ activityTotalProfit : "+activityTotalProfit);
		 
		 return activityTotalProfit;
	}
	
	// 사업자 숙소 월별 총 수익
	@GetMapping("/selectAccomProfitByHostToMonth")
	public long selectAccomProfitByHostToMonth(int hostNo) {
		 log.trace("PaymentRestController 실행");
		 
		 long accomMonthTotalProfit = paymentService.selectAccomProfitByHostToMonth(hostNo);
		 log.trace("★controller★ accomMonthTotalProfit : "+accomMonthTotalProfit);
		 
		 return accomMonthTotalProfit;
	}
	
	// 사업자 숙소 총 수익
	@GetMapping("/selectAccomProfitByHost")
	public long selectAccomProfitByHost(int hostNo) {
		 log.trace("PaymentRestController 실행");
		 
		 long accomTotalProfit = paymentService.selectAccomProfitByHost(hostNo);
		 log.trace("★controller★ accomTotalProfit : "+accomTotalProfit);
		 
		 return accomTotalProfit;
	}
	
	// 사업자 월별 총 수익
	@GetMapping("/selectAllProfitByHostToMonth")
	public long selectAllProfitByHostToMonth(int hostNo) {
		 log.trace("PaymentRestController 실행");
		 
		 long totalMonthProfit = paymentService.selectAllProfitByHostToMonth(hostNo);
		 log.trace("★controller★ totalMonthProfit : "+totalMonthProfit);
		 
		 return totalMonthProfit;
	}
	
	// 사업자 총 수익
	@GetMapping("/selectAllProfitByHost")
	public long selectAllProfitByHost(int hostNo) {
		 log.trace("PaymentRestController 실행");
		 
		 long totalProfit = paymentService.selectAccomProfitByHost(hostNo);
		 log.trace("★controller★ totalProfit : "+totalProfit);
		 
		 return totalProfit;
	}
}
