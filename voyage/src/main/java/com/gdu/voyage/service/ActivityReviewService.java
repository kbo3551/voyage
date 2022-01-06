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

import com.gdu.voyage.mapper.ActivityReviewMapper;
import com.gdu.voyage.vo.AccomReview;
import com.gdu.voyage.vo.ActivityReview;
import com.gdu.voyage.vo.ActivityReviewForm;
import com.gdu.voyage.vo.ActivityReviewImage;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class ActivityReviewService {
	@Autowired
	ActivityReviewMapper activityReviewMapper;

	// 숙소 후기 작성
	public void addActivityReview(ActivityReviewForm activityReviewForm, String realPath, int activityPaymentNo, String memberId, String memberNickname) throws Exception {

		log.debug("*****[상훈] ActivityReviewService debug" + activityReviewForm.toString());
	
		ActivityReview activityReview = activityReviewForm.getActivityReview();
		activityReview.setMemberId(memberId);
		activityReview.setMemberNickname(memberNickname);
		activityReview.setActivityPaymentDetails(activityPaymentNo);

		// 후기글 등록
		activityReviewMapper.addActivityReview(activityReview);
		// 이미지 추가에 사용할 activityReviewNo 값 확인
		log.debug("*****[상훈] ActivityReviewService_ActivityReviewNo debug" + activityReview.getActivityReviewNo());
		// 이미지 추가
		List<MultipartFile> aList = activityReviewForm.getActivityReviewImage();
		// 이미지가 업로드 되었을 경우
		if (aList != null) {
			for (MultipartFile i : aList) {
				ActivityReviewImage activityReviewImage = new ActivityReviewImage();
				activityReviewImage.setActivityReviewNo(activityReview.getActivityReviewNo());
				// 원본 이미지 파일 이름
				String originalImagename = i.getOriginalFilename();
				// 마지막 점의 위치
				int p = originalImagename.lastIndexOf(".");
				String ext = originalImagename.substring(p + 1);
				// 중복되지 않는 문자 이름 생성
				String prename = UUID.randomUUID().toString().replace("-", "");
				String imagename = prename;
				// qnaImg에 imgName, imgExt, imgSize 셋팅
				activityReviewImage.setActivityReviewImageName(imagename);
				activityReviewImage.setActivityReviewImageExt(ext);
				activityReviewImage.setActivityReviewImageSize(i.getSize());
				// qnaImg 값 디버깅 코드
				log.debug("*****[상훈] ActivityReviewService_ActivityReviewImage debug" + activityReviewImage.toString());
				// 테이블에 값 저장
				activityReviewMapper.addActivityReviewImage(activityReviewImage);

				File f = new File(realPath + imagename + "." + ext);
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

	public int selectReviewTotalCountOne(int activityPaymentNo) {
		return activityReviewMapper.selectReviewTotalCount(activityPaymentNo, null);
	}

	// 체험 후기 목록
	public Map<String, Object> getActivityReviewList(Integer activityPaymentNo, int currentPage, int rowPerPage, String searchReview) {

		Map<String, Object> paraMap = new HashMap<>();
		int beginRow = (currentPage - 1) * rowPerPage;

		paraMap.put("beginRow", beginRow);
		paraMap.put("rowPerPage", rowPerPage);
		paraMap.put("searchReview", searchReview);

		List<ActivityReview> activityReviewList = activityReviewMapper.selectActivityReviewList(paraMap);

		Map<String, Object> returnMap = new HashMap<>();

		int lastPage = 0;
		int totalCount = activityReviewMapper.selectReviewTotalCount(activityPaymentNo, searchReview);

		lastPage = (totalCount / rowPerPage);
		if (totalCount % rowPerPage != 0) {
			lastPage += 1;
		}
		returnMap.put("activityReviewList", activityReviewList);
		returnMap.put("lastPage", lastPage);
		returnMap.put("totalCount", totalCount);
		returnMap.put("searchReview", searchReview);

		return returnMap;

	}
	//조회수
	public void activityReviewViewCnt(int activityReviewNo) {
		activityReviewMapper.activityReviewViewCnt(activityReviewNo);
	}
	
	// 체험 후기 상세보기
	public ActivityReview getActivityReviewOne(int activityReviewNo) {
		log.debug(activityReviewNo + "***********[상훈] activityReviewService One");
		return activityReviewMapper.selectActivityReviewOne(activityReviewNo);
			}

}
