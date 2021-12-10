package com.gdu.voyage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gdu.voyage.service.MemberService;
import com.gdu.voyage.vo.Address;
import com.gdu.voyage.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Controller
public class MemberController {
	MemberService memberService;
	
	@GetMapping("/addMember")
	public String getAddMember() {
    	System.out.println("MemberController() 실행");
      
    	return "addMember";
    }
	
	@PostMapping("/addMember")
	public String postAddMember(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("MemberController() 실행");
	    String memberId = request.getParameter("id");
	    String memberPw = request.getParameter("password");
	    String memberFirstName = request.getParameter("firstname");
	    String memberLastName = request.getParameter("lastname");
	    String memberNickname = request.getParameter("nickname");
	    String memberPhone = request.getParameter("phone");
	    String memberEmail = request.getParameter("email");
	    String memberReg = request.getParameter("socialsecuritynumber");
	    int addressPostalCode = Integer.parseInt(request.getParameter("postalCode"));
	    String addressZip = request.getParameter("roadAddress");
	    String addressDetail = request.getParameter("detailAddress");
	    String memberDescription = request.getParameter("description");
	      
	    // 주소 객체
	    Address addr = new Address();
	    addr.setAddressPostalCode(addressPostalCode);
	    addr.setAddressZip(addressZip);
        addr.setAddressDetail(addressDetail);
        
        log.trace("★controller★"+addr.toString());
	      
	    // 주소 삽입, 오토인클리먼트 값을 받아옴
	    memberService.addMemberAddress(addr);
	    
	    // 맴버 객체. 포함되지 않은 4개의 값은 Mapper에 존재
	    Member m = new Member();
	    m.setAddressNo(addr.getAddressNo());
	    m.setMemberId(memberId);
	    m.setMemberPw(memberPw);
	    m.setMemberFirstName(memberFirstName);
	    m.setMemberLastName(memberLastName);
	    m.setMemberNickname(memberNickname);
	    m.setMemberPhone(memberPhone);
	    m.setMemberEmail(memberEmail);
	    m.setMemberReg(memberReg);
	    m.setMemberDescription(memberDescription);
	    
	    log.trace("★controller★"+m.toString());
	    
	    // 멤버 추가
	    memberService.addMember(m);
	    
	    return "login";
	 }
	
}	
