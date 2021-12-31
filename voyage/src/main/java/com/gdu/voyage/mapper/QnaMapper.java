package com.gdu.voyage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.voyage.vo.Activity;
import com.gdu.voyage.vo.Qna;
import com.gdu.voyage.vo.QnaAnswer;
import com.gdu.voyage.vo.QnaForm;
import com.gdu.voyage.vo.QnaImg;

@Mapper
public interface QnaMapper {
	//[Member] Only member part
	// Qna 전체 목록
	List<Qna> selectQnaList(Map<String, Object> param);
	// Qna 게시글 수
	int selectQnaTotalCount(String searchWord);
	// 목록 상세 내용
	Qna selectQnaOneAndAnswer(int qnaNo);
	
	// 질문 수정
	int modifyQ(Qna qna);
	// 질문 삭제
	int removeQ(int qnaNo);
	// 질문 추가
	int addQ(Qna qna);
	
	//[Member] Image part
	// 이미지 추가
	int addQImg(QnaImg qnaImg);
	// 이미지 삭제
	int removeQImg(int qnaNo);
	
	// [Admin] Only Admin part
	// 답변 없는 질문 list
	List<Qna> selectNoneAnswerQ(Map<String, Object> param);
	// 답변 추가
	int addA(QnaAnswer qnaAnswer);
}
