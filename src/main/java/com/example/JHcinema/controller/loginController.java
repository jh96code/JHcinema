package com.example.JHcinema.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.JHcinema.dao.loginDao;
import com.example.JHcinema.dao.movieDao;
import com.example.JHcinema.dao.csDao;
import com.example.JHcinema.dto.adminDto;
import com.example.JHcinema.dto.customerDto;
import com.example.JHcinema.dto.movieShowingDto;
import com.example.JHcinema.dto.pointDetailDto;
import com.example.JHcinema.dto.ticketPayDto;

@Controller
public class loginController {
	
	@Autowired
	private loginDao loginDao;
	@Autowired
	private movieDao movieDao;
	@Autowired
	private csDao csDao;
		
	//로그인 페이지로 이동
	@GetMapping("/login")
	public String login() {
		return "login/login";
	}
			
	//회원가입 유형 페이지로 이동
	@GetMapping("/addMember_category")
	public String addMember_category() {
		return "login/addMember_category";
	}
			
	//회원가입(일반회원) 페이지로 이동
	@GetMapping("/addMember_customer")
	public String addMember_customer() {
		return "login/addMember_customer";
	}
			
	//회원가입(관리자) 페이지로 이동
	@GetMapping("/addMember_admin")
	public String addMember_admin() {
		return "login/addMember_admin";
	}
	
	//마이페이지로 이동
	@GetMapping("/mypage")
	public String mypage(@RequestParam String id, Model m) throws SQLException {
		customerDto customer = loginDao.getCustomer(id);
		adminDto admin = loginDao.getAdmin(id);
		if(customer != null) {
			int contactCnt = csDao.getContactCnt(id);
			m.addAttribute("contactCnt", contactCnt);
			m.addAttribute("member", customer);
		} else {
			int contactCnt = csDao.getAllContactCnt();
			m.addAttribute("contactCnt", contactCnt);
			m.addAttribute("member", admin);
		}
		
		//영화예매내역 리스트로 가져오기
		List<ticketPayDto> ticketingList = loginDao.getTicketPay(id);
		m.addAttribute("ticketingList", ticketingList);
		
		return "login/mypage";
	}
	
	//마이페이지 - 포인트내역 페이지 열기
	@GetMapping("mypage_point")
	public String mypage_point(@RequestParam String id, Model m) throws SQLException {
		
		//포인트 내역 리스트로 가져오기
		List<pointDetailDto> pointList = loginDao.getPointDetail(id);
		m.addAttribute("pointList", pointList);
		int pointListCnt = loginDao.getPointDetailCnt(id);
		m.addAttribute("cnt", pointListCnt);
		
		return "login/mypage_point";
	}
	
