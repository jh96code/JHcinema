package com.example.JHcinema.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.JHcinema.dao.loginDao;
import com.example.JHcinema.dao.ticketingDao;
import com.example.JHcinema.dto.adminDto;
import com.example.JHcinema.dto.customerDto;
import com.example.JHcinema.dto.movieShowingDto;
import com.example.JHcinema.dto.screeningDto;
import com.example.JHcinema.dto.ticketPayDto;

@Controller
public class ticketingController {
	
	@Autowired
	private ticketingDao ticketingDao;
	@Autowired
	private loginDao loginDao;
	
	//예매하기 페이지로 이동
	@GetMapping("/ticketing_date")
	public String ticketing_date() {
		return "ticketing/ticketing_date";
	}
	
	//예매하기 날짜선택후 영화목록 보여주기
	@PostMapping("/ticketing_movie")
	public String ticketing_movie(@ModelAttribute screeningDto dto, Model m) throws Exception {
		Date screenDate = dto.getScreenDate();
		m.addAttribute("date", screenDate);
		
		//선택한 날짜에 상영하는 영화목록 가져오기
		List<screeningDto> screeningMovie = ticketingDao.getScreenMovie();
		m.addAttribute("screeningMovie", screeningMovie);
		
		
		return "ticketing/ticketing_movie";
	}
	
	//예매하기 영화선택후 극장목록 보여주기
	@RequestMapping("/ticketing_cinema")
	public String ticketing_cinema(@ModelAttribute screeningDto dto, Model m) throws Exception {
		Date screenDate = dto.getScreenDate();
		m.addAttribute("date", screenDate);
		String movie = dto.getMovie();
		m.addAttribute("movie", movie);
		
		//선택한 날짜에 상영하는 영화목록 가져오기
		List<screeningDto> screeningMovie = ticketingDao.getScreenMovie();
		m.addAttribute("screeningMovie", screeningMovie);
		movieShowingDto movie_info = ticketingDao.getMovieInfo(movie);	//클릭한 영화 상세정보 보여주기
		m.addAttribute("movie_info", movie_info);
		//선택한 날짜에 상영하는 극장목록 가져오기
		List<screeningDto> screeningCinema = ticketingDao.getScreenCinema(movie, screenDate);
		m.addAttribute("screeningCinema", screeningCinema);
		
		return "ticketing/ticketing_cinema";
	}
	
	//예매하기 극장선택후 상영시간목록 보여주기
	@PostMapping("/ticketing_time")
	public String ticketing_time(@ModelAttribute screeningDto dto, Model m) throws Exception {
		Date screenDate = dto.getScreenDate();
		m.addAttribute("date", screenDate);
		String movie = dto.getMovie();
		m.addAttribute("movie", movie);
		String cinema = dto.getCinema();
		m.addAttribute("cinema", cinema);
		String movieImg = dto.getMovieImg();
		m.addAttribute("movieImg", movieImg);
		
		//선택한 날짜에 상영하는 영화목록 가져오기
		List<screeningDto> screeningMovie = ticketingDao.getScreenMovie();
		m.addAttribute("screeningMovie", screeningMovie);
		movieShowingDto movie_info = ticketingDao.getMovieInfo(movie);	//클릭한 영화 상세정보 보여주기
		m.addAttribute("movie_info", movie_info);
		//선택한 날짜에 상영하는 극장목록 가져오기
		List<screeningDto> screeningCinema = ticketingDao.getScreenCinema(movie, screenDate);
		m.addAttribute("screeningCinema", screeningCinema);
		//선택한 날짜에 상영하는 시간목록 가져오기
		List<screeningDto> screeningTime = ticketingDao.getScreenTime(cinema, movie, screenDate);
		m.addAttribute("screeningTime", screeningTime);
		
		return "ticketing/ticketing_time";
	}
	
	//예매하기 시간선택후 좌석목록 보여주기
	@PostMapping("/ticketing_seat")
	public String ticketing_seat(@ModelAttribute screeningDto dto, Model m) throws Exception {
		Date screenDate = dto.getScreenDate();
		m.addAttribute("date", screenDate);
		String movie = dto.getMovie();
		m.addAttribute("movie", movie);
		String cinema = dto.getCinema();
		m.addAttribute("cinema", cinema);
		String movieImg = dto.getMovieImg();
		m.addAttribute("movieImg", movieImg);
		String screenTime = dto.getScreenTime();
		m.addAttribute("screenTime", screenTime);
			
		//선택한 날짜에 상영하는 영화목록 가져오기
		List<screeningDto> screeningMovie = ticketingDao.getScreenMovie();
		m.addAttribute("screeningMovie", screeningMovie);
		movieShowingDto movie_info = ticketingDao.getMovieInfo(movie);	//클릭한 영화 상세정보 보여주기
		m.addAttribute("movie_info", movie_info);
		//선택한 날짜에 상영하는 극장목록 가져오기
		List<screeningDto> screeningCinema = ticketingDao.getScreenCinema(movie, screenDate);
		m.addAttribute("screeningCinema", screeningCinema);
		//선택한 날짜에 상영하는 시간목록 가져오기
		List<screeningDto> screeningTime = ticketingDao.getScreenTime(cinema, movie, screenDate);
		m.addAttribute("screeningTime", screeningTime);
		//선택한 날짜에 예매한 좌석목록 가져오기
		List<ticketPayDto> usedSeat = ticketingDao.getScreenSeat(cinema, movie, screenDate, screenTime);
		m.addAttribute("usedSeat", usedSeat);
			
		return "ticketing/ticketing_seat";
	}
	
	//예매하기 결제 페이지로 이동
	@PostMapping("/ticketing_pay")
	public String ticketing_pay(@ModelAttribute ticketPayDto dto, @RequestParam String id, Model m) throws Exception {
		m.addAttribute("date", dto.getScreenDate());
		m.addAttribute("movie", dto.getMovie());
		m.addAttribute("cinema", dto.getCinema());
		m.addAttribute("screenTime", dto.getScreenTime());
		m.addAttribute("seat", dto.getSeat());
		m.addAttribute("people", dto.getPeople());
		m.addAttribute("price", dto.getPrice());
		m.addAttribute("movieImg", dto.getMovieImg());
		
		//로그인된 회원정보 들고오기
		customerDto customer = loginDao.getCustomer(id);
		adminDto admin = loginDao.getAdmin(id);
		if(customer != null) {
			m.addAttribute("member", customer);
		} else {
			m.addAttribute("member", admin);
		}
				
		return "ticketing/ticketing_pay";
	}
	
	//예매하기 결제 성공!!
	@PostMapping("/ticketing_success")
	public String ticketing_success(ticketPayDto dto, HttpServletRequest request) throws Exception{
		String id = request.getParameter("id");
		String admincheck = request.getParameter("admincheck");
		int minusPoint = Integer.parseInt(request.getParameter("miunsPoint"));
		int addPoint = Integer.parseInt(request.getParameter("addPoint"));
		
		ticketingDao.minusPoint(id, admincheck, minusPoint);
		ticketingDao.addPoint(id, admincheck, addPoint);
		
		ticketingDao.ticketPay(dto);
		return "ticketing/ticketing_success";
	}
	
	
}
