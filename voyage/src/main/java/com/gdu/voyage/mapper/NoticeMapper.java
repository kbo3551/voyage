package com.gdu.voyage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.voyage.vo.Notice;
import com.gdu.voyage.vo.NoticeFile;

@Mapper
public interface NoticeMapper {
	int selectNoticeTotalCount();
	// 리스트 가져오기
	List<Notice> selectNoticeList(Map<String, Object> param);
	// 공지사항 작성
	Notice inserNotice(Notice notice);
	// 공지사항 삭제
	Notice deleteNotice(Notice notice);
	// 공지사항 수정
	Notice updateNotice(Notice notice);
	// 공지사항 One
	Notice selectNoticeOne(int noticeNo);
	// 공지사항 파일
	List<NoticeFile> selectNoticeFileList();
	
	Notice insertNoticefile(NoticeFile noticefile);
	Notice deleteNoticeFile(NoticeFile noticefile);
}