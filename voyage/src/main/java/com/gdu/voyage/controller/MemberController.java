package com.gdu.voyage.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gdu.voyage.service.AccomBuildingService;
import com.gdu.voyage.service.ActivityService;
import com.gdu.voyage.service.LoginService;
import com.gdu.voyage.service.MemberService;
import com.gdu.voyage.service.PaymentService;
import com.gdu.voyage.vo.AccomBuildingInterest;
import com.gdu.voyage.vo.ActivityInterest;
import com.gdu.voyage.vo.Admin;
import com.gdu.voyage.vo.Host;
import com.gdu.voyage.vo.Member;
import com.gdu.voyage.vo.MemberAddress;

import lombok.extern.slf4j.Slf4j;


// 회원탈퇴는 pwCheck에 포함돼있음
@Slf4j
@Transactional
@Controller
public class MemberController {
	
	private final int ROW_PER_PAGE = 5;
	
	@Autowired MemberService memberService;
	@Autowired LoginService loginService;
	@Autowired PaymentService paymentService;
	@Autowired AccomBuildingService accomBuildingService;
	@Autowired ActivityService activityService;
	
	// 관심상품 제거
	@GetMapping("member/deleteMyInterest")
	public String deleteMyInterest(HttpSession session, String category,
			@Nullable String activityNo, @Nullable String accomBuildingNo) {
		log.trace("MemberController() 실행");
		Member m = (Member) session.getAttribute("loginMember");
		
		if(category.equals("건물")) {
			accomBuildingService.deleteAccomBuildingByInterest(Integer.parseInt(accomBuildingNo),m.getMemberId());
			log.trace(accomBuildingNo,m.getMemberId());
		} else if(category.equals("체험")) {
			activityService.deleteActivityByInterest(Integer.parseInt(activityNo),m.getMemberId());
		}
		
		return "redirect:/member/selectMyInterest";
	}
	
	// 관심상품목록
	@GetMapping("member/selectMyInterest")
	public String getSelectMyInterestList(Model model, @RequestParam(name = "category", defaultValue = "all") String category,
			  	@RequestParam(defaultValue = "1") int accomPage, @RequestParam(defaultValue = "1") int activityPage,
			  	HttpSession session) {
		log.trace("MemberController() 실행");
		
		
		// memberId
		String memberId = ((Member) session.getAttribute("loginMember")).getMemberId();
		
		// 숙소 페이징
    	int accomBeginRow = (accomPage * ROW_PER_PAGE) - (ROW_PER_PAGE - 1);
    	int accomPageNo = ((accomBeginRow / 100) * 10 + 1);
    	
    	// 체험 페이징
    	int activityBeginRow = (activityPage * ROW_PER_PAGE) - (ROW_PER_PAGE - 1);
    	int activityPageNo = ((activityBeginRow / 100) * 10 + 1);
    	
    	// memberId에 따른 숙소, 체험 관심 목록+페이징
    	Map<String, Object> accomMap = accomBuildingService.selectAccomBuildingByInterest(accomPage, ROW_PER_PAGE, memberId);
    	Map<String, Object> activityMap = activityService.selectActivityByInterest(activityPage, ROW_PER_PAGE, memberId);
    	
    	model.addAttribute("ROW_PER_PAGE", ROW_PER_PAGE);
    	
    	// 숙소
    	model.addAttribute("accomBeginRow", accomBeginRow);
		model.addAttribute("accomInterestedList", accomMap.get("interestedAccomBuildingList"));
		model.addAttribute("accomLastPage", accomMap.get("lastPage"));
		model.addAttribute("accomCount", accomMap.get("totalCount"));
		model.addAttribute("accomPage", accomPage);
		model.addAttribute("accomPageNo", accomPageNo);
		
		// 체험
    	model.addAttribute("activityBeginRow", activityBeginRow);
		model.addAttribute("activityInterestedList", activityMap.get("interestedActivityList"));
		model.addAttribute("activityLastPage", activityMap.get("lastPage"));
		model.addAttribute("activityCount", activityMap.get("totalCount"));
		model.addAttribute("activityPage", activityPage);
		model.addAttribute("activityPageNo", activityPageNo);
		
		return "member/selectMyInterest";
	}
	
