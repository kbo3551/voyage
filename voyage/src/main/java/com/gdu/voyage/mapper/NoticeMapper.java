package com.gdu.voyage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.voyage.vo.Notice;
import com.gdu.voyage.vo.NoticeFile;

@Mapper
public interface NoticeMapper {
	int selectNoticeTotalCount(String searchNotice);
	// 리스트 가져오기
	List<Notice> selectNoticeList(Map<String, Object> map);
	// 공지사항 작성
	void insertNotice(Notice notice);
	// 공지사항 삭제
	void deleteNotice(int noticeNo);
	// 공지사항 수정
	void updateNotice(Notice notice);
	// 공지사항 One
	Notice selectNoticeOne(int noticeNo);
	// 공지사항 파일
	List<NoticeFile> selectNoticeFileList();
	//파일 단계에서 사용되는 추가 삭제
	void insertNoticefile(NoticeFile noticefile);
	void deleteNoticeFile(int noticeNo);
	
	//조회수
	void updateNoticeViewCnt(int noticeNo,int noticeViewCnt);
}
