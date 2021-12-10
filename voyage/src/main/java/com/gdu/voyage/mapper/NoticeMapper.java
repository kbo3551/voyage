package com.gdu.voyage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.voyage.vo.Notice;

@Mapper
public interface NoticeMapper {
	// 리스트 가져오기
	List<Notice> selectNoticeList(Map<String, Object> param);
	
	// 공지사항 작성
	int inserNotice(Notice notice);
	// 공지사항 삭제
	void deleteNotice(Notice notice);
	// 공지사항 수정
	void updateNotice(Notice notice);
	// 공지사항 One
	Notice selectNoticeOne(int noticeNo);
	
}