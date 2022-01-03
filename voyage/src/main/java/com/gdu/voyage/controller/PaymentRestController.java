package com.gdu.voyage.controller;

import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gdu.voyage.service.PaymentService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class PaymentRestController {
	@Autowired PaymentService paymentService;
	
	
	
	// 사업자 -- 
	
	// 최근 한달간 체험 일별 수익
	@GetMapping("/selectActivityProfitByMonthToDate")
	public TreeMap<String, Object> selectActivityProfitByMonthToDate(int hostNo) {
		 log.trace("PaymentRestController 실행");
		 
		 TreeMap<String, Object> activityMonthDateProfit = paymentService.selectActivityProfitByMonthToDate(hostNo);
		 log.trace("★controller★ activityMonthDateProfit : "+activityMonthDateProfit);
		 
		 return activityMonthDateProfit;
	}
	
	// 최근 한달간 숙소 일별 수익
	@GetMapping("/selectAccomProfitByMonthToDate")
	public TreeMap<String, Object> selectAccomProfitByMonthToDate(int hostNo) {
		 log.trace("PaymentRestController 실행");
		 
		 TreeMap<String, Object> accomMonthDateProfit = paymentService.selectAccomProfitByMonthToDate(hostNo);
		 log.trace("★controller★ accomMonthDateProfit : "+accomMonthDateProfit);
		 return accomMonthDateProfit;
	}
	
	// 해당 사업자의 분기별(3개월) 가장 많은 수익을 벌어들인 체험
	@GetMapping("/selectActivityProfitByQuarterly")
	public String selectActivityProfitByQuarterly(int hostNo) {
		 log.trace("PaymentRestController 실행");
		 
		 String activityQuarterlyProfit = paymentService.selectActivityProfitByQuarterly(hostNo).getActivity().getActivityName();
		 log.trace("★controller★ activityQuarterlyProfit : "+activityQuarterlyProfit);
		 
		 return activityQuarterlyProfit;
	}
	
	// 해당 사업자의 분기별(3개월) 가장 많은 수익을 벌어들인 숙소
	@GetMapping("/selectAccomProfitByQuarterly")
	public String selectAccomProfitByQuarterly(int hostNo) {
		 log.trace("PaymentRestController 실행");
		 
		 String accomQuarterlyProfit = paymentService.selectAccomProfitByQuarterly(hostNo).getAccomBuilding().getAccomBuildingName();
		 log.trace("★controller★ accomQuarterlyProfit : "+accomQuarterlyProfit);
		 
		 return accomQuarterlyProfit;
	}
	
	// 사업자 체험 월 수익
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
		 
		 long totalProfit = paymentService.selectAllProfitByHost(hostNo);
		 log.trace("★controller★ totalProfit : "+totalProfit);
		 
		 return totalProfit;
	}
}
