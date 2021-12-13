package com.gdu.voyage.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebFilter("/member/*")
public class MemberFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("LoginFilter 실행");
		HttpSession session = ((HttpServletRequest)request).getSession();
			if(session.getAttribute("loginMember") == null) { // 로그인 전 못들어옴
				((HttpServletResponse)response).sendRedirect(((HttpServletRequest)request).getContextPath()+"/login");
			return;
		}
		
		chain.doFilter(request, response);
	}

}