	// 주문목록
	@GetMapping("member/selectMyOrderList")
	public String getSelectMyOrderList(Model model, @RequestParam(name = "category", defaultValue = "all") String category,
				  @RequestParam(defaultValue = "1") int accomPage, @RequestParam(defaultValue = "1") int activityPage,
				  HttpSession session) {
		log.trace("MemberController() 실행");
		
		// memberId
		String memberId = ((Member) session.getAttribute("loginMember")).getMemberId();
		
		// 숙소 페이징
    	int accomBeginRow = (accomPage * ROW_PER_PAGE) - (ROW_PER_PAGE - 1);
    	int accomPageNo = ((accomBeginRow / 100) * 10 + 1);
    	
    	// 체험 페이징
    	int activityBeginRow = (activityPage * ROW_PER_PAGE) - (ROW_PER_PAGE - 1);
    	int activityPageNo = ((activityBeginRow / 100) * 10 + 1);
    	
    	// memberId에 따른 숙소, 체험 주문 목록+페이징
    	Map<String, Object> accomMap = paymentService.selectAccomPayment(accomPage, ROW_PER_PAGE, memberId);
    	Map<String, Object> activityMap = paymentService.selectActivityPayment(activityPage, ROW_PER_PAGE, memberId);
		
    	model.addAttribute("ROW_PER_PAGE", ROW_PER_PAGE);
    	
    	// 숙소
    	model.addAttribute("accomBeginRow", accomBeginRow);
		model.addAttribute("accomPaymentList", accomMap.get("accomPaymentList"));
		model.addAttribute("accomLastPage", accomMap.get("lastPage"));
		model.addAttribute("accomCount", accomMap.get("totalCount"));
		model.addAttribute("accomPage", accomPage);
		model.addAttribute("accomPageNo", accomPageNo);
		
		// 체험
    	model.addAttribute("activityBeginRow", activityBeginRow);
		model.addAttribute("activityPaymentList", activityMap.get("activityPaymentList"));
		model.addAttribute("activityLastPage", activityMap.get("lastPage"));
		model.addAttribute("activityCount", activityMap.get("totalCount"));
		model.addAttribute("activityPage", activityPage);
		model.addAttribute("activityPageNo", activityPageNo);
    	
		return "member/selectMyOrderList";
	}
	
	@GetMapping("/member/updatePw")
	public String getUpdatePw() {
		log.trace("MemberController() 실행");
    	return "/member/updatePw";
    }
	
	// PW 변경
	@PostMapping("/member/updatePw")
	public String postUpdatePw(HttpServletRequest request,int updatePwCheck, Model model,HttpSession session){
		log.trace("MemberController() 실행");
		
		// 우선 세션을 가져옴
		Member loginMember = (Member)session.getAttribute("loginMember");
		// PW 변경 전 우선 로그아웃
	    session.invalidate();
		
	    // 방어코드
		if(updatePwCheck != 1) {
			return "redirect:/login";
		}

		String memberId = loginMember.getMemberId();
		String memberPw = request.getParameter("password");
		String memberNickname = request.getParameter("nickname");

		Member m = new Member();
		m.setMemberId(memberId);
		m.setMemberPw(memberPw);
		m.setMemberNickname(memberNickname);

		// 디버그
	    log.trace("★controller★"+m.toString());
	    
	    // pw 변경
	    memberService.updateMemberPw(m);
	    
	    
	    model.addAttribute("msg", "PW 변경이 완료되었습니다.\n로그인 화면으로 돌아갑니다.");
	    model.addAttribute("url", "redirect:/login");
	    return "/alert";
	}
	
	@GetMapping("/member/updateNickname")
	public String getUpdateNickname() {
		log.trace("MemberController() 실행");
		
    	return "/member/updateNickname";
    }
	
