package com.example.JHcinema.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.JHcinema.dao.movieDao;
import com.example.JHcinema.dto.movieShowingDto;

@Controller
public class controller {
	
	@Autowired
	private movieDao movieDao;
	
	//메인페이지로 이동
	@GetMapping("/")
	public String index(Model m) throws Exception {
		//현재상영작 목록 가져오기
		List<movieShowingDto> showingList;
		showingList = movieDao.getMovieShowing();
		m.addAttribute("showingList", showingList);
		
		return "index";
	}
	
	//극장 페이지로 이동
	@GetMapping("/cinema")
	public String cinema() {
		return "cinema/cinema";
	}
	
	//스토어 페이지로 이동
	@GetMapping("/store")
	public String store() {
		return "store/store";
	}
	
	//진행중인 이벤트 페이지로 이동
	@GetMapping("/event_ing")
	public String event_ing() {
		return "event/event_ing";
	}
	
	//종료된 이벤트 페이지로 이동
	@GetMapping("/event_end")
	public String event_end() {
		return "event/event_end";
	}
	
	//혜택 페이지로 이동
	@GetMapping("/benefit")
	public String benefit() {
		return "benefit/benefit";
	}
	
}
