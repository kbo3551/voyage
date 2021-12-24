package com.gdu.voyage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.voyage.vo.AccomPayment;

@Mapper
public interface AccomPaymentMapper {
	// 숙소 결제 목록
	List<AccomPayment> selectAccomPayment(Map<String, Object> map);
	// 페이징을 위한 갯수
	int selectCountPage(String memberId);
	
}
