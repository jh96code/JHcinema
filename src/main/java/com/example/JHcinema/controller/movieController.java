package com.example.JHcinema.controller;

import java.io.File;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.JHcinema.dao.movieDao;
import com.example.JHcinema.dto.movieComingDto;
import com.example.JHcinema.dto.movieShowingDto;
import com.example.JHcinema.dto.movieShowingReplyDto;

@Controller
public class movieController {
	
	@Autowired
	private movieDao movieDao;
	
	//프로퍼티파일로 부터 저장 경로 참조
	@Value("${movie.imgdir}")
	String img_dir;
	
	//영화홈 페이지로 이동
	@GetMapping("/movie_home")
	public String movie_home(Model m) throws Exception {
		//현재상영작 목록 가져오기
		List<movieShowingDto> showingList;
		showingList = movieDao.getMovieShowing();
		m.addAttribute("showingList", showingList);
		
		//상영예정작 목록 가져오기
		List<movieComingDto> comingList;
		comingList = movieDao.getMovieComing();
		m.addAttribute("comingList", comingList);
		
		return "movie/movie_home";
	}
		
	//현재상영작 페이지로 이동
	@GetMapping("/movie_showing")
	public String movie_showing(Model m) throws Exception {
		//현재상영작 목록 가져오기
		List<movieShowingDto> showingList;
		showingList = movieDao.getMovieShowing();
		m.addAttribute("showingList", showingList);
				
		//상영예정작 목록 가져오기
		List<movieComingDto> comingList;
		comingList = movieDao.getMovieComing();
		m.addAttribute("comingList", comingList);
		return "movie/movie_showing";
	}
	
	//현재상영작 상세보기(+댓글)
	@GetMapping("/movieView_showing")
	public String movieView_showing(@RequestParam int num, Model m) throws SQLException {
		movieShowingDto dto = movieDao.getShowing(num);
		m.addAttribute("movie", dto);
		m.addAttribute("status", "현재상영작");
		
		List<movieShowingReplyDto> replyDto = movieDao.getMovieReply(num);
		m.addAttribute("reply", replyDto);
		
		return "movie/movieView";
	}
	
	//현재상영작 댓글 추가하기
	@PostMapping("/addMovieReply")
	public String BoardReplyWrite(movieShowingReplyDto replyDto, HttpServletRequest request, Model m) throws Exception {
		String movie_num = request.getParameter("movie_num");
		movieDao.addMovieReply(replyDto);
		return "redirect:/movieView_showing?num="+movie_num;
	}
	
	//현재상영작 댓글 삭제하기
	@GetMapping("/deleteMovieReply")
	public String BoardReplyDelete(HttpServletRequest request) {
		String movie_num = request.getParameter("movie_num");
		int reply_num = Integer.parseInt(request.getParameter("reply_num"));
		movieDao.delMovieReply(reply_num);

		return "redirect:/movieView_showing?num="+movie_num;
	}
		
	//상영예정작 페이지로 이동
	@GetMapping("/movie_coming")
	public String movie_coming(Model m) throws Exception {
		//현재상영작 목록 가져오기
		List<movieShowingDto> showingList;
		showingList = movieDao.getMovieShowing();
		m.addAttribute("showingList", showingList);
						
		//상영예정작 목록 가져오기
		List<movieComingDto> comingList;
		comingList = movieDao.getMovieComing();
		m.addAttribute("comingList", comingList);
				
		return "movie/movie_coming";
	}
	
	//상영예정작 상세보기
	@GetMapping("/movieView_coming")
	public String movieView_coming(@RequestParam int num, Model m) throws SQLException {
		movieComingDto dto = movieDao.getComing(num);
		m.addAttribute("movie", dto);
		m.addAttribute("status", "상영예정작");
		return "movie/movieView";
	}
	
	//영화등록(현재상영작) 페이지로 이동
	@GetMapping("/addMovie_showing")
	public String addMovie_showing() {
		return "movie/addMovie_showing";
	}
	
	//영화등록(상영예정작) 페이지로 이동
	@GetMapping("/addMovie_coming")
	public String addMovie_coming() {
		return "movie/addMovie_coming";
	}
	
	//영화등록(현재상영작) 프로세스
	@PostMapping("/procAddMovie_showing")
	public String procAddMovie_showing(movieShowingDto dto, @RequestParam("file") MultipartFile file, Model m) throws Exception {
		//저장 파일 객체 생성
		File dest = new File(img_dir+"/"+file.getOriginalFilename()); 
			
		//이미지 파일 저장
		file.transferTo(dest);
		
		//객체에 파일 이름 저장
		dto.setImg(dest.getName());
		movieDao.addMovie_showing(dto);
		
		//현재상영작 목록 가져오기
		List<movieShowingDto> showingList;
		showingList = movieDao.getMovieShowing();
		m.addAttribute("showingList", showingList);
								
		//상영예정작 목록 가져오기
		List<movieComingDto> comingList;
		comingList = movieDao.getMovieComing();
		m.addAttribute("comingList", comingList);
		
		return "movie/movie_showing";
	}
		
	//영화등록(상영예정작) 프로세스
	@PostMapping("/procAddMovie_coming")
	public String procAddMovie_coming(movieComingDto dto, @RequestParam("file") MultipartFile file, Model m) throws Exception {
		//저장 파일 객체 생성
		File dest = new File(img_dir+"/"+file.getOriginalFilename()); 
			
		//이미지 파일 저장
		file.transferTo(dest);
		
		//객체에 파일 이름 저장
		dto.setImg(dest.getName());
		movieDao.addMovie_coming(dto);
		
		//현재상영작 목록 가져오기
		List<movieShowingDto> showingList;
		showingList = movieDao.getMovieShowing();
		m.addAttribute("showingList", showingList);
								
		//상영예정작 목록 가져오기
		List<movieComingDto> comingList;
		comingList = movieDao.getMovieComing();
		m.addAttribute("comingList", comingList);
		
		return "movie/movie_coming";
	}
	
	//영화 하트수 증가시키기
	@GetMapping("/addHeart_index")
	public String addHeart_index(@RequestParam int num) {
		movieDao.addHeart(num);
		return "redirect:/";
	}
	
	//영화 하트수 증가시키기
	@GetMapping("/addHeart")
	public String addHeart(@RequestParam int num) {
		movieDao.addHeart(num);
		return "redirect:/movieView_showing?num="+num;
	}
}
