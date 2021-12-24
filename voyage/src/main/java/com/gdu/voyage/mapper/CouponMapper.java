package com.gdu.voyage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.voyage.vo.Coupon;

@Mapper
public interface CouponMapper {
	// 쿠폰 list
	List<Coupon> selectCouponList(Map<String, Object> Map);
	// 쿠폰 수
	int couponTotalCount();
	// 쿠폰 생성
	void insertCoupon(Coupon coupon);
	// 쿠폰 활성/비활성
	void updateCoupon(Coupon coupon);
}
