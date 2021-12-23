package com.gdu.voyage.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.gdu.voyage.service.AccomBuildingService;
import com.gdu.voyage.service.ActivityService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class ProductDormantScheduler {
	@Autowired AccomBuildingService accomBuildingService;
	@Autowired ActivityService activityService;
	// 
		@Scheduled(cron = "0 0 0 * * *")
		public void modifyDormantAccomBuilding() {
			int row = accomBuildingService.updateDormantAccomBuilding();
			if (row > 0) {
				log.trace("◎Scheduler◎ : "+row+"개의 숙소가 삭제 처리 되었습니다.");
			} 
		}
	
	// 
		@Scheduled(cron = "0 0 0 * * *")
		public void modifyDormantActivity() {
			int row = activityService.updateDormantActivity();
			if (row > 0) {
				log.trace("◎Scheduler◎ : "+row+"개의 체험이 삭제 처리 되었습니다.");
			} 		
		}
}
