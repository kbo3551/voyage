package com.gdu.voyage.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginFilter implements Filter {
	@Override
	 public void init(FilterConfig filterConfig) throws ServletException {
		log.info("init LoginFilter");
	 }
	
	// 로그인 했으면 로그인페이지 못들어옴
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
	    
	    if(req.getSession().getAttribute("loginMember") != null) {
	    	req.setAttribute("msg", "로그인 한 상태입니다.");
	    	req.setAttribute("url", "redirect:/index");
	    	req.getRequestDispatcher("/alert").forward(req, res);
	    	return;
	    }
	      
	    chain.doFilter(req, res); 
	}
	
	@Override
	public void destroy() {
		log.info("destroy LoginFilter");
	}
}
