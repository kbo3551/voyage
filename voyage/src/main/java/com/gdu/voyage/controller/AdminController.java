package com.gdu.voyage.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
		private final int ROW_PER_PAGE = 10;
	// 어드민 정보수정
	@GetMapping("/admin/adminUpdate")
	public String getAdminUpdate() {
		System.out.println("AdminController()_adminUpdate 실행");
		return "admin/adminUpdate";
	}
	@PostMapping("/admin/adminUpdate")
	public String postAdminUpdate(HttpServletRequest request, RedirectAttributes redirect, Model model) {
		System.out.println("AdminController()_adminUpdate 실행");
		// 값
		Admin adminSession = (Admin) request.getSession().getAttribute("adminSession");
		
		String adminId = adminSession.getAdminId();
		String adminFirstName = request.getParameter("firstname");
		String adminLastName = request.getParameter("lastname");
		String adminPhone = request.getParameter("phone");
		String adminEmail = request.getParameter("email");
		String adminActive = request.getParameter("adminactive");
		int adminAddressPostalCode = Integer.parseInt(request.getParameter("adminAddressPostalCode"));
		String adminAddressZip = request.getParameter("adminRoadAddress");
		String adminAddressDetail = request.getParameter("adminDetailAddress");
		
		Admin a = new Admin();
		
		a.setAdminId(adminId);
		a.setAdminFirstName(adminFirstName);
		a.setAdminLastName(adminLastName);
		a.setAdminPhone(adminPhone);
		a.setAdminEmail(adminEmail);
		a.setAdminActive(adminActive);
		log.debug("★★★[boryeong]AdminController★★★"+ a.toString());
		// 업데이트 어드민
		adminService.updateAdmin(a);
		 // 주소 객체
	    AdminAddress aAddress = new AdminAddress();
	    aAddress.setAdminId(adminId);
	    aAddress.setAdminAddressPostalCode(adminAddressPostalCode);
	    aAddress.setAdminAddressZip(adminAddressZip);
	    aAddress.setAdminAddressDetail(adminAddressDetail);
	    
		log.debug("★★★[boryeong]AdminController★★★"+aAddress.toString());
		// 주소 업데이트
		adminService.updateAdminAddress(aAddress);
		// 로그아웃
	    request.getSession().invalidate();
	    
	    
		return "/login";
	}
		
	// 어드민 회원가입
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
	    String adminFirstName = request.getParameter("firstname");
	    String adminLastName = request.getParameter("lastname");
	    String adminPhone = request.getParameter("phone");
	    String adminEmail = request.getParameter("email");
	    int adminAddressPostalCode = Integer.parseInt(request.getParameter("postalCode"));
	    String adminAddressZip = request.getParameter("roadAddress");
	    String adminAddressDetail = request.getParameter("detailAddress");
	    String createDate = request.getParameter("createDate");
	    String updateDate = request.getParameter("updateDate");
		
	    // admin 객체
	    Admin a = new Admin();
	    a.setAdminId(adminId);
	    a.setAdminFirstName(adminFirstName);
	    a.setAdminLastName(adminLastName);
	    a.setAdminPhone(adminPhone);
	    a.setAdminEmail(adminEmail);
	    a.setAdminActive("활동");
	    
	    log.debug("★★★[boryeong]AdminController★★★"+a.toString());
	    
	    // admin 추가
	    adminService.addAdmin(a);
	    
	    // 주소 객체
	    AdminAddress aAddress = new AdminAddress();
	    aAddress.setAdminId(adminId);
	    aAddress.setAdminAddressPostalCode(adminAddressPostalCode);
	    aAddress.setAdminAddressZip(adminAddressZip);
	    aAddress.setAdminAddressDetail(adminAddressDetail);
	    aAddress.setCreateDate(createDate);
	    aAddress.setUpdateDate(updateDate);
	    
	    log.debug("★★★[boryeong]AdminController★★★"+aAddress.toString());
	    
	    adminService.addAdminAddress(aAddress);
	    
	    request.getSession().invalidate();
	    
		return "redirect:/login";
	}
	
	@GetMapping("/admin/adminIndex")
	public String index() {
		System.out.println("AdminController() 실행");

		return "admin/adminIndex";
	}
	/*
	@Controller
	public class productManagementController {
		@GetMapping("/admin/productManagement")
		public String management() {
			System.out.println("ProductManagement() 실행");

			return "admin/productManagement";
		}
	}*/
	// 멤버 관리 리스트
	@GetMapping("/admin/memberList")
	public String getMemberList(HttpServletRequest request, Model model,@RequestParam(defaultValue = "1") int currentPage) {
		System.out.println("AdminController()_memberList실행");
		log.debug("★★★[boryeong]AdminController★★★"+currentPage);
		
		int beginRow = (currentPage * ROW_PER_PAGE) - (ROW_PER_PAGE - 1);
		
		Map<String, Object> map = adminService.getMemberList(currentPage, ROW_PER_PAGE);
		// 값
		model.addAttribute("beginRow", beginRow);
		model.addAttribute("ROW_PER_PAGE", ROW_PER_PAGE);
		model.addAttribute("memberList", map.get("memberList"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		
		int pageNo = ((beginRow / 100) * 10 + 1);
		log.debug("★★★[boryeong]AdminController_pageNo★★★" + "pageNo");
		model.addAttribute("pageNo", pageNo);
		
		return "admin/memberList";
	}
}
