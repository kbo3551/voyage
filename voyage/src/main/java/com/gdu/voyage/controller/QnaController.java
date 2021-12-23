package com.gdu.voyage.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdu.voyage.service.QnaService;
import com.gdu.voyage.vo.Member;
import com.gdu.voyage.vo.Qna;
import com.gdu.voyage.vo.QnaAnswer;
import com.gdu.voyage.vo.QnaForm;
import com.gdu.voyage.vo.QnaImg;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class QnaController {
	@Autowired QnaService qnaService;
	private Integer currentPage = 1;
	private final int ROW_PER_PAGE = 10;
	
	// [Member] Qna 게시판 목록 조회
	@GetMapping("/qnaList")
	public String qnaList(Model model, HttpSession session,
			@RequestParam(defaultValue="1") int currentPage,
			@RequestParam(required = false) String qnaCategory) {
		System.out.println("qnaListController() 실행");
		Map<String, Object> map = qnaService.getQnaListByCategory(qnaCategory, currentPage, ROW_PER_PAGE);
		// 로그인한 회원의 아이디, 닉네임을 가져오기 위해 해당 값을 세션에서 가져옴
		Member loginMember = (Member)session.getAttribute("loginMember");
		// 디버그 코드
		log.debug("★★★★★★★★★★★ [다원] qnaList_loginMember_Controller() debug" + loginMember.toString());
		int[] navArray = qnaService.countPage(currentPage);
		model.addAttribute("qnaList", map.get("qnaList"));
		model.addAttribute("navArray", navArray);
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", map.get("currentPage"));
		model.addAttribute("totalCount", map.get("totalCount"));
		model.addAttribute("loginMember", loginMember);
		// 관리자 계정이면 관리자 Q&A 전체 목록 페이지로 이동
		// 그 외 회원이면 일반 Q&A 전체 목록 페이지로 이동
		if(loginMember.getMemberLevel() == 2) {
			return "/admin/adminQnaList";
		} else {
			return "/templates_citylisting/qnaList";
		}
	}
	//[Member] Qna 상세 내용
	@GetMapping("/getQnaOne") 
	public String getQnaOne(HttpSession session, Model model, int qnaNo, String memberId) {
		
		System.out.println("getQnaOneController() 실행");
		Member loginMember = (Member)session.getAttribute("loginMember");
		log.debug(qnaNo + "★★★★★★★★★★★ [다원] getQnaOne_qnaNo_Controller() debug");
		Qna qna = qnaService.getQnaOneAndAnswer(qnaNo);
		
		QnaAnswer qnaAnswer = null;
		
	    log.debug(qna + "★★★★★★★★★★★ [다원] getQnaOne_qna_Controller() debug");
	    /*
	     * 	model.addAttribute("memberId", memberId);
	    	model.addAttribute("qnaNo", qnaNo);
	    */
	    model.addAttribute("qna", qna);
	    model.addAttribute("loginMember", loginMember);
	    
	    // 관리자 계정이면 관리자 Q&A 내용 상세 보기 페이지로 이동
	 	// 그 외 회원이면 일반 Q&A 내용 상세 보기 페이지로 이동
	 	if(loginMember.getMemberLevel() == 2) {
	 		return "/admin/adminQnaOne";
	 	} else {
	 		return "/templates_citylisting/getQnaOne";
	 	}
	}
	// [Member] 질문 작성 get
	@GetMapping("/addQ")
	public String addQ() {
		System.out.println("addQuestionController() 실행");
		return "/templates_citylisting/addQ";
	}
	// [Member] 질문 작성 post
	@PostMapping("/addQ")
	public String addQ(HttpSession session, QnaForm qnaForm, Qna qna, QnaImg qnaImg) throws Exception {
		// memberId, memberNickname값을 세션에서 가져옴
		Member loginMember = (Member) session.getAttribute("loginMember");
		String memberId = loginMember.getMemberId();
		String memberNickname = loginMember.getMemberNickname();
		// qna에 받아온 값 셋팅
		qna.setMemberId(memberId);
		qna.setMemberNickname(memberNickname);
		// 디버그 코드
		log.debug("★★★★★★★★★★★ [다원] qna_Controller() debug" + qna.toString());
		log.debug("★★★★★★★★★★★ [다원] qnaImg_Controller() debug" + qnaImg.toString());
		qnaService.addQ(qnaForm, qna, qnaImg);
		return "redirect:/qnaList?pageNo=1";
	}
	// [Member] 질문 수정
	@GetMapping("/modifyQ")
	public String modifyQ(Model model, int qnaNo) {
		System.out.println("modifyQuestionController() 실행");
		Qna qna = qnaService.getQnaOneAndAnswer(qnaNo);
		model.addAttribute("qna", qna);
		return "/templates_citylisting/modifyQ";
	}
	@PostMapping("/modifyQ")
	public String modifyQ(Qna qna, QnaImg qnaImg) {
		log.debug("★★★★★★★★★★★ [다원] qna_modifyQ_Controller() debug" + qnaService.modifyQ(qna, qnaImg));
		qnaService.modifyQ(qna, qnaImg);
		return "redirect:/getQnaOne?qnaNo=" + qna.getQnaNo();
	}
	// [Member] 질문 삭제
	@GetMapping("/removeQ")
	public String removeQ(Model model, int qnaNo) {
		System.out.println("removeQuestionController() 실행");
		Qna qna = qnaService.getQnaOneAndAnswer(qnaNo);
		model.addAttribute("qna", qna);
		return ("/templates_citylisting/removeQ");
	}
	@PostMapping("removeQ")
	public String removeQ(Qna qna) {
		qnaService.removeQ(qna);
		return "redirect:/qnaList?pageNo=1";
	}
}