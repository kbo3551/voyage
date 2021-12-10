package com.gdu.voyage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.voyage.vo.Qna;

@Mapper
public interface QnaMapper {
	// Qna 전체 목록
	List<Qna> selectQnaListByCategory(Map<String, Object> param);
	// 질문 작성
	int addQ(Qna qna);
	// 질문 수정
	int modifyQ(Qna qna);
	// 질문 삭제
	int removeQ(Qna qna);
}
