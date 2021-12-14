package com.gdu.voyage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdu.voyage.mapper.ActivityMapper;
import com.gdu.voyage.vo.Activity;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class ActivityService {
	@Autowired
	private ActivityMapper activityMapper;

	// 숙소 등록 목록 조회
	public List<Activity> getActivityList(int pageNo) {
		pageNo = (pageNo - 1) * 10;
		log.debug(activityMapper.selectActivityList(pageNo) + "***********[상훈] activityService");
		return activityMapper.selectActivityList(pageNo);
	}

	// 페이징
	public int[] countPage(int currentPage) {
		int[] num = new int[10];
		int listNum = activityMapper.selectCountPage();
		listNum = (listNum / 10) + (listNum % 10);
		for (int i = 1; i <= 10; i++) {
			if (currentPage <= 10) {
				num[i - 1] = (currentPage / 10) + i;
			} else {
				if (listNum == ((currentPage / 10) * 10) + i) {
					break;
				}
				num[i - 1] = ((currentPage / 10) * 10) + i;
			}
		}
		return num;
	}
}