	//회원정보 수정
	@PostMapping("/updateMember")
	public String updateMember(@RequestParam String id, customerDto customer, adminDto admin) {
		try {
			loginDao.updateCustomer(customer);
			loginDao.updateAdmin(admin);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/mypage?id=" + id;
	}
		
	//일반회원 로그인하기
	@PostMapping("/login_customer")
	public String login_customer(HttpServletRequest request, Model m) throws Exception {
		String login_id = request.getParameter("login_id");
		String login_pw = request.getParameter("login_pw");
			
		HttpSession session = request.getSession();
			
		customerDto customer = new customerDto();
		customer = loginDao.loginCheck_customer(login_id, login_pw);
			
		if (customer != null) {
			session.setAttribute("login_id", customer.getId());
			session.setAttribute("login_pw", customer.getPassword());
			session.setAttribute("admincheck", "false");
			System.out.println("일반회원 로그인 성공!!!");
		} else {
			m.addAttribute("msg", "로그인에 실패하였습니다.");
			return "login";
		}
		//현재상영작 목록 가져오기
		List<movieShowingDto> showingList;
		showingList = movieDao.getMovieShowing();
		m.addAttribute("showingList", showingList);
		
		return "index";
	}
	
	//관리자 로그인하기
	@PostMapping("/login_admin")
	public String login_admin(HttpServletRequest request, Model m) throws Exception {
		String login_id = request.getParameter("login_id");
		String login_pw = request.getParameter("login_pw");
				
		HttpSession session = request.getSession();
				
		adminDto admin = new adminDto();
		admin = loginDao.loginCheck_admin(login_id, login_pw);
				
		if (admin != null) {
			session.setAttribute("login_id", admin.getId());
			session.setAttribute("login_pw", admin.getPassword());
			session.setAttribute("admincheck", "true");
			System.out.println("관리자 로그인 성공!!!");
		} else {
			m.addAttribute("msg", "로그인에 실패하였습니다.");
			return "login";
		}
		//현재상영작 목록 가져오기
		List<movieShowingDto> showingList;
		showingList = movieDao.getMovieShowing();
		m.addAttribute("showingList", showingList);
		
		return "index";
	}
		
	//일반회원 회원가입하기
	@PostMapping("/processAddMember_customer")
	public String processAddMember_customer(customerDto customerDto) {
		try {
			loginDao.addMember_customer(customerDto);
			System.out.println("일반회원 회원가입 성공!!!");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("일반회원 회원가입 과정에서 문제 발생!!!");
		}
		return "login/login";
	}
	
	//관리자 회원가입하기
	@PostMapping("/processAddMember_admin")
	public String processAddMember_admin(adminDto adminDto) {
		try {
			loginDao.addMember_admin(adminDto);
			System.out.println("관리자 회원가입 성공!!!");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("관리자 회원가입 과정에서 문제 발생!!!");
		}
		return "login/login";
	}
	
	//회원가입 id중복확인 페이지로 이동
	@GetMapping("id_check")
	public String idCheck() {
		return "login/id_check";
	}
	
	//회원가입 id중복확인 결과
	@PostMapping("processId_check")
	public String processId_check(@RequestParam String id, Model m) throws SQLException {
		
		String memberId_customer = loginDao.idCheck_customer(id);
		String memberId_admin = loginDao.idCheck_admin(id);
		if (memberId_customer == null && memberId_admin == null) {
			m.addAttribute("msg", "사용가능한 아이디입니다.");
			m.addAttribute("id", id);
		} else {
			m.addAttribute("msg", "이미 사용하고 있는 아이디입니다.");
			m.addAttribute("id", id);
		}

		return "login/processId_check";
	}
	
	//아이디찾기 페이지로 이동
	@GetMapping("/idFind")
	public String idFind() {
		return "login/idFind";
	}
	
	//아이디찾기 결과
	@PostMapping("/processIdFind")
	public String processIdFind(@RequestParam String name, @RequestParam String phone, Model m) throws SQLException {
		
		customerDto customer = loginDao.idFind_customer(name, phone);
		adminDto admin = loginDao.idFind_admin(name, phone);
		if(customer != null) {
			m.addAttribute("member", customer);
			m.addAttribute("admincheck", "일반회원 ID");
		} else {
			m.addAttribute("member", admin);
			m.addAttribute("admincheck", "관리자 ID");
		}
		return "login/processIdFind";
	}
	
	//비밀번호찾기 페이지로 이동
	@GetMapping("/pwFind")
	public String pwFind() {
		return "login/pwFind";
	}
	
	//비밀번호찾기 결과
	@PostMapping("/processPwFind")
	public String processPwFind(@RequestParam String id, @RequestParam String name, Model m) throws SQLException {
			
		customerDto customer = loginDao.pwFind_customer(id, name);
		adminDto admin = loginDao.pwFind_admin(id, name);
		if(customer != null) {
			m.addAttribute("member", customer);
			m.addAttribute("admincheck", "일반회원 ID");
		} else {
			m.addAttribute("member", admin);
			m.addAttribute("admincheck", "관리자 ID");
		}
		return "login/processPwFind";
	}
		
	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session, Model m) throws Exception {
		session.invalidate();
		
		//현재상영작 목록 가져오기
		List<movieShowingDto> showingList;
		showingList = movieDao.getMovieShowing();
		m.addAttribute("showingList", showingList);
		
		return "index";
	}
	
	//회원 탈퇴하기
	@GetMapping("/deleteMember")
	public String deleteMember(HttpSession session, Model m) throws Exception {
		String id = (String)session.getAttribute("login_id");
		loginDao.deleteCustomer(id);
		loginDao.deleteAdmin(id);
		session.invalidate();
		
		//현재상영작 목록 가져오기
		List<movieShowingDto> showingList;
		showingList = movieDao.getMovieShowing();
		m.addAttribute("showingList", showingList);
		
		return "index";
	}
}
