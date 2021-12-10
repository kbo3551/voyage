package com.gdu.voyage.mapper;

import java.util.List;
import java.util.Map;

import com.gdu.voyage.vo.Hashtag;

public interface HashtagMapper {
	// 해시태그 가져오기
	List<Hashtag> selectHashtagList(Map<String, Object> param);
}
