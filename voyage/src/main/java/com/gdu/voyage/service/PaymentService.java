package com.gdu.voyage.service;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdu.voyage.mapper.PaymentMapper;
import com.gdu.voyage.vo.AccomPayment;
import com.gdu.voyage.vo.ActivityPayment;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class PaymentService {
	@Autowired private PaymentMapper paymentMapper;
	
	// 이번달 사업자 수수료
	public long selectHostMonthFees(int hostNo) {
		long result = 0;
		if(paymentMapper.selectAllProfitByHost(hostNo, 2) != null) {
			result = (long) paymentMapper.selectAllProfitByHost(hostNo, 2);
		}
		return result;
	}
	
	// 이번달 체험 예약인원
	public int selectActivityUsePerson(int hostNo) {
		int result = 0;
		if(paymentMapper.selectActivityUsePerson(hostNo) != null) {
			result = paymentMapper.selectActivityUsePerson(hostNo);
		}
		return result;
	}
	
	// 이번달 숙소 예약인원
	public int selectAccomUsePerson(int hostNo) {
		int result = 0;
		if(paymentMapper.selectAccomUsePerson(hostNo) != null) {
			result = paymentMapper.selectAccomUsePerson(hostNo);
		}
		return result;
	}
	
	// 해당 사업자의 저번달과 비교한 체험 월 수익
	public String selectActivityProfitCompareByMonth(int hostNo) {
		DecimalFormat formatter = new DecimalFormat("###,###");
		String str = "<span class='text-success'>0 </span><span class='text-muted'>Since last Month</span>";
		long result = 0;
		if(paymentMapper.selectActivityProfitCompare(hostNo, 1) != null) {
			result = (long) paymentMapper.selectActivityProfitCompare(hostNo, 1);
		}
		if(result > 0) {
			str = "<span class='text-success'>"+formatter.format(result)+" </span><span class='text-muted'>Since last Month</span>";
		}
		if(result < 0) {
			str = "<span class='text-danger'>"+formatter.format(result)+" </span><span class='text-muted'>Since last Month</span>";
		}
		return str;
	}
	
	// 해당 사업자의 저번주와 비교한 체험 수익
	public String selectActivityProfitCompare(int hostNo) {
		DecimalFormat formatter = new DecimalFormat("###,###");
		String str = "<span class='text-success'>0 </span><span class='text-muted'>Since last week</span>";
		long result = 0;
		if(paymentMapper.selectActivityProfitCompare(hostNo, null) != null) {
			result = (long) paymentMapper.selectActivityProfitCompare(hostNo, null);
		}
		if(result > 0) {
			str = "<span class='text-success'>"+formatter.format(result)+" </span><span class='text-muted'>Since last week</span>";
		}
		if(result < 0) {
			str = "<span class='text-danger'>"+formatter.format(result)+" </span><span class='text-muted'>Since last week</span>";
		}
		return str;
	}
	
	// 해당 사업자의 저번달과 비교한 숙소 월 수익
	public String selectAccomProfitCompareByMonth(int hostNo) {
		DecimalFormat formatter = new DecimalFormat("###,###");
		String str = "<span class='text-success'>0 </span><span class='text-muted'>Since last Month</span>";
		long result = 0;
		if(paymentMapper.selectAccomProfitCompare(hostNo, 1) != null) {
			result = (long) paymentMapper.selectAccomProfitCompare(hostNo, 1);
		}
		if(result > 0) {
			str = "<span class='text-success'>"+formatter.format(result)+" </span><span class='text-muted'>Since last Month</span>";
		}
		if(result < 0) {
			str = "<span class='text-danger'>"+formatter.format(result)+" </span><span class='text-muted'>Since last Month</span>";
		}
		return str;
	}
	
	// 해당 사업자의 저번주와 비교한 숙소 수익
	public String selectAccomProfitCompare(int hostNo) {
		DecimalFormat formatter = new DecimalFormat("###,###");
		String str = "<span class='text-success'>0 </span><span class='text-muted'>Since last week</span>";
		long result = 0;
		if(paymentMapper.selectAccomProfitCompare(hostNo, null) != null) {
			result = (long) paymentMapper.selectAccomProfitCompare(hostNo, null);
		}
		if(result > 0) {
			str = "<span class='text-success'>"+formatter.format(result)+" </span><span class='text-muted'>Since last week</span>";
		}
		if(result < 0) {
			str = "<span class='text-danger'>"+formatter.format(result)+" </span><span class='text-muted'>Since last week</span>";
		}
		return str;
	}
	
	// 해당 사업자의 저번달과 비교한 월 수익
	public String selectAllProfitCompareByMonth(int hostNo) {
		DecimalFormat formatter = new DecimalFormat("###,###");
		String str = "<span class='text-success'>0 </span><span class='text-muted'>Since last month</span>";
		long result = 0;
		if(paymentMapper.selectAllProfitCompare(hostNo, 1) != null) {
			result = (long) paymentMapper.selectAllProfitCompare(hostNo, 1);
		}
		if(result > 0) {
			str = "<span class='text-success'>"+formatter.format(result)+" </span><span class='text-muted'>Since last month</span>";
		}
		if(result < 0) {
			str = "<span class='text-danger'>"+formatter.format(result)+" </span><span class='text-muted'>Since last month</span>";
		}
		return str;
	}
	
	// 해당 사업자의 저번주와 비교한 총 수익
	public String selectAllProfitCompare(int hostNo) {
		DecimalFormat formatter = new DecimalFormat("###,###");
		String str = "<span class='text-success'>0 </span><span class='text-muted'>Since last week</span>";
		long result = 0;
		if(paymentMapper.selectAllProfitCompare(hostNo, null) != null) {
			result = (long) paymentMapper.selectAllProfitCompare(hostNo, null);
		}
		if(result > 0) {
			str = "<span class='text-success'>"+formatter.format(result)+" </span><span class='text-muted'>Since last week</span>";
		}
		if(result < 0) {
			str = "<span class='text-danger'>"+formatter.format(result)+" </span><span class='text-muted'>Since last week</span>";
		}
		return str;
	}
	
	// TreeMap - 자동 정렬 기능이 달려있는 Map
	
	// 최근 한달간 체험 일별 수익
	public TreeMap<String, Object> selectActivityProfitByMonthToDate(int hostNo) {
		
		List<ActivityPayment> activityPayments = paymentMapper.selectActivityProfitByMonthToDate(hostNo, null);
		
		TreeMap<String, Object> map = new TreeMap<String, Object>();
		
		for(int i=0;i<activityPayments.size();i++) {
			ActivityPayment param = activityPayments.get(i);
			map.put(param.getUpdateDate().toString(), param.getActivityAmount());
		}
		
		return map;
	}
	
	// 최근 한달간 숙소 일별 수익
	public TreeMap<String, Object> selectAccomProfitByMonthToDate(int hostNo) {
		
		List<AccomPayment> accomPayments = paymentMapper.selectAccomProfitByMonthToDate(hostNo, null);
		
		TreeMap<String, Object> map = new TreeMap<String, Object>();
		
		for(int i=0;i<accomPayments.size();i++) {
			AccomPayment param = accomPayments.get(i);
			map.put(param.getUpdateDate().toString(), param.getAccomAmount());
		}
		
		return map;
	}
	
	// 해당 사업자의 월별 가장 많은 수익을 벌어들인 체험
	public ActivityPayment selectActivityProfitByQuarterly(int hostNo) {
		return paymentMapper.selectActivityProfitByQuarterly(hostNo);
	}
	
	// 해당 사업자의 월별 가장 많은 수익을 벌어들인 숙소
	public AccomPayment selectAccomProfitByQuarterly(int hostNo) {
		return paymentMapper.selectAccomProfitByQuarterly(hostNo);
	}
	
	// 해당 사업자의 체험 월별 총 수익
	public long selectActivityProfitByHostToMonth(int hostNo) {
		long result = 0;
		if(paymentMapper.selectActivityProfitByHost(hostNo, 1) != null) {
			result = (long) paymentMapper.selectActivityProfitByHost(hostNo, 1);
		}
		return result;
	}
	
	// 해당 사업자의 체험 총 수익
	public long selectActivityProfitByHost(int hostNo) {
		long result = 0;
		if(paymentMapper.selectActivityProfitByHost(hostNo, null) != null) {
			result = (long) paymentMapper.selectActivityProfitByHost(hostNo, null);
		}
		return result;
	}
	
	// 해당 사업자의 숙소 월별 총 수익
	public long selectAccomProfitByHostToMonth(int hostNo) {
		long result = 0;
		if(paymentMapper.selectAccomProfitByHost(hostNo, 1) != null) {
			result = (long) paymentMapper.selectAccomProfitByHost(hostNo, 1);
		}
		return result;
	}
	
	// 해당 사업자의 숙소 총 수익
	public long selectAccomProfitByHost(int hostNo) {
		long result = 0;
		if(paymentMapper.selectAccomProfitByHost(hostNo, null) != null) {
			result = (long) paymentMapper.selectAccomProfitByHost(hostNo, null);
		}
		return result;
	}
	
	// 해당 사업자의 월별 총 수익
	public long selectAllProfitByHostToMonth(int hostNo) {
		long result = 0;
		if(paymentMapper.selectAllProfitByHost(hostNo, 1) != null) {
			result = (long) paymentMapper.selectAllProfitByHost(hostNo, 1);
		}
		return result;
	}
	
	// 해당 사업자의 총 수익
	public long selectAllProfitByHost(int hostNo) {
		long result = 0;
		if(paymentMapper.selectAllProfitByHost(hostNo, null) != null) {
			result = (long) paymentMapper.selectAllProfitByHost(hostNo, null);
		}
		return result;
	}
	
	// 체험 결제 취소
	public int cancelActivityPayment(int activityPaymentNo) {
		return paymentMapper.cancelActivityPayment(activityPaymentNo);
	}
	
	// 숙소 결제 취소
	public int cancelAccomPayment(int accomPaymentNo) {
		return paymentMapper.cancelAccomPayment(accomPaymentNo);
	}
	
	// 체험 주문 상세
	public ActivityPayment selActivityPaymentOne(int activityPaymentNo) {
		return paymentMapper.selectActivityPaymentOne(activityPaymentNo);
	}
	
	// 숙소 주문 상세
	public AccomPayment selectAccomPaymentOne(int accomPaymentNo) {
		return paymentMapper.selectAccomPaymentOne(accomPaymentNo);
	}
	
	// 체험 주문 내역
	public Map<String, Object> selectActivityPayment(int currentPage, int rowPerPage,String memberId) {
		Map<String, Object> paraMap = new HashMap<>();
		int beginRow = (currentPage-1) * rowPerPage;
		
		paraMap.put("beginRow", beginRow);
		paraMap.put("rowPerPage", rowPerPage);
		paraMap.put("memberId", memberId);
		
		log.trace("☆service☆"+paraMap);
		
		List<ActivityPayment> activityPaymentList = paymentMapper.selectActivityPayment(paraMap);
		
		Map<String, Object> returnMap = new HashMap<>();
		
		int lastPage = 0;
		int totalCount = paymentMapper.selectActivityCountPage(memberId);
		
		lastPage = totalCount / rowPerPage;
		
		if(totalCount % rowPerPage !=0) {
			lastPage += 1;
		}
		
		returnMap.put("activityPaymentList", activityPaymentList);
		returnMap.put("lastPage", lastPage);
		returnMap.put("totalCount", totalCount);
		
		log.trace("☆service☆"+returnMap);
		
		return returnMap;
	}
	
	
	// 숙소 주문 내역
	public Map<String, Object> selectAccomPayment(int currentPage, int rowPerPage,String memberId) {
		Map<String, Object> paraMap = new HashMap<>();
		int beginRow = (currentPage-1) * rowPerPage;
		
		paraMap.put("beginRow", beginRow);
		paraMap.put("rowPerPage", rowPerPage);
		paraMap.put("memberId", memberId);
		
		log.trace("☆service☆"+paraMap);
		
		List<AccomPayment> accomPaymentList = paymentMapper.selectAccomPayment(paraMap);
		
		Map<String, Object> returnMap = new HashMap<>();
		
		int lastPage = 0;
		int totalCount = paymentMapper.selectAccomCountPage(memberId);
		
		lastPage = totalCount / rowPerPage;
		
		if(totalCount % rowPerPage !=0) {
			lastPage += 1;
		}
		
		returnMap.put("accomPaymentList", accomPaymentList);
		returnMap.put("lastPage", lastPage);
		returnMap.put("totalCount", totalCount);
		
		log.trace("☆service☆"+returnMap);
		
		return returnMap;
	}
}
