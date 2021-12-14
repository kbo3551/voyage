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
import com.gdu.voyage.vo.Member;
import com.gdu.voyage.vo.MemberAddress;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Controller
public class MemberController {
	@Autowired MemberService memberService;
	@Autowired LoginService loginService;
	
	// 비밀번호 체크
	@GetMapping("/member/pwCheck")
	public String getPwCheck(HttpServletRequest request,String route,Model model) {
		System.out.println("MemberController() 실행");
		model.addAttribute("route", route);
		return "/member/pwCheck";
	}
	
	@PostMapping("/member/pwCheck")
	public String PostPwCheck(HttpServletRequest request, RedirectAttributes redirect, String password, Model model) {
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
	    	return "redirect:/member/pwCheck?failed=true";
	    }
		
		if(route.equals("1")) {
			model.addAttribute("m", m);
			return "/member/updateMyPage";
		} else if (route.equals("2")) {
			model.addAttribute("m", m);
			return "/member/updateNickname";
		} else if (route.equals("3")) {
			model.addAttribute("m", m);
			return "/member/updatePassword";
		} else if (route.equals("4")) {
			model.addAttribute("m", m);
			return "/member/deleteMember";
		}
		 
		
		return "redirect:/login";
	}
	
	// 회원정보 수정
	@PostMapping("member/myPage")
	public String postUpdateMember(HttpServletRequest request, RedirectAttributes redirect) {
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
	    	return "redirect:addMember?duplication=id";
	    }
	    if(duplCheck.equals("닉네임중복")) {
	    	redirect.addFlashAttribute("member",m);
	    	return "redirect:addMember?duplication=nickname";
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
