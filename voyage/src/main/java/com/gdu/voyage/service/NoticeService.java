package com.gdu.voyage.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
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
	
	public List<NoticeFile> getNoticeFileList(){
		return noticeMapper.selectNoticeFileList();
	}
	public void addNotice(NoticeForm noticeForm) {
		log.debug(noticeForm.toString()+"☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆[보령]NoticeService_noticeform");
		String noticeContent = noticeForm.getNoticeContent();
		List<MultipartFile> file = noticeForm.getNoticefile();
		
		// 공지사항 입력
		Notice notice = new Notice();
		notice.setNoticeContent(noticeContent);
		noticeMapper.insertNotice(notice);
		log.debug(notice.getNoticeNo()+"☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆[보령]NoticeService_noticeform");

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
		File f = new File(""+fileName+"."+fileExt); // 경로 아직 공백...
		try {
			((MultipartFile) file).transferTo(f);
		} catch (IllegalStateException | IOException e) { /*IllegalStateException, IOException는 예외처리를 꼭 해야하는데 
															RuntimeException을 사용해 예외 처리가 필요없는 예외를 던져서 처리*/
			// TODO Auto-generated catch block
			e.printStackTrace();	
			throw new RuntimeException();// @Transactional이 구동되기 위해선 예외가 발생해야함
			}
		}
	}
}
