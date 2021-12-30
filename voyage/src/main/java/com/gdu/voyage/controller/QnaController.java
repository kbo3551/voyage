package com.gdu.voyage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
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
	private int currentPage = 1;
	private final int ROW_PER_PAGE = 4;
	
	// [Member] Qna 게시판 목록 조회
	@GetMapping("/qnaList")
	public String qnaList(Model model, 
			@RequestParam(defaultValue="1") int currentPage,
			@RequestParam(required = false) String qnaCategory,
			@RequestParam @Nullable String searchWord) {
		log.debug("qnaListController() 실행");
		
		int controllPage = (currentPage * ROW_PER_PAGE) - (ROW_PER_PAGE - 1);
		int pageNo = ((controllPage / 100) * 10 + 1);
		Map<String, Object> map = qnaService.getQnaList(qnaCategory, searchWord, currentPage, ROW_PER_PAGE);
		
		model.addAttribute("ROW_PER_PAGE", ROW_PER_PAGE);
		model.addAttribute("controllPage", controllPage);
		model.addAttribute("qnaList", map.get("qnaList"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", map.get("currentPage"));
		model.addAttribute("pageNo", pageNo);
		
		return "/templates_citylisting/qnaList";
	}

	//[Member] Qna 상세 내용
	@GetMapping("/getQnaOne") 
	public String getQnaOne(HttpSession session, Model model, int qnaNo, String memberId) {
		
		log.debug("getQnaOneController() 실행");
		Member loginMember = (Member)session.getAttribute("loginMember");
		log.debug(qnaNo + "★★★★★★★★★★★ [다원] getQnaOne_qnaNo_Controller() debug");
		Qna qna = qnaService.getQnaOneAndAnswer(qnaNo);
	    log.debug(qna + "★★★★★★★★★★★ [다원] getQnaOne_qna_Controller() debug");
	    model.addAttribute("qna", qna);
	 	// 비밀글 기능
	 	// 비회원인 경우
	 	if(qna.getQnaSecret().equals("비밀글") && loginMember == null) {
	 		return "redirect:/login";
	 		// 로그인했지만 작성자가 아닌 경우 
	 	} else if(qna.getQnaSecret().equals("비밀글") && !qna.getMemberNickname().equals(loginMember.getMemberNickname())) {
	 		return "redirect:/qnaList";
	 		// 그 외...
	 	} else {
	 		return "/templates_citylisting/getQnaOne";
	 	}
	}

	// [Member] 질문 작성 get
	@GetMapping("/addQ")
	public String addQ(HttpSession session) {
		log.debug("addQuestionController() 실행");
		// session에서 로그인한 회원 정보 가져옴
		Member loginMember = (Member)session.getAttribute("loginMember");
		// 비회원일 경우, 로그인 후 이용 가능
		if(loginMember == null) {
			return "redirect:/login";
		}
		return "/templates_citylisting/addQ";
	}
	// [Member] 질문 작성 post
	@PostMapping("/addQ")
	public String addQ(HttpServletRequest request, QnaForm qnaForm) throws Exception {
		// memberId, memberNickname값을 세션에서 가져옴
		Member loginMember = (Member) request.getSession().getAttribute("loginMember");
		String memberId = loginMember.getMemberId();
		// 디버그 코드
		log.debug("★★★★★★★★★★★ [다원] addQ_loginMember_Controller() debug" + loginMember.toString());
		// qnaForm에 받아온 값 셋팅
		qnaForm.setMemberId(memberId);
		// 디버그 코드
		log.debug("★★★★★★★★★★★ [다원] addQ_qnaForm_Controller() debug" + qnaForm.toString());
		// 이미지 파일 절대 경로 설정
		String realPath = request.getServletContext().getRealPath("resources/image/qna//");
		
		qnaService.addQ(qnaForm, realPath);
		
		return "redirect:/qnaList?pageNo=1";
	}
	// [Member] 질문 수정
	@GetMapping("/modifyQ")
	public String modifyQ(HttpSession session, Model model, int qnaNo) {
		log.debug("modifyQuestionController() 실행");
		Member loginMember = (Member)session.getAttribute("loginMember");
		Qna qna = qnaService.getQnaOneAndAnswer(qnaNo);
		model.addAttribute("qna", qna);
		// 비밀글 기능
		// 비회원인 경우
		if(qna.getQnaSecret().equals("비밀글") && loginMember == null) {
			return "redirect:/login";
		// 로그인했지만 작성자가 아닌 경우 
		} else if(!qna.getMemberNickname().equals(loginMember.getMemberNickname())) {
			return "redirect:/qnaList";
		// 그 외...
		} else {
			return "/templates_citylisting/modifyQ";
		}
	}

	@PostMapping("/modifyQ")
	public String modifyQ(Qna qna, QnaImg qnaImg) {
		log.debug("★★★★★★★★★★★ [다원] qna_modifyQ_Controller() debug" + qnaService.modifyQ(qna, qnaImg));
		qnaService.modifyQ(qna, qnaImg);
		return "redirect:/getQnaOne?qnaNo=" + qna.getQnaNo();
	}
	// [Member] 질문 삭제
	@GetMapping("/removeQ")
	public String removeQ(HttpSession session, Model model, int qnaNo) {
		log.debug("removeQuestionController() 실행");
		Member loginMember = (Member)session.getAttribute("loginMember");
		Qna qna = qnaService.getQnaOneAndAnswer(qnaNo);
		model.addAttribute("qna", qna);
		// 비밀글 기능
		// 비회원인 경우
		if(qna.getQnaSecret().equals("비밀글") && loginMember == null) {
			return "redirect:/login";
		// 로그인했지만 작성자가 아닌 경우 
		} else if(!qna.getMemberNickname().equals(loginMember.getMemberNickname())) {
			return "redirect:/qnaList";
		// 그 외...
		} else {
			return ("/templates_citylisting/removeQ");
		}
	}
		
	@PostMapping("/removeQ")
	public String removeQ(Qna qna) {
		qnaService.removeQ(qna);
		return "redirect:/qnaList?pageNo=1";
	}
	
	// [Admin] 전체 Q&A 게시판 목록 출력
	@GetMapping("/admin/adminQnaList")
	public String adminQnaList(Model model, HttpSession session,
			@RequestParam(defaultValue="1") int currentPage,
			@RequestParam(required = false) String qnaCategory,
			@RequestParam @Nullable String searchWord) {
		log.debug("adminQnaList_Controller() 실행");
		// 로그인한 회원의 아이디, 닉네임을 가져오기 위해 해당 값을 세션에서 가져옴
		Member loginMember = (Member)session.getAttribute("loginMember");
		// 디버그 코드
		log.debug("★★★★★★★★★★★ [다원] adminQnaList_loginMember_Controller() debug" + loginMember.toString());
		
		int controllPage = (currentPage * ROW_PER_PAGE) - (ROW_PER_PAGE - 1);
		int pageNo = ((controllPage / 100) * 10 + 1);
		
		Map<String, Object> map = qnaService.getQnaList(qnaCategory, searchWord, currentPage, ROW_PER_PAGE);
		
		model.addAttribute("ROW_PER_PAGE", ROW_PER_PAGE);
		model.addAttribute("controllPage", controllPage);
		model.addAttribute("qnaList", map.get("qnaList"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", map.get("currentPage"));
		model.addAttribute("loginMember", loginMember);
		model.addAttribute("pageNo", pageNo);
		// 관리자 계정이면 관리자 Q&A 전체 목록 페이지로 이동
		// 그 외 회원이면 일반 Q&A 전체 목록 페이지로 이동
		if(loginMember.getMemberLevel() == 2) {
			return "/admin/adminQnaList";
		} else {
			return "/templates_citylisting/qnaList";
		}
	}
	// [Admin] 답변 없는 질문 목록 조회
	/*
	@GetMapping("/admin/adminIndex")
	public String getQListNoneA(
			@RequestParam(defaultValue="1") int currentPage,
			@RequestParam(required = false) String qnaCategory) {
		
		log.debug("getQListNoneA_Controller() 실행");
		
		Map <String, Object> noneAMap = qnaService.getNoneAnswerQ(currentPage, ROW_PER_PAGE, qnaCategory);
		
		return "/admin/adminIndex";
	}
	*/
	// [Admin] Q&A 내용 상세 조회
	@GetMapping("/admin/adminQnaOne") 
	public String getAdminQnaOne(HttpSession session, Model model, int qnaNo, String memberId) {
		
		log.debug("getQnaOneController() 실행");
		Member loginMember = (Member)session.getAttribute("loginMember");
		log.debug(qnaNo + "★★★★★★★★★★★ [다원] getQnaOne_qnaNo_Controller() debug");
		Qna qna = qnaService.getQnaOneAndAnswer(qnaNo);
		
	    log.debug(qna + "★★★★★★★★★★★ [다원] getQnaOne_qna_Controller() debug");
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
	
	// [Admin] 답변 작성
	@GetMapping("/admin/addA")
	public String addA(QnaAnswer qnaAnswer) {
		log.debug("addAnswerController() 실행");
		return "/admin/addA";
	}
	@PostMapping("/admin/addA")
	public String addAnswer(HttpSession session, QnaAnswer qnaAnswer) {
		// 세션에서 관리자 계정 정보 불러옴
		Member loginMember = (Member)session.getAttribute("loginMember");
		qnaAnswer.setAdminId(loginMember.getMemberId());
		// 디버그 코드
		log.debug("★★★★★★★★★★★ [다원] getQnaOne_qna_Controller() debug" + qnaAnswer.toString());
		qnaService.addA(qnaAnswer);
		return "redirect:/admin/adminQnaList?pageNo=1";
	}
}