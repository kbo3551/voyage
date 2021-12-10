package com.gdu.voyage.mapper;

import java.util.List;
import java.util.Map;

import com.gdu.voyage.vo.AccomBuilding;

public interface AccomBuildingMapper {
	List<AccomBuilding> selectAccomBuildingList(Map<String, Object> param);
}
