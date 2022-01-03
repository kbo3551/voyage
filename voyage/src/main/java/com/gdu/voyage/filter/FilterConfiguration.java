package com.gdu.voyage.filter;

import org.springframework.boot.web.servlet.FilterRegistrationBean; 
import org.springframework.context.annotation.Bean; 
import org.springframework.context.annotation.Configuration; 
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer; 

@Configuration 
public class FilterConfiguration implements WebMvcConfigurer {
	@Bean 
	public FilterRegistrationBean<MemberFilter> memberFilterRegistrationBean() { 
		FilterRegistrationBean<MemberFilter> registrationBean = new FilterRegistrationBean<>(); 
		registrationBean.setFilter(new MemberFilter()); 
		registrationBean.addUrlPatterns("/member/*"); 
		return registrationBean; 
	} 
	
	@Bean 
	public FilterRegistrationBean<AdminFilter> adminFilterRegistrationBean() { 
		FilterRegistrationBean<AdminFilter> registrationBean = new FilterRegistrationBean<>(); 
		registrationBean.setFilter(new AdminFilter()); 
		registrationBean.addUrlPatterns("/admin/*"); 
		return registrationBean; 
	} 
	
	@Bean 
	public FilterRegistrationBean<HostFilter> hostFilterRegistrationBean() { 
		FilterRegistrationBean<HostFilter> registrationBean = new FilterRegistrationBean<>(); 
		registrationBean.setFilter(new HostFilter()); 
		registrationBean.addUrlPatterns("/host/*"); 
		return registrationBean; 
	} 
	
	@Bean 
	public FilterRegistrationBean<addAdminFilter> addAdminFilterRegistrationBean() { 
		FilterRegistrationBean<addAdminFilter> registrationBean = new FilterRegistrationBean<>(); 
		registrationBean.setFilter(new addAdminFilter()); 
		registrationBean.addUrlPatterns("/addAdmin"); 
		return registrationBean; 
	} 
	
	@Bean 
	public FilterRegistrationBean<LoginFilter> LoginFilterRegistrationBean() { 
		FilterRegistrationBean<LoginFilter> registrationBean = new FilterRegistrationBean<>(); 
		registrationBean.setFilter(new LoginFilter()); 
		registrationBean.addUrlPatterns("/login"); 
		return registrationBean; 
	} 
	
}