	// 닉네임 변경
	@PostMapping("/member/updateNickname")
	public String postUpdateNickname(HttpServletRequest request, RedirectAttributes redirect, Model model,HttpSession session) {
		log.trace("MemberController() 실행");
		
		Member loginMember = (Member) session.getAttribute("loginMember");
		
		String memberId = loginMember.getMemberId();
		String memberPw = request.getParameter("password");
		String memberNickname = request.getParameter("nickname");
		String route = request.getParameter("route");
		
		// 중복체크를 위해 아이디는 공백으로 둠
		Member m = new Member();
		m.setMemberId("");
		m.setMemberPw(memberPw);
		m.setMemberNickname(memberNickname);
		
		// 중복체크
	    String duplCheck = memberService.duplMemberCheck(m);
	    if(duplCheck.equals("닉네임중복")) {
	    	// 객체값을 넘기기 위해 중복이더라도 아이디를 추가
	    	m.setMemberId(memberId);
	    	model.addAttribute("m", m);
	    	model.addAttribute("route", route);
	    	model.addAttribute("failed", true);
	    	return "/member/updateNickname";
	    }
	    
	    // 중복체크 후 아이디 셋팅
	    m.setMemberId(memberId);
		
		// 디버그
	    log.trace("★controller★"+m.toString());
	    
	    //닉네임 변경
	  	memberService.updateMemberNickname(m);

	  	// 재반환(로그인)을 위해 일단 로그아웃
	    session.invalidate();
	    
	    // 재로그인
	    Member reLoginMember = loginService.login(m);
	    session = request.getSession();
	    session.setAttribute("loginMember", reLoginMember);
	    
	    if(reLoginMember.getMemberLevel()==2) {
	    	Admin adminSession = loginService.adminLogin(memberId);
	    	if(adminSession != null) {
	    		session.setAttribute("adminSession", adminSession);
	    	}
	    }
	    if(reLoginMember.getMemberLevel()==1) {
	    	Host hostSession = loginService.hostLogin(memberId);
	    	if(hostSession != null) {
	    		session.setAttribute("hostSession", hostSession);
	    	}
	    }
	    
	    return "redirect:/member/selectMyProfile";
	}
	
	
	// 비밀번호 체크
	@GetMapping("/member/pwCheck")
	public String getPwCheck(HttpServletRequest request,String route,Model model) {
		log.trace("MemberController() 실행");
		model.addAttribute("route", route);
		return "/member/pwCheck";
	}
	
	// 분기
	@PostMapping("/member/pwCheck")
	public String postPwCheck(RedirectAttributes redirect, String password, String route, Model model,HttpSession session) {
		log.trace("MemberController() 실행");
		Member loginMember = (Member) session.getAttribute("loginMember");
		
		String memberId = loginMember.getMemberId();

		Member m = new Member();
		m.setMemberId(memberId);
		m.setMemberPw(password);
		
		// 디버그
	    log.trace("★controller★"+m.toString());
		
		// 로그인이 성공적으로 되면 비밀번호 체크 성공
		Member reLoginMember = loginService.login(m);
		if(reLoginMember == null) {
			model.addAttribute("route", route);
	    	redirect.addFlashAttribute("failed",true);
	    	return "redirect:/member/pwCheck?route="+route;
	    }
		
		if(route.equals("1")) {
			redirect.addFlashAttribute("memberPw", m.getMemberPw());
			return "redirect:/member/updateMyProfile";
		} else if (route.equals("2")) {
			redirect.addFlashAttribute("memberPw", m.getMemberPw());
			redirect.addFlashAttribute("route", route);
			return "redirect:/member/updateNickname";
		} else if (route.equals("3")) {
			int updatePwCheck = 1;
			redirect.addFlashAttribute("updatePwCheck", updatePwCheck);
			return "redirect:/member/updatePw";
		} else if (route.equals("4")) {
			// 회원 탈퇴(delete는 아니고 active를 탈퇴로 변경)
			session.invalidate();
			memberService.deleteMember(m);
			model.addAttribute("msg", "탈퇴되었습니다.\n이용해주셔서 감사합니다.");
		    model.addAttribute("url", "redirect:/login");
		    return "/alert";
		}
		
		return "redirect:/index";
	}
	
	// 회원정보 수정 페이지
	@GetMapping("member/updateMyProfile")
	public String getUpdateMember() {
		log.trace("MemberController() 실행");
		
		return "/member/updateMyProfile";
	}
	
