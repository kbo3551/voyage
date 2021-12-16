package com.gdu.voyage.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.gdu.voyage.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class MemberDormantScheduler {
	@Autowired MemberService memberService;
	
	// 매일 0시 0분 0초마다 처리 실행
	@Scheduled(cron = "0 0 0 * * *")
	public void modifyDormantMember() {
		int row = memberService.updateDormantMember();
		if (row > 0) {
			log.trace("◎Scheduler◎ : "+row+"명의 멤버가 휴면처리 되었습니다.");
		} 
		
	}

}
