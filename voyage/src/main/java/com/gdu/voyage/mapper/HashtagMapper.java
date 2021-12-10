package com.gdu.voyage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.voyage.vo.Hashtag;

@Mapper
public interface HashtagMapper {
	// 해시태그 가져오기
	List<Hashtag> selectHashtagList();
}