	// 회원정보 수정
	@PostMapping("member/updateMyProfile")
	public String postUpdateMember(HttpServletRequest request,String password, RedirectAttributes redirect, Model model,HttpSession session) {
		log.trace("MemberController() 실행");
		
		Member loginMember = (Member) session.getAttribute("loginMember");

	    String memberId = loginMember.getMemberId();
	    String memberFirstName = request.getParameter("firstname");
	    String memberLastName = request.getParameter("lastname");
	    String memberPhone = request.getParameter("phone");
	    String memberEmail = request.getParameter("email");
	    int memberAddressPostalCode = Integer.parseInt(request.getParameter("postalCode"));
	    String memberAddressZip = request.getParameter("roadAddress");
	    String memberAddressDetail = request.getParameter("detailAddress");
	    String memberDescription = request.getParameter("description");
	    
	    // 맴버 객체. 포함되지 않은 4개의 값은 Mapper에 존재
	    Member m = new Member();
	    m.setMemberId(memberId);
	    m.setMemberPw(password);
	    m.setMemberFirstName(memberFirstName);
	    m.setMemberLastName(memberLastName);
	    m.setMemberPhone(memberPhone);
	    m.setMemberEmail(memberEmail);
	    m.setMemberDescription(memberDescription);
	    
	    // 디버그
	    log.trace("★controller★"+m.toString());
	    
	    // 멤버 수정
	    memberService.updateMember(m);
	    
	    // 주소 객체
	    MemberAddress addr = new MemberAddress();
	    addr.setMemberId(memberId);
	    addr.setMemberAddressPostalCode(memberAddressPostalCode);
	    addr.setMemberAddressZip(memberAddressZip);
        addr.setMemberAddressDetail(memberAddressDetail);
        
        // 디버그
        log.trace("★controller★"+addr.toString());
        
        // 주소 수정
	    memberService.updateMemberAddress(addr);
	    
	    // 재반환(로그인)을 위해 일단 로그아웃
	    session.invalidate();
	    
	    // 재로그인
	    Member reLoginMember = loginService.login(m);
	    session = request.getSession();
	    session.setAttribute("loginMember", reLoginMember);
	    
	    if(reLoginMember.getMemberLevel()==2) {
	    	Admin adminSession = loginService.adminLogin(memberId);
	    	if(adminSession != null) {
	    		session.setAttribute("adminSession", adminSession);
	    	}
	    }
	    if(reLoginMember.getMemberLevel()==1) {
	    	Host hostSession = loginService.hostLogin(memberId);
	    	if(hostSession != null) {
	    		session.setAttribute("hostSession", hostSession);
	    	}
	    }
	    
	    return "redirect:/member/selectMyProfile";
	 }
	
	@GetMapping("/member/selectMyProfile")
	public String selectMyProfile() {
    	log.trace("MemberController() 실행");
    	return "/member/selectMyProfile";
    }
	
