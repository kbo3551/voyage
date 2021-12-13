package com.gdu.voyage.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.gdu.voyage.mapper.NoticeMapper;
import com.gdu.voyage.vo.Notice;
import com.gdu.voyage.vo.NoticeFile;
import com.gdu.voyage.vo.NoticeForm;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class NoticeService {
	@Autowired NoticeMapper noticeMapper;
	
	public Map<String,Object> getNoticeListByTop(int currentPage,int rowPerPage){
		Map<String,Object> paramMap = new HashMap<>();
		int beginRow = (currentPage-1)*rowPerPage;
		paramMap.put("beginRow",beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		
		
		List<Notice> notcieList = noticeMapper.selectNoticeList(paramMap);
		log.debug(notcieList.toString()+"☆☆☆[DoHun] NoticeList☆☆☆");
		Map<String,Object> returnMap = new HashMap<>();
		int lastPage = 0;
		int totalCount = noticeMapper.selectNoticeTotalCount();
		lastPage = totalCount/rowPerPage;
		if(totalCount%rowPerPage != 0) {
			lastPage+=1;
		}
		returnMap.put("notcieList", notcieList);
		returnMap.put("lastPage", lastPage);
	
		return returnMap;
	}
	
	/*
	public List<NoticeFile> getNoticeFileList(){
		return noticeMapper.selectNoticeFileList();
	}
	// 공지사항 입력
	public void addNotice(NoticeForm noticeForm) {
		log.debug(noticeForm.toString()+"☆☆☆[bryeong]NoticeService_noticeform☆☆☆");
		String noticeContent = noticeForm.getNoticeContent();
		List<MultipartFile> file = noticeForm.getNoticefile();
		

		Notice notice = new Notice();
		notice.setNoticeContent(noticeContent);
		noticeMapper.inserNotice(notice);
		log.debug(notice.getNoticeNo()+"☆☆☆[bryeong]NoticeService_noticeform☆☆☆");

	// 파일 업로드가 되면
	if(file != null) {
		// Noticefile 입력
		NoticeFile noticefile = new NoticeFile();
		noticefile.setNoticeNo(notice.getNoticeNo());
		
		String fileName = UUID.randomUUID().toString();
		noticefile.setNoticeFileName(fileName);
		
		
		String originName = ((MultipartFile) file).getOriginalFilename();// 원본이름
		int p = originName.lastIndexOf(".");	// .의 위치
		String fileExt = originName.substring(p+1);
		noticefile.setNoticeFileExt(fileExt); // 뒤에서 .까지
		noticefile.setNoticeFileSize(file.size());
		noticeMapper.insertNoticefile(noticefile);
		// 파일 저장 
		File f = new File("E:\\A1\\voyage\\voyage\\src\\main\\file\\notice"+fileName+"."+fileExt); // 임시 경로 
		try {
			((MultipartFile) file).transferTo(f);
		} catch (IllegalStateException | IOException e) { //IllegalStateException, IOException는 예외처리를 꼭 해야하는데 
														//RuntimeException을 사용해 예외 처리가 필요없는 예외를 던져서 처리
			// TODO Auto-generated catch block
			e.printStackTrace();	
			throw new RuntimeException();// @Transactional이 구동되기 위해선 예외가 발생해야함
			}
		}
	
	}
	*/
}
