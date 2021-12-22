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

import com.gdu.voyage.vo.Host;
import com.gdu.voyage.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@WebFilter(urlPatterns = "/host/*")
public class HostFilter implements Filter {
	@Override
	 public void init(FilterConfig filterConfig) throws ServletException {
		log.info("init HostFilter");
	 }
	
	
	// MemberLevel이 1이고 상태가 활동일 때만 접근가능
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
	    HttpSession session = req.getSession();
	    Member loginMember = (Member)session.getAttribute("loginMember");
	    if(session.getAttribute("loginMember") == null || loginMember.getMemberLevel() != 1) {
	    	req.setAttribute("msg", "사업자만이 접근 가능합니다.");
	    	req.setAttribute("url", "redirect:/index");
	    	req.getRequestDispatcher(req.getContextPath()+"/alert").forward(req, res);
	    }
	    
	    Host hostSession = (Host)session.getAttribute("hostSession");
	    System.out.println(hostSession.getHostState());
	    if(hostSession.getHostState().equals("차단")) {
	    	req.setAttribute("msg", "차단된 사업자입니다.");
	    	req.setAttribute("url", "redirect:/index");
	    	req.getRequestDispatcher(req.getContextPath()+"/alert").forward(req, res);
	    	return;
	    }
	      
	    chain.doFilter(req, res);
	}
	
	@Override
	public void destroy() {
		log.info("destroy HostFilter");
	}

}
