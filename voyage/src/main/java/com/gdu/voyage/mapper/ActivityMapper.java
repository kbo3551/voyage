package com.gdu.voyage.mapper;

import java.util.List;
import java.util.Map;

import com.gdu.voyage.vo.Activity;

public interface ActivityMapper {
	List<Activity> selectActivityList(Map<String, Object> param);
	
}