	@GetMapping("/addMember")
	public String getAddMember() {
    	log.trace("MemberController() 실행");
    	return "/addMember";
    }

	
	// 회원가입
	@PostMapping("/addMember")
	public String postAddMember(HttpServletRequest request, RedirectAttributes redirect) {
		log.trace("MemberController() 실행");
	    String memberId = request.getParameter("id");
	    String memberPw = request.getParameter("password");
	    String memberFirstName = request.getParameter("firstname");
	    String memberLastName = request.getParameter("lastname");
	    String memberNickname = request.getParameter("nickname");
	    String memberPhone = request.getParameter("phone");
	    String memberEmail = request.getParameter("email");
	    String memberReg = request.getParameter("socialsecuritynumber");
	    int memberAddressPostalCode = Integer.parseInt(request.getParameter("postalCode"));
	    String memberAddressZip = request.getParameter("roadAddress");
	    String memberAddressDetail = request.getParameter("detailAddress");
	    String memberDescription = request.getParameter("description");
	    
	    memberReg = memberReg.substring(0, 6)+"-"+memberReg.substring(6, 13);
	    
	    // 맴버 객체. 포함되지 않은 4개의 값은 Mapper에 존재
	    Member m = new Member();
	    m.setMemberId(memberId);
	    m.setMemberPw(memberPw);
	    m.setMemberFirstName(memberFirstName);
	    m.setMemberLastName(memberLastName);
	    m.setMemberNickname(memberNickname);
	    m.setMemberPhone(memberPhone);
	    m.setMemberEmail(memberEmail);
	    m.setMemberReg(memberReg);
	    m.setMemberDescription(memberDescription);
	    m.setMemberLevel(0);
	    m.setMemberActive("활동");
	    
	    // 디버그
	    log.trace("★controller★"+m.toString());
	    
	    // 중복 검사
	    String duplCheck = memberService.duplMemberCheck(m);
	    if(duplCheck.equals("아이디중복")) {
	    	redirect.addFlashAttribute("member",m);
	    	redirect.addFlashAttribute("duplication","id");
	    	return "redirect:addMember";
	    }
	    if(duplCheck.equals("닉네임중복")) {
	    	redirect.addFlashAttribute("member",m);
	    	redirect.addFlashAttribute("duplication","nickname");
	    	return "redirect:addMember";
	    }
	    
	    // 멤버 추가
	    memberService.addMember(m);
	    
	    // 주소 객체
	    MemberAddress addr = new MemberAddress();
	    addr.setMemberId(memberId);
	    addr.setMemberAddressPostalCode(memberAddressPostalCode);
	    addr.setMemberAddressZip(memberAddressZip);
        addr.setMemberAddressDetail(memberAddressDetail);
        
        // 디버그
        log.trace("★controller★"+addr.toString());
        
        // 주소 삽입
	    memberService.addMemberAddress(addr);
	    
	    // create_id 테이블에 아이디 저장
	    memberService.addMemberCreateId(memberId);
	    
	    return "redirect:/login";
	 }
	// 체험 관심상품 등록
	@PostMapping("/member/addActivityByInterest")
	public String postAddActivityByInterest(HttpSession session,HttpServletRequest request,ActivityInterest activityInterest,Model model) {
		System.out.println("★★★[boryeong]MemberController_addActivityByInterest실행★★★");
		
		int ActivityNo = Integer.parseInt(request.getParameter("activityNo"));
		// 회원 세션 정보
		String memberId = ((Member) session.getAttribute("loginMember")).getMemberId();
		
		ActivityInterest ai = new ActivityInterest();
		ai.setActivityNo(ActivityNo);
		ai.setMemberId(memberId);
		// 중복 등록 방지
		String interestCheck = activityService.duplActivityInterest(ai);
		if(interestCheck.equals("관심중복")) {
			model.addAttribute("msg", "이미 관심상품 등록된 상품입니다");
		    model.addAttribute("url", "redirect:/activityOne?activityNo="+ActivityNo);
			return "/alert";
		}
		activityService.insertActivityByInterest(ai);
		model.addAttribute("msg", "관심 상품이 등록 되었습니다.");
	    model.addAttribute("url", "redirect:/activityOne?activityNo="+ActivityNo);
		return "/alert";
	}
	
	// 숙소 관심상품 등록
	@PostMapping("/member/addAccomBuildingByInterest")
	public String postAddAccomBuildingByInterest(HttpSession session,HttpServletRequest request,AccomBuildingInterest accomBuildingInterest,Model model) {
		System.out.println("★★★[boryeong]MemberController_addaccomBuildingByInterest실행★★★");
		
		int AccomBuildingNo = Integer.parseInt(request.getParameter("accomBuildingNo"));
		// 회원 세션 정보
		String memberId = ((Member) session.getAttribute("loginMember")).getMemberId();
		
		AccomBuildingInterest abi = new AccomBuildingInterest();
		abi.setAccomBuildingNo(AccomBuildingNo);
		abi.setMemberId(memberId);
		// 중복 등록 방지
		String interestCheck = accomBuildingService.duplAccomBuildingInterest(abi);
		if(interestCheck.equals("관심중복")) {
			model.addAttribute("msg", "이미 관심상품 등록된 상품입니다");
		    model.addAttribute("url", "redirect:/accomBuildingOne?accomBuildingNo="+AccomBuildingNo);
			return "/alert";
		}
		accomBuildingService.insertAccomBuildingByInterest(abi);
		model.addAttribute("msg", "관심 상품이 등록 되었습니다.");
	    model.addAttribute("url", "redirect:/accomBuildingOne?accomBuildingNo="+AccomBuildingNo);
		return "/alert";
	}
}