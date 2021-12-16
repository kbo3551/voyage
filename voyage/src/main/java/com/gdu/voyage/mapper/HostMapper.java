package com.gdu.voyage.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.voyage.vo.HostAsk;

@Mapper
public interface HostMapper {
	void insertRequestHost(HostAsk hostAsk);
	int selectRequestingHost(String memberId);
}
