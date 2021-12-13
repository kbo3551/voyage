package com.gdu.voyage.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gdu.voyage.vo.Admin;
import com.gdu.voyage.vo.Member;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@WebFilter(urlPatterns = "/admin/*")
public class AdminFilter implements Filter {
	@Override
	 public void init(FilterConfig filterConfig) throws ServletException {
		log.info("init AdminFilter");
	 }
	
	// 멤버레벨이 2가 아니면 관리자메뉴 못봄
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
	    HttpSession session = req.getSession();
	    if(session.getAttribute("loginMember") == null) {
	    	res.sendRedirect(req.getContextPath()+"/login");
			return;
	    }
	    Member loginMember = (Member)session.getAttribute("loginMember");
	    if(loginMember.getMemberLevel() != 2) {
	    	res.sendRedirect(req.getContextPath()+"/index");
			return;
	    }
	    Admin adminSession = (Admin)session.getAttribute("adminSession");
	    if(adminSession == null) {
	    	res.sendRedirect(req.getContextPath()+"/index");
			return;
	    }
	      
	    chain.doFilter(req, res); 
	}
	
	@Override
	public void destroy() {
		log.info("destroy AdminFilter");
	}
}

