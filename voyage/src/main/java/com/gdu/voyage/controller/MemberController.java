package com.gdu.voyage.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gdu.voyage.service.MemberService;
import com.gdu.voyage.vo.Member;
import com.gdu.voyage.vo.MemberAddress;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Controller
public class MemberController {
	@Autowired MemberService memberService;
	
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
        
        // 주소 삽입. 오토인클리먼트 값을 받아옴
	    memberService.addMemberAddress(addr);
	    
	    return "redirect:/login";
	 }
	
}	
