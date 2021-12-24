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
	// 관리자가 쿠폰 생성후 생성일이 데드라인을 지나면 비활성화 처리
	int updateDormantCoupon();

}
