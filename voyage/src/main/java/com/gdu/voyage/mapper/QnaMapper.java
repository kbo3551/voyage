package com.gdu.voyage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.voyage.vo.Qna;
import com.gdu.voyage.vo.QnaAnswer;
import com.gdu.voyage.vo.QnaForm;
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
	
	//[Member] Only member part
	// 질문 수정
	int modifyQ(Qna qna);
	// 질문 삭제
	int removeQ(Qna qna);
	// 질문 추가
	int addQ(QnaForm qnaForm);
	
	//[Member] Image part
	// 이미지 추가
	int addQImg(QnaImg qnaImg);
	// 이미지 삭제
	int removeQImg(QnaImg qnaImg);
	
	// [Member] Q&A 검색
	List<Qna> selectQnaListBySearch(Map<String, Object> param);
	
	// [Admin] Only Admin part
	// 답변 없는 질문 list
	List<Qna> selectNoneAnswerQ(Map<String, Object> param);
	// 답변 추가
	int addA(QnaAnswer qnaAnswer);
}
