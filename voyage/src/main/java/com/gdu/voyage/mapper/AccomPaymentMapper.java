package com.gdu.voyage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.voyage.vo.AccomPayment;

@Mapper
public interface AccomPaymentMapper {
	List<AccomPayment> selectAccomPayment(Map<String, Object> map);
}
