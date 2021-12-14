package com.gdu.voyage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.voyage.vo.Activity;
@Mapper
public interface ActivityMapper {
	// 체험 조회 list
		List<Activity> selectActivityList(int pageNo);
		int selectCountPage();
	
}
