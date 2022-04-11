package com.gdu.voyage.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdu.voyage.mapper.adminPaymentCheckMapper;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional
public class adminPaymentCheckService {
	@Autowired adminPaymentCheckMapper paymentCheckMapper;
	//한달 간 숙소,체험 수익
	public long sumPaymentThisMonth() {
		long sumPaymentMonth = paymentCheckMapper.selectAccomProfitOneByAdmin()+paymentCheckMapper.selectActivityProfitByAdmin();
		log.debug("★★★[dohun] Service sumPaymentMonth ★★★" + sumPaymentMonth);
		return sumPaymentMonth;
	}
	//일년 간 숙소, 체험 수익
	public long sumPaymentThisYear() {
		long sumPaymentYear = paymentCheckMapper.selectAccomProfitOneByAdminYear()+paymentCheckMapper.selectActivityProfitByAdminYear();
		log.debug("★★★[dohun] Service sumPaymentYear ★★★" + sumPaymentYear);
		return sumPaymentYear;
	}
	
	//한달 간 숙소,체험 결제 수
	public int sumPersonThisMonth() {
		int sumPersonMonth = paymentCheckMapper.selectAccomUsePersonByAdmin()+paymentCheckMapper.selectActivityUsePersonByAdmin();
		log.debug("★★★[dohun] Service sumPersonMonth ★★★" + sumPersonMonth);
		return sumPersonMonth;
	}
	//일년 간 숙소, 체험 수익
	public int sumPersonThisYear() {
		int sumPersonYear = paymentCheckMapper.selectAccomUsePersonByAdminYear()+paymentCheckMapper.selectActivityUsePersonByAdminYear();
		log.debug("★★★[dohun] Service sumPersonYear ★★★" + sumPersonYear);
		return sumPersonYear;
	}
	//라인 차트 12개월 이내의 각 월 총 수익
	public ArrayList<Integer> paymentMonthlyYear(){		
		ArrayList<Integer> list = new ArrayList<>();
		//12개월 전까지
		for(int i = 0; i < 12 ; i+=1) {
			int paymentMontlyYear = paymentCheckMapper.selectAccomProfitOneByAdminMonthYear(paymentCheckMapper.selectMonth(i))+paymentCheckMapper.selectActivityProfitByAdminMonthYear(paymentCheckMapper.selectMonth(i));
			list.add(paymentMontlyYear);
		}
		return list;
	}
	public ArrayList<String> paymentMonthlyYearCalendar(){		
		ArrayList<String> list = new ArrayList<>();
		//12개월 전까지
		for(int i = 0; i < 12 ; i+=1) {
			list.add(paymentCheckMapper.selectMonth(i));
		}
		return list;
	}
	
	//총 숙소 체험 결제 건수
	public int sumPersonAccom() {
		int sumAccomPerson = paymentCheckMapper.selectAccomUsePersonByAdminAll();
		log.debug("★★★[dohun] Service sumPersonMonth ★★★" + sumAccomPerson);
		return sumAccomPerson;
	}
	public int sumPersonActivity() {
		int sumPersonActivity = paymentCheckMapper.selectActivityUsePersonByAdminAll();
		log.debug("★★★[dohun] Service sumPersonMonth ★★★" + sumPersonActivity);
		return sumPersonActivity;
	}
}