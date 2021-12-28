package com.gdu.voyage.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	//ISSUE : 들어오는 FILE의 확장자, 네임 분리 필요. FILE의 사이즈 식별 필요
	//고민 사항 : 수정 시 추가로 들어올 파일의 중복 검사는 필요한가?
	
	//Map(notice 리스트,페이징)으로 묶어서 리턴
	public Map<String,Object> getNoticeListByTop(int currentPage,int rowPerPage, String searchNotice){
		Map<String,Object> paramMap = new HashMap<>();
		int beginRow = (currentPage-1)*rowPerPage;
		
		paramMap.put("beginRow",beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchNotice",searchNotice);
	
		List<Notice> noticeList = noticeMapper.selectNoticeList(paramMap);
		log.debug(noticeList.toString()+"☆☆☆[DoHun] NoticeList , Service☆☆☆");
		
		Map<String,Object> returnMap = new HashMap<>();
		int lastPage = 0;
		int totalCount = noticeMapper.selectNoticeTotalCount(searchNotice);
		
		lastPage = totalCount/rowPerPage;
		if(totalCount%rowPerPage != 0) {
			lastPage+=1;
		}
		
		returnMap.put("noticeList", noticeList);
		returnMap.put("lastPage", lastPage);
		
		return returnMap;
	}
	
	//notice one(상세)
	public Notice getNoticeOne(int noticeNo) {
		log.debug(noticeNo+"☆☆☆[DoHun] NoticeOne, Service☆☆☆");
		return noticeMapper.selectNoticeOne(noticeNo);
	}
	
	//insert(내용+사진 입력)
	public Map<String, Object> insertNoticeOne(Notice notice,@RequestParam @Nullable NoticeFile noticeFile, @RequestParam @Nullable NoticeForm noticeForm) {
		Map<String, Object> insertNoticeMap = new HashMap<>();
		
		Notice insertNotice = noticeMapper.inserNotice(notice);
	
		log.debug(insertNotice.toString()+"☆☆☆[DoHun] NoticeMapper insert + insert ,Service☆☆☆");
		
		insertNoticeMap.put("insertNotice",insertNotice);
		
		//파일이 존재한다면 파일 추가
		if(noticeForm.getNoticefile() != null) {
			Notice insertNoticeFile = noticeMapper.insertNoticefile(noticeFile);
			log.debug(insertNoticeMap.toString()+"☆☆☆[DoHun] NoticeFileMapper insert + insert ,Service☆☆☆");
			insertNoticeMap.put("insertNoticeFile",insertNoticeFile);
		}
		log.debug(insertNoticeMap.toString()+"☆☆☆[DoHun] Notice insert + insert Map ,Service☆☆☆");

		return insertNoticeMap;
	}
	
	
	//삭제(내용+사진 삭제)
	public Map<String, Object> deleteNoticeOne(Notice notice, @RequestParam @Nullable NoticeFile noticeFile) {
		Map<String, Object> deleteNoticeMap = new HashMap<>();
		
		log.debug(notice.toString()+"☆☆☆[DoHun] Notice notice + delete Map ,Service☆☆☆");
		Notice deleteNotice = noticeMapper.deleteNotice(notice);
		log.debug(notice.toString()+"☆☆☆[DoHun] Notice delete + delete Map ,Service☆☆☆");
		
		//파일이 존재시 같이 삭제
		if(noticeFile.getNoticeFileNo() >= 1) {
			log.debug(notice.toString()+"☆☆☆[DoHun] NoticeFile notice + delete Map ,Service☆☆☆");
			Notice deleteNoticeFile = noticeMapper.deleteNoticeFile(noticeFile);
			log.debug(notice.toString()+"☆☆☆[DoHun] NoticeFile delete + delete Map ,Service☆☆☆");
			deleteNoticeMap.put("deleteNoticeFile", deleteNoticeFile);
		}
		deleteNoticeMap.put("deleteNotice", deleteNotice);
		
		return deleteNoticeMap;
	}
	
	//수정
	public Notice updateNoticeOne(Notice notice,@RequestParam @Nullable NoticeFile noticeFile ,@RequestParam @Nullable NoticeForm noticeForm) {
		log.debug(notice.toString()+"☆☆☆[DoHun] Notice notice + update Map ,Service☆☆☆");
		noticeMapper.updateNotice(notice);
		log.debug(notice.toString()+"☆☆☆[DoHun] Notice update + update Map ,Service☆☆☆");
		
		//insert(파일 추가)
		if(noticeMapper.insertNoticefile(noticeFile) != null) {
			//보령님이 사용하셨던 코드
			String noticeContent = noticeForm.getNoticeContent();
			List<MultipartFile> file = noticeForm.getNoticefile();
			
			notice.setNoticeContent(noticeContent);
			noticeMapper.inserNotice(notice);
			log.debug(notice.getNoticeNo()+"☆☆☆[bryeong]NoticeService_noticeform☆☆☆");
			
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
			if(noticeFile.getNoticeNo() == notice.getNoticeNo()) {		
				noticeMapper.insertNoticefile(noticeFile);
			}
			try {
				((MultipartFile) file).transferTo(f);
			} catch (IllegalStateException | IOException e) { //IllegalStateException, IOException는 예외처리를 꼭 해야하는데 
															//RuntimeException을 사용해 예외 처리가 필요없는 예외를 던져서 처리
				// TODO Auto-generated catch block
				e.printStackTrace();	
				throw new RuntimeException();// @Transactional이 구동되기 위해선 예외가 발생해야함
			}
		}
			


		//delete(파일 삭제)
		if(noticeMapper.deleteNoticeFile(noticeFile) != null) {
			
			if(noticeFile.getNoticeNo() == notice.getNoticeNo()) {		
				noticeMapper.deleteNoticeFile(noticeFile);
			}
		}
		
		return notice;
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
