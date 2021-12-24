package com.gdu.voyage.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.gdu.voyage.service.CouponService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class CouponDormantScheduler {
	@Autowired
	CouponService couponService;
	
	// 1분마다 실행해서 데드라인을 넘어간 쿠폰을 비활성화 시킨다.
	@Scheduled(cron = "1 * * * * *")
	public void modifyDormantCoupon() {
		
		int row = couponService.updateDormantCoupon();
		if (row > 0) {
			log.debug("※※※※※※※※CouponScheduler※※※※※※※※지금까지 총"+row+"개의 쿠폰이 비활성화 되었습니다.");
		}
	}
	
}
