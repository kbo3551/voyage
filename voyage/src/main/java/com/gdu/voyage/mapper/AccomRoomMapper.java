package com.gdu.voyage.mapper;

import java.util.List;
import java.util.Map;

import com.gdu.voyage.vo.AccomRoom;

public interface AccomRoomMapper {
	List<AccomRoom> selectAccomRoomList(Map<String, Object> param);
}
