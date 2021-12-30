package com.gdu.voyage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdu.voyage.mapper.CouponMapper;
import com.gdu.voyage.vo.Coupon;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class CouponService {
	@Autowired
	CouponMapper couponMapper;
	// 회원이 발급 받는 쿠폰중 데드라인을 넘어서면 사용불가 처리
	public int updateDormantMemberCoupon() {
		return couponMapper.updateDormantMemberCoupon();
	}
	// 쿠폰 데드라인 기준으로 현재 일이 데드라인을 넘어서면 비활성화 처리
	public int updateDormantCoupon() {
		return couponMapper.updateDormantCoupon();
	}
	// 쿠폰 list 출력
	public Map<String, Object> getCouponList(int currentPage, int rowPerPage,String memberId) {

		Map<String, Object> paraMap = new HashMap<>();
		int beginRow = (currentPage - 1) * rowPerPage;

		paraMap.put("beginRow", beginRow);
		paraMap.put("rowPerPage", rowPerPage);

		List<Coupon> couponList = couponMapper.selectCouponList(paraMap);
		Map<String, Object> returnMap = new HashMap<>();

		int lastPage = 0;
		int totalCount = couponMapper.couponTotalCount(memberId);

		lastPage = totalCount / rowPerPage;

		if (totalCount % rowPerPage != 0) {
			lastPage += 1;
		}

		returnMap.put("couponList", couponList);
		returnMap.put("lastPage", lastPage);
		returnMap.put("totalCount",totalCount);
		paraMap.put("memberId", memberId);
		return returnMap;
	}

	// 쿠폰 생성
	public void addCoupon(Coupon coupon) {
		log.debug("☆☆☆[boryeong]CouponService 쿠폰 생성☆☆☆" + coupon.toString());
		couponMapper.insertCoupon(coupon);
	}
	// 쿠폰 활성화/비활성화
	public void updateCoupon(Coupon coupon) {
		log.debug("☆☆☆[boryeong]CouponService 쿠폰 생성☆☆☆");
		couponMapper.updateCoupon(coupon);
	}
	// 회원이 발급받은 쿠폰 list
	public Map<String, Object> getMemberCouponList(int currentPage, int rowPerPage,String memberId) {

		Map<String, Object> paraMap = new HashMap<>();
		int beginRow = (currentPage - 1) * rowPerPage;

		paraMap.put("beginRow", beginRow);
		paraMap.put("rowPerPage", rowPerPage);
		paraMap.put("memberId", memberId);

		List<Coupon> memberCouponList = couponMapper.selectMemberCouponList(paraMap);
		Map<String, Object> returnMap = new HashMap<>();

		int lastPage = 0;
		int totalCount = couponMapper.memberCouponTotalCount(memberId);

		lastPage = totalCount / rowPerPage;

		if (totalCount % rowPerPage != 0) {
			lastPage += 1;
		}

		returnMap.put("memberCouponList", memberCouponList);
		returnMap.put("lastPage", lastPage);
		returnMap.put("totalCount",totalCount);
		
		return returnMap;
	}
}
