package com.gdu.voyage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.voyage.vo.Qna;
import com.gdu.voyage.vo.QnaImg;

@Mapper
public interface QnaMapper {
	// [Member&Admin] Q&A part
	// Qna 전체 목록
	List<Qna> selectQnaListByCategory(Map<String, Object> param);
	// Qna 게시글 수
	int selectQnaTotalCount(String qnaCategory);
	// 페이지 수
	int selectCountPage();
	// 목록 상세 내용
	Qna selectQnaOneAndAnswer(int qnaNo);
	// memberId를 매개로 memberNickname select
	String selectMemberNickname(Qna qna);
	
	//[Member] Only member part
	// 질문 수정
	int modifyQ(Qna qna);
	// 질문 삭제
	int removeQ(Qna qna);
	// 질문 추가
	int addQ(Qna qna);
	
	//[Member] Image part
	// 이미지 추가
	int addQImg(QnaImg qnaImg);
	// 이미지 수정
	int modifyQImg(QnaImg qnaImg);
	// 이미지 삭제
	int removeQImg(QnaImg qnaImg);

}
