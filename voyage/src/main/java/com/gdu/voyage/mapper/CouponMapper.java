package com.gdu.voyage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.voyage.vo.Coupon;
import com.gdu.voyage.vo.CouponMember;

@Mapper
public interface CouponMapper {
	// 쿠폰 list
	List<Coupon> selectCouponList(Map<String, Object> Map);
	// 쿠폰 수
	int couponTotalCount(String memberId);
	// 쿠폰 생성
	void insertCoupon(Coupon coupon);
	// 쿠폰 활성/비활성
	void updateCoupon(Coupon coupon);
	// 관리자가 쿠폰 생성후 생성일이 데드라인을 지나면 비활성화 처리
	int updateDormantCoupon();
	// 회원이 가지고 있는 쿠폰중 데드라인이 넘어간 쿠폰을 사용불가 처리
	int updateDormantMemberCoupon();
	// 회원이 가지고 있는 쿠폰 list
	List<Coupon> selectMemberCouponList(Map<String, Object>Map);
	// 회원이 가지고있는 쿠폰의 수
	int memberCouponTotalCount(String memberId);
	// 회원 쿠폰 발급
	void insertMemberCoupon(CouponMember couponMember);
}
