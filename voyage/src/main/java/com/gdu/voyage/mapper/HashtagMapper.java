package com.gdu.voyage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.voyage.vo.Hashtag;

@Mapper
public interface HashtagMapper {
	// 해시태그 전체 조회
	List<Hashtag> selectHashtagList();
	// 해시태그 검색 결과 조회
	List<Hashtag> selectHashtagListByResult(String hashtag);
	// 해시태그 검색
	List<Map<String, Object>> selectHashtagListBySearch(String searchKeyword);
}