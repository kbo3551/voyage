package com.gdu.voyage.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.gdu.voyage.service.CouponService;
import com.gdu.voyage.vo.Coupon;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class CouponDormantScheduler {
	@Autowired
	CouponService couponService;
	
	// 매분1초 마다 실행해서 데드라인을 넘어간 쿠폰을 비활성화 시킨다.(과도한 콘솔창으로 임시적으로 매일 12에 실행)
	@Scheduled(cron = "0 0 0 * * *")
	public void modifyDormantCoupon() {
		
		int row = couponService.updateDormantCoupon();
		if (row > 0) {
			log.debug("※※※※CouponScheduler※※※※"+row+"개의 쿠폰이 비활성화 되었습니다.");
		}
	}
	// 매분1초 마다 실행해서 데드라인을 넘어간 쿠폰을 사용불가 시킨다.(과도한 콘솔창으로 임시적으로 매일 정각에 실행)
	@Scheduled(cron = "0 0 0 * * *")
	public void modifyDormantMemberCoupon() {

		int row = couponService.updateDormantMemberCoupon();
		if (row > 0) {
			log.debug("※※※※CouponScheduler※※※※"+row+"개의 쿠폰이 사용불가 되었습니다.");
		}
	}
}
