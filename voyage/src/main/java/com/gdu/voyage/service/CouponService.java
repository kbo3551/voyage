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

	// 쿠폰 list 출력
	public Map<String, Object> getCouponList(int currentPage, int rowPerPage) {

		Map<String, Object> paraMap = new HashMap<>();
		int beginRow = (currentPage - 1) * rowPerPage;

		paraMap.put("beginRow", beginRow);
		paraMap.put("rowPerPage", rowPerPage);

		List<Coupon> couponList = couponMapper.selectCouponList(paraMap);

		Map<String, Object> returnMap = new HashMap<>();

		int lastPage = 0;
		int totalCount = couponMapper.couponTotalCount();

		lastPage = totalCount / rowPerPage;

		if (totalCount % rowPerPage != 0) {
			lastPage += 1;
		}

		returnMap.put("couponList", couponList);
		returnMap.put("lastPage", lastPage);
		return returnMap;
	}

	// 쿠폰 생성
	public void addCoupon(Coupon coupon) {
		log.debug("☆☆☆[bryeong]CouponService 쿠폰 생성☆☆☆" + coupon.toString());
		couponMapper.insertCoupon(coupon);
	}
	// 쿠폰 활성화/비활성화
	public void updateCoupon(Coupon coupon) {
		log.debug("☆☆☆[bryeong]CouponService 쿠폰 생성☆☆☆");
		couponMapper.updateCoupon(coupon);
	}
}
