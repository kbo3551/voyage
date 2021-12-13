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
import com.gdu.voyage.vo.Admin;
import com.gdu.voyage.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Controller
public class LoginController {
	@Autowired LoginService loginService;
	
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		System.out.println("LoginController() 실행 - logout");
		request.getSession().invalidate();
		return "redirect:index";
	}
	
	// 로그인 페이지
	@GetMapping("/login")
    public String getLogin() {
       System.out.println("LoginController() 실행");
       return "login";
	}
	
	// 로그인
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
	    
	    if(loginMember.getMemberLevel()==2) {
	    	Admin adminSession = loginService.adminLogin(memberId);
	    	if(adminSession != null) {
	    		session.setAttribute("adminSession", adminSession);
	    	}
	    }
	    
	    return "redirect:index";
	}
	/*
	// 어드민 로그아웃
	@GetMapping("/adminlogout")
	public String adminLogout(HttpServletRequest request) {
		System.out.println("LoginController()_adminLogOut 실행");
		request.getSession().invalidate();
		return "redirect:/index";
	}
	// 어드민 로그인 페이지 이동
	@GetMapping("/adminLogin")
	public String getAdminLogin() {
		System.out.println("LoginController()_adminLogin 실행");
		return "adminLogin";
	}
	// 어드민 로그인
	@PostMapping("/adminLogin")
	public String postAdminLogin(HttpServletRequest request, RedirectAttributes redirect) {
		System.out.println("★★★[boryeong]postAdminloginController★★★");
		
		String adminId = request.getParameter("id");
		String adminPw = request.getParameter("password");
		// 어드민 객체
		Admin a = new Admin();
		a.setAdminId(adminId);
		a.setAdminPw(adminPw);
		
		log.debug("★★★[boryeong]postAdminloginController★★★"+a.toString());
		
		Admin loginAdmin = loginService.adminLogin(a);
		if(loginAdmin == null) {
			return "redirect:adminLogin?failed=true";
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("loginAdmin", loginAdmin);
		
		return "redirect:adminIndex";
	}
	*/

}	
