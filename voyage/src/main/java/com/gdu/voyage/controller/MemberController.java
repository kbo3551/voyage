package com.gdu.voyage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gdu.voyage.service.LoginService;
import com.gdu.voyage.service.MemberService;
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
	@Autowired MemberService memberService;
	@Autowired LoginService loginService;
	
	
	// PW 변경
	@PostMapping("/member/updatePw")
	public String postUpdatePw(HttpServletRequest request, Model model){
		System.out.println("MemberController() 실행");
		
		// 우선 세션을 가져옴
		Member loginMember = (Member) request.getSession().getAttribute("loginMember");
		// PW 변경 전 우선 로그아웃
	    request.getSession().invalidate();
		
	    // 방어코드
		int updatePwCheck = Integer.parseInt(request.getParameter("updatePwCheck"));
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
    	System.out.println("MemberController() 실행");
    	return "/member/updateNickname";
    }
	
	// 닉네임 변경
	@PostMapping("/member/updateNickname")
	public String postUpdateNickname(HttpServletRequest request, RedirectAttributes redirect, Model model) {
		System.out.println("MemberController() 실행");
		Member loginMember = (Member) request.getSession().getAttribute("loginMember");
		
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
	    request.getSession().invalidate();
	    
	    // 재로그인
	    Member reLoginMember = loginService.login(m);
	    HttpSession session = request.getSession();
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
	    
	    return "redirect:/member/myPage";
	}
	
	
	// 비밀번호 체크
	@GetMapping("/member/pwCheck")
	public String getPwCheck(HttpServletRequest request,String route,Model model) {
		System.out.println("MemberController() 실행");
		model.addAttribute("route", route);
		return "/member/pwCheck";
	}
	
	// 분기
	@PostMapping("/member/pwCheck")
	public String postPwCheck(HttpServletRequest request, RedirectAttributes redirect, String password, Model model) {
		System.out.println("MemberController() 실행");
		Member loginMember = (Member) request.getSession().getAttribute("loginMember");
		
		String memberId = loginMember.getMemberId();
		String route = request.getParameter("route");

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
			model.addAttribute("m", m);
			return "/member/updateMyPage";
		} else if (route.equals("2")) {
			model.addAttribute("m", m);
			model.addAttribute("route", route);
			return "/member/updateNickname";
		} else if (route.equals("3")) {
			int updatePwCheck = 1;
			model.addAttribute("updatePwCheck", updatePwCheck);
			return "/member/updatePw";
		} else if (route.equals("4")) {
			// 회원 탈퇴(delete는 아니고 active를 탈퇴로 변경)
			request.getSession().invalidate();
			memberService.deleteMember(m);
			model.addAttribute("msg", "탈퇴되었습니다.\n이용해주셔서 감사합니다.");
		    model.addAttribute("url", "redirect:/login");
		    return "/alert";
		}
		
		return "/member/pwCheck";
	}
	
	// 회원정보 수정
	@PostMapping("member/myPage")
	public String postUpdateMember(HttpServletRequest request, RedirectAttributes redirect, Model model) {
		System.out.println("MemberController() 실행");
		Member loginMember = (Member) request.getSession().getAttribute("loginMember");

	    String memberId = loginMember.getMemberId();
	    String memberPw = request.getParameter("password");
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
	    m.setMemberPw(memberPw);
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
	    request.getSession().invalidate();
	    
	    // 재로그인
	    Member reLoginMember = loginService.login(m);
	    HttpSession session = request.getSession();
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
	    
	    return "redirect:/member/myPage";
	 }
	
	@GetMapping("/member/myPage")
	public String myPage() {
    	System.out.println("MemberController() 실행");
    	return "/member/myPage";
    }
	
	@GetMapping("/addMember")
	public String getAddMember() {
    	System.out.println("MemberController() 실행");
    	return "addMember";
    }

	
	// 회원가입
	@PostMapping("/addMember")
	public String postAddMember(HttpServletRequest request, RedirectAttributes redirect) {
		System.out.println("MemberController() 실행");
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
	 
}	
