package com.example.JHcinema.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.JHcinema.dao.csDao;
import com.example.JHcinema.dto.contactDto;
import com.example.JHcinema.dto.faqDto;
import com.example.JHcinema.dto.noticeDto;

@Controller
public class csController {

	@Autowired
	private csDao csDao;
	
	//FAQ 페이지로 이동
	@RequestMapping("/FAQ")
	public String FAQ(HttpServletRequest request, Model m) throws Exception {
		
		//FAQ 목록 가져오기
		List<faqDto> FAQList;
		int pageNum_FAQ = 1; // 게시판 페이지 갯수
		final int limit_FAQ = 5; // 페이지 내에 최대 게시판 수

		// 페이지 번호 값을 받아온다??(FAQ에서 jstl태그 이용)
		if (request.getParameter("pageNum_FAQ") != null)
			pageNum_FAQ = Integer.parseInt(request.getParameter("pageNum_FAQ"));

		String items_FAQ = request.getParameter("items_FAQ"); // 게시판 검색 타이틀(form태그의 값을 리퀘스트로 받아온다)
		String text_FAQ = request.getParameter("text_FAQ"); // 게시판 검색 내용(form태그의 값을 리퀘스트로 받아온다)

		int total_record_FAQ = csDao.getFAQCount(items_FAQ, text_FAQ);// 검색된 게시판의 갯수(레코드=행)
		FAQList = csDao.getFAQ(pageNum_FAQ, limit_FAQ, items_FAQ, text_FAQ);

		int total_page_FAQ; // 총 페이지수

		if (total_record_FAQ % limit_FAQ == 0) { // 총 게시판 수를 limit으로 나누어 나머지를 계산(나머지값이 0이라면 페이지 수 별도로 추가 안함)
			total_page_FAQ = total_record_FAQ / limit_FAQ;
			Math.floor(total_page_FAQ);
		} else { // 총 게시판 수를 limit으로 나누어 나머지를 계산(나머지값이 0이 아니라면 페이지수 + 1)
			total_page_FAQ = total_record_FAQ / limit_FAQ;
			Math.floor(total_page_FAQ);
			total_page_FAQ = total_page_FAQ + 1;
		}
		request.setAttribute("pageNum_FAQ", pageNum_FAQ);
		request.setAttribute("total_page_FAQ", total_page_FAQ);
		request.setAttribute("total_record_FAQ", total_record_FAQ);
		m.addAttribute("FAQList", FAQList);

		return "cs/FAQ";
	}
	
	//공지사항 페이지로 이동
	@RequestMapping("/notice")
	public String cs_home(HttpServletRequest request, Model m) throws Exception {
			
		//공지사항 목록 가져오기
		List<noticeDto> noticeList;
		int pageNum_notice = 1; // 게시판 페이지 갯수
		final int limit_notice = 5; // 페이지 내에 최대 게시판 수

		// 페이지 번호 값을 받아온다??(notice에서 jstl태그 이용)
		if (request.getParameter("pageNum_notice") != null)
			pageNum_notice = Integer.parseInt(request.getParameter("pageNum_notice"));

		String items_notice = request.getParameter("items_notice"); // 게시판 검색 타이틀(form태그의 값을 리퀘스트로 받아온다)
		String text_notice = request.getParameter("text_notice"); // 게시판 검색 내용(form태그의 값을 리퀘스트로 받아온다)

		int total_record_notice = csDao.getNoticeCount(items_notice, text_notice);// 검색된 게시판의 갯수(레코드=행)
		noticeList = csDao.getNotice(pageNum_notice, limit_notice, items_notice, text_notice);

		int total_page_notice; // 총 페이지수

		if (total_record_notice % limit_notice == 0) { // 총 게시판 수를 limit으로 나누어 나머지를 계산(나머지값이 0이라면 페이지 수 별도로 추가 안함)
			total_page_notice = total_record_notice / limit_notice;
			Math.floor(total_page_notice);
		} else { // 총 게시판 수를 limit으로 나누어 나머지를 계산(나머지값이 0이 아니라면 페이지수 + 1)
			total_page_notice = total_record_notice / limit_notice;
			Math.floor(total_page_notice);
			total_page_notice = total_page_notice + 1;
		}
		request.setAttribute("pageNum_notice", pageNum_notice);
		request.setAttribute("total_page_notice", total_page_notice);
		request.setAttribute("total_record_notice", total_record_notice);
		m.addAttribute("noticeList", noticeList);

		return "cs/notice";
	}
	
	//1:1문의(일반회원) 페이지로 이동
	@GetMapping("/contact_customer")
	public String contact_customer(@RequestParam String id, Model m) throws Exception {
		//1:1문의 목록 가져오기
		List<contactDto> contactList = csDao.getContact(id);
		m.addAttribute("contactList", contactList);
			
		return "cs/contact_customer";
	}
	
	//1:1문의(관리자) 페이지로 이동
	@GetMapping("/contact_admin")
	public String contact_admin(Model m) throws Exception {
		//1:1문의 목록 가져오기
		List<contactDto> contactList = csDao.getAllContact();
		m.addAttribute("contactList", contactList);
		
		return "cs/contact_admin";
	}

	
	//공지사항 상세보기 페이지로 이동
	@GetMapping("/noticeView")
	public String noticeView(@RequestParam int num, Model m) throws SQLException {
		noticeDto notice = csDao.getNotice(num);
		m.addAttribute("notice", notice);
		csDao.addHit(num);
		
		return "cs/noticeView";
	}
	
	//공지사항 삭제하기
	@GetMapping("/deleteNotice")
	public String deleteNotice(@RequestParam int num) {
		csDao.delNotice(num);
		return "redirect:/notice";
	}
	
	//FAQ 등록 페이지로 이동
	@GetMapping("/addFAQ")
	public String addFAQ() {
		return "cs/addFAQ";
	}
	
	//FAQ 등록 완료 프로세스
	@PostMapping("/procAddFAQ")
	public String procAddFAQ(faqDto FAQ) throws Exception {
		csDao.addFAQ(FAQ);
		return "redirect:/FAQ";
	}
		
	//공지사항 등록 페이지로 이동
	@GetMapping("/addNotice")
	public String addNotice() {
		return "cs/addNotice";
	}
	
	//공지사항 등록 완료 프로세스
	@PostMapping("/procAddNotice")
	public String procAddNotice(noticeDto notice) throws Exception {
		csDao.addNotice(notice);
		return "redirect:/notice";
	}
		
	//1:1문의하기 페이지로 이동
	@GetMapping("/addContact")
	public String addContact() {
		return "cs/addContact";
	}
	
	//1:1문의보내기 완료 프로세스
	@PostMapping("/procAddContact")
	public String procAddContact(@RequestParam String cus_id, contactDto contact) throws Exception {
		csDao.addContact(contact);
		return "redirect:/contact_customer?id=" + cus_id;
	}
	
	//1:1문의 답변 완료 프로세스
	@PostMapping("/contactReply")
	public String procAddContact(contactDto contact) throws Exception {
		csDao.contactReply(contact);
		return "redirect:/contact_admin";
	}
	
	//1:1문의하기 삭제하기
	@GetMapping("/deleteContact")
	public String deleteContact(@RequestParam int num, @RequestParam String cus_id) {
		csDao.deleteContact(num);
		return "redirect:/contact_customer?id=" + cus_id;
	}
	
}
