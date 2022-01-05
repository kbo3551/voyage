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

import com.gdu.voyage.mapper.AccomReviewMapper;
import com.gdu.voyage.vo.AccomBuilding;
import com.gdu.voyage.vo.AccomReview;
import com.gdu.voyage.vo.AccomReviewImage;
import com.gdu.voyage.vo.AccomReviewForm;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class AccomReviewService {
	@Autowired AccomReviewMapper accomReviewMapper;

	// 숙소 후기 작성
		public void addAccomReview(AccomReviewForm accomReviewForm, String realPath, int accomPaymentNo,  String memberId, String memberNickname,int accomReviewStar) throws Exception {

			log.debug("*****[상훈] AccomReviewService debug" + accomReviewForm.toString());
			//accomReview에 accomPaymentDetails 저장
			AccomReview accomReview = accomReviewForm.getAccomReview();
			accomReview.setMemberId(memberId);
			accomReview.setMemberNickname(memberNickname);
			accomReview.setAccomPaymentDetails(accomPaymentNo);
			accomReview.setAccomReviewStar(accomReviewStar);
			// 후기글 등록
			accomReviewMapper.addAccomReview(accomReview);
			// 이미지 추가에 사용할 accomReviewNo 값 확인
			log.debug("*****[상훈] AccomReviewService_AccomReviewNo debug" + accomReview.getAccomReviewNo());
			// 이미지 추가
			List <MultipartFile> aList = accomReviewForm.getAccomReviewImage();
			// 이미지가 업로드 되었을 경우
			if(aList != null) {
				for(MultipartFile i : aList) {
					AccomReviewImage accomReviewImage = new AccomReviewImage();
					accomReviewImage.setAccomReviewNo(accomReview.getAccomReviewNo());
					// 원본 이미지 파일 이름
					String originalImagename = i.getOriginalFilename(); 
					// 마지막 점의 위치
					int p = originalImagename.lastIndexOf("."); 
					String ext = originalImagename.substring(p+1);
					// 중복되지 않는 문자 이름 생성
					String prename = UUID.randomUUID().toString().replace("-", "");
					String imagename = prename;
					// qnaImg에 imgName, imgExt, imgSize 셋팅
					accomReviewImage.setAccomReviewImageName(imagename);
					accomReviewImage.setAccomReviewImageExt(ext);
					accomReviewImage.setAccomReviewImageSize(i.getSize());
					// qnaImg 값 디버깅 코드
					log.debug("*****[상훈] AccomReviewService_AccomReviewImage debug" + accomReviewImage.toString());
					// 테이블에 값 저장
					accomReviewMapper.addAccomReviewImage(accomReviewImage);
					
					File f = new File(realPath+imagename+"."+ext);
					try {
						i.transferTo(f);
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
						// IllegalStateException | IOException e 예외처리를 무조건 해야하는 예외
						// RuntimeException은 예외처리를 하지 않아도 됨
						throw new RuntimeException();
					}
				}
			}
		}
	
	public int selectReviewTotalCountOne(int accomPaymentNo) {
		return accomReviewMapper.selectReviewTotalCount(accomPaymentNo);
	}
		
	// 숙소 후기 목록
	public Map<String, Object> getAccomReviewList(Integer accomPaymentNo, int currentPage, int rowPerPage) {

		Map<String, Object> paraMap = new HashMap<>();
		int beginRow = (currentPage - 1) * rowPerPage;
		
		paraMap.put("beginRow", beginRow);
		paraMap.put("rowPerPage", rowPerPage);

		List<AccomReview> accomReviewList = accomReviewMapper.selectAccomReviewList(paraMap);
		
		Map<String, Object> returnMap = new HashMap<>();
		
		int lastPage = 0;
		int totalCount = accomReviewMapper.selectReviewTotalCount(accomPaymentNo);
		
		lastPage = (totalCount / rowPerPage);
		if (totalCount % rowPerPage != 0) {
			lastPage += 1;
		}
		returnMap.put("accomReviewList", accomReviewList);
		returnMap.put("lastPage", lastPage);
		returnMap.put("totalCount", totalCount);
		
		return returnMap;

	}
	//조회수
	public void accomReviewViewCnt(int accomReviewNo, int accomReviewViewCnt) {
		accomReviewMapper.accomReviewViewCnt(accomReviewNo, accomReviewViewCnt);
	}
	// 숙소 후기 상세보기
	public AccomReview getAccomReviewOne(int accomReviewNo) {
		log.debug(accomReviewNo + "***********[상훈] accomReviewService One");
		return accomReviewMapper.selectAccomReviewOne(accomReviewNo);
			}
}
