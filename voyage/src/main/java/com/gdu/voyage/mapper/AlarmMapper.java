package com.gdu.voyage.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.voyage.vo.Alarm;

@Mapper
public interface AlarmMapper {
	// 알림 추가
	int insertAlarm(Alarm alarm);
}
