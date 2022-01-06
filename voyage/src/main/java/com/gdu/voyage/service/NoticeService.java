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
	Notice notice = new Notice();
	//고민 사항 : 수정 시 추가로 들어올 파일의 중복 검사는 필요한가?
	
	//Map(notice 리스트,페이징)으로 묶어서 리턴
	public Map<String,Object> getNoticeListByTop(int currentPage,int rowPerPage, String searchNotice){
		//페이징
		Map<String,Object> paramMap = new HashMap<>();
		int beginRow = (currentPage-1)*rowPerPage;
		
		paramMap.put("beginRow",beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchNotice",searchNotice);
		//리스트. 페이징에 필요한 값을 put
		List<Notice> noticeList = noticeMapper.selectNoticeList(paramMap);
		log.debug(noticeList.toString()+"☆☆☆[DoHun] NoticeList , Service☆☆☆");
		//페이징할 값을 가공(최종 페이지)
		Map<String,Object> returnMap = new HashMap<>();
		int lastPage = 0;
		int totalCount = noticeMapper.selectNoticeTotalCount(searchNotice);
		
		lastPage = totalCount/rowPerPage;
		if(totalCount%rowPerPage != 0) {
			lastPage+=1;
		}
		//마지막 페이지 페이징과 페이징에필요했던 put한 noticeList를 put
		returnMap.put("noticeList", noticeList);
		returnMap.put("lastPage", lastPage);
		//페이징값이 전부들어간 값 리턴
		return returnMap;
	}
	
	//notice one(상세)
	public Notice getNoticeOne(int noticeNo) {
		log.debug(noticeNo+"☆☆☆[DoHun] NoticeOne, Service☆☆☆");
		return noticeMapper.selectNoticeOne(noticeNo);
	}
	//insert(내용+사진 입력)
	public void insertNoticeOne(NoticeForm noticeForm, String realPath) {
		log.debug(noticeForm+"☆☆☆[DoHun] NoticeInsert, Insert☆☆☆");
		//입력하는 코드
		Notice notice = noticeForm.getNotice();

		noticeMapper.insertNotice(notice);
		
		MultipartFile file=noticeForm.getNoticeFile();
		if(file != null) {	
			NoticeFile noticeFile = new NoticeFile();
			noticeFile.setNoticeNo(notice.getNoticeNo());
			String originalFileName=file.getOriginalFilename();
			int p = originalFileName.lastIndexOf(".");
			String ext = originalFileName.substring(p+1);
			String prename=UUID.randomUUID().toString().replace("-", "");
			String filename = prename;
			
			noticeFile.setNoticeFileName(filename);
			noticeFile.setNoticeFileExt(ext);
			noticeFile.setNoticeFileSize(file.getSize());
			log.debug(noticeFile.toString()+"☆☆☆[DoHun] NoticeInsert, Insert☆☆☆");
			
			noticeMapper.insertNoticefile(noticeFile);
			
			File f= new File(realPath+filename+"."+ext);
			try {
				file.transferTo(f);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
				throw new RuntimeException();
			}
			log.debug(f+"☆☆☆[DoHun] NoticeInsert, file☆☆☆");
			
		}
	}
	
	
	//삭제(내용+사진 삭제)
	public void deleteNoticeOne(int noticeNo) {
		noticeMapper.deleteNoticeFile(noticeNo);
		noticeMapper.deleteNotice(noticeNo);
	}
	
	//수정
	public void updateNoticeOne(NoticeForm noticeForm, String realPath) {
		
		Notice notice = noticeForm.getNotice();
		
		noticeMapper.updateNotice(notice);		
	
		MultipartFile file=noticeForm.getNoticeFile();
		if(file != null) {	
			NoticeFile noticeFile = new NoticeFile();
			noticeFile.setNoticeNo(notice.getNoticeNo());
			String originalFileName=file.getOriginalFilename();
			int p = originalFileName.lastIndexOf(".");
			String ext = originalFileName.substring(p+1);
			String prename=UUID.randomUUID().toString().replace("-", "");
			String filename = prename;
			
			noticeFile.setNoticeFileName(filename);
			noticeFile.setNoticeFileExt(ext);
			noticeFile.setNoticeFileSize(file.getSize());
			log.debug(noticeFile.toString()+"☆☆☆[DoHun] NoticeInsert, Insert☆☆☆");
			
			noticeMapper.insertNoticefile(noticeFile);
			
			File f= new File(realPath+filename+"."+ext);
			try {
				file.transferTo(f);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
				throw new RuntimeException();
			}
			log.debug(f+"☆☆☆[DoHun] NoticeInsert, file☆☆☆");
			
		}
	}
	//사진삭제
	public void deleteUpdateNoticeFile(int noticeNo){
		noticeMapper.deleteNoticeFile(noticeNo);
	}
	
	//조회수증가
	public void updateNoticeViewCnt(int noticeNo, int noticeViewCnt) {
		noticeMapper.updateNoticeViewCnt(noticeNo, noticeViewCnt);
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
