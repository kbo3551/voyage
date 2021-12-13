package com.gdu.voyage.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gdu.voyage.service.AdminService;
import com.gdu.voyage.vo.Admin;
import com.gdu.voyage.vo.AdminAddress;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Transactional
@Controller
public class AdminController {
	@Autowired AdminService adminService;


	@GetMapping("/addAdmin")
	public String getAddAdmin() {
		System.out.println("AdminController() 실행");
		return "addAdmin";
	}
	
	@PostMapping("/addAdmin")
	public String postAddAdmin(HttpServletRequest request, RedirectAttributes redirect) {
		System.out.println("AdminController() 실행");
		// 값
		String adminId = request.getParameter("id");
		String adminPw = request.getParameter("password");
	    String adminFirstName = request.getParameter("firstname");
	    String adminLastName = request.getParameter("lastname");
	    String adminPhone = request.getParameter("phone");
	    String adminEmail = request.getParameter("email");
	    String adminReg = request.getParameter("socialsecuritynumber");
	    int adminAddressPostalCode = Integer.parseInt(request.getParameter("postalCode"));
	    String adminAddressZip = request.getParameter("roadAddress");
	    String adminAddressDetail = request.getParameter("detailAddress");
		
	    // admin 객체
	    Admin a = new Admin();
	    a.setAdminId(adminId);
	    a.setAdminPw(adminPw);
	    a.setAdminFirstName(adminFirstName);
	    a.setAdminLastName(adminLastName);
	    a.setAdminPhone(adminPhone);
	    a.setAdminEmail(adminEmail);
	    a.setAdminReg(adminReg);
	    a.setAdminActive("활동");
	    
	    log.debug("★★★[boryeong]AdminController★★★"+a.toString());
	    
	    // 중복 검사
	    String idCheck = adminService.adminIdCheck(a);
	    if(idCheck.equals("아이디중복")) {
	    	redirect.addFlashAttribute("admin",a);
	    	return "redirect:addAdmin?idChecking=id";
	    }
	    
	    // admin 추가
	    adminService.addAdmin(a);
	    
	    // 주소 객체
	    AdminAddress aAddress = new AdminAddress();
	    aAddress.setAdminId(adminId);
	    aAddress.setAdminAddressPostalCode(adminAddressPostalCode);
	    aAddress.setAdminAddressZip(adminAddressZip);
	    aAddress.setAdminAddressDetail(adminAddressDetail);
	    
	    log.debug("★★★[boryeong]AdminController★★★"+aAddress.toString());
	    
	    adminService.addAdminAddress(aAddress);
	    
		return "redirect:/adminLogin";
	}
	
	@GetMapping("/adminIndex")
	public String index() {
		System.out.println("AdminController() 실행");

		return "templates_admin/adminIndex";
	}
	
	@Controller
	public class productManagementController {
		@GetMapping("/productManagement")
		public String management() {
			System.out.println("ProductManagement() 실행");

			return "templates_admin/productManagement";
		}
	}
}