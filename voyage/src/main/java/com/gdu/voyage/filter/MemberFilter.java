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

import lombok.extern.slf4j.Slf4j;


@Slf4j
@WebFilter(urlPatterns = "/member/*")
public class MemberFilter implements Filter {
	 @Override
	 public void init(FilterConfig filterConfig) throws ServletException {
		log.info("init MemberFilter");
	 }
	 
	 
	// 로그인 전 못들어옴
	 @Override
	 public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		 HttpServletRequest req = (HttpServletRequest) request;
		 HttpServletResponse res = (HttpServletResponse) response;
		
		 HttpSession session = req.getSession();
		 if(session.getAttribute("loginMember") == null) { 
			 req.setAttribute("msg", "로그인을 먼저 진행해주세요.");
	    	 req.setAttribute("url", "redirect:/login");
	    	 req.getRequestDispatcher(req.getContextPath()+"/alert").forward(req, res);
		 }
		
		 chain.doFilter(req, res); 
	}
	
	@Override
	public void destroy() {
		log.info("destroy MemberFilter");
	}

}
