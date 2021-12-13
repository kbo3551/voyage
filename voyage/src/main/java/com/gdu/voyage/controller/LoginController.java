package com.gdu.voyage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gdu.voyage.service.LoginService;
import com.gdu.voyage.service.MemberService;
import com.gdu.voyage.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Controller
public class LoginController {
	@Autowired LoginService loginService;
	
	@GetMapping("/login")
    public String getLogin() {
       System.out.println("LoginController() 실행");
       return "login";
	}
	
	@PostMapping("/login")
	public String postLogin(HttpServletRequest request, RedirectAttributes redirect) {
		System.out.println("LoginController() 실행");
		
		String memberId = request.getParameter("id");
		String memberPw = request.getParameter("password");
		
		// 맴버 객체
		Member m = new Member();
	    m.setMemberId(memberId);
	    m.setMemberPw(memberPw);
	    
	    // 디버그
	    log.trace("★controller★"+m.toString());
	    
	    Member loginMember = loginService.login(m);
	    if(loginMember == null) {
	    	return "redirect:login?failed=true";
	    }
	    
	    
	    HttpSession session = request.getSession();
	    session.setAttribute("loginMember", loginMember);
	    
	    return "redirect:index";
	}
}	
