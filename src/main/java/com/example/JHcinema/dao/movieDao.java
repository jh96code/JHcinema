package com.example.JHcinema.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.example.JHcinema.dto.movieComingDto;
import com.example.JHcinema.dto.movieShowingDto;
import com.example.JHcinema.dto.movieShowingReplyDto;

public class movieDao {
	
	//DB연결 
	final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
	final String JDBC_URL = "jdbc:mysql://localhost:3306/jhcinema";
	public Connection open() {
		Connection conn = null;
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(JDBC_URL, "root", "0000");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	//영화(현재상영작) 목록 불러오기
	public List<movieShowingDto> getMovieShowing() throws Exception{
		Connection conn = open();
		List<movieShowingDto> movieList = new ArrayList<>();
		
		String sql = "select * from movieShowing";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		try {
			while(rs.next()) {
				movieShowingDto dto = new movieShowingDto();
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setOpenDate(rs.getDate("openDate"));
				dto.setImg(rs.getString("img"));
				dto.setContent(rs.getString("content"));
				dto.setHeart(rs.getInt("heart"));
				movieList.add(dto);
			}return movieList;
		}catch (Exception ex) {
			System.out.println("getMovieShowing() 에러 :"+ex);
		} finally {
			try {
				if (rs !=null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
		return null;
	}
	
	//현재상영작 상세목록 들고오기
	public movieShowingDto getShowing(int num) throws SQLException {
		Connection conn = open();
				
		movieShowingDto dto = new movieShowingDto();
		String sql = "select * from movieShowing where num=?";
			
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		ResultSet rs = pstmt.executeQuery();
				
		rs.next();
		try{
			dto.setNum(rs.getInt("num"));
			dto.setTitle(rs.getString("title"));
			dto.setCategory(rs.getString("category"));
			dto.setCountry(rs.getString("country"));
			dto.setDirector(rs.getString("director"));
			dto.setActor(rs.getString("actor"));
			dto.setMovieTime(rs.getInt("movieTime"));
			dto.setOpenDate(rs.getDate("openDate"));
			dto.setImg(rs.getString("img"));
			dto.setContent(rs.getString("content"));
			dto.setHeart(rs.getInt("heart"));
			pstmt.executeQuery();
			return dto;
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {		
				if (rs != null) 
					rs.close();
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}	
		}
		return null;
	}
	
	//영화(상영예정작) 목록 불러오기
	public List<movieComingDto> getMovieComing() throws Exception{
		Connection conn = open();
		List<movieComingDto> movieList = new ArrayList<>();
			
		String sql = "select * from movieComing";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
			
		try {
			while(rs.next()) {
				movieComingDto dto = new movieComingDto();
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setCategory(rs.getString("category"));
				dto.setCountry(rs.getString("country"));
				dto.setDirector(rs.getString("director"));
				dto.setActor(rs.getString("actor"));
				dto.setMovieTime(rs.getInt("movieTime"));
				dto.setOpenDate(rs.getDate("openDate"));
				dto.setImg(rs.getString("img"));
				dto.setContent(rs.getString("content"));
				movieList.add(dto);
			}return movieList;
		}catch (Exception ex) {
			System.out.println("getMovieComing() 에러 :"+ex);
		} finally {
			try {
				if (rs !=null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
		return null;
	}
	
	//현재상영작 상세목록 들고오기
	public movieComingDto getComing(int num) throws SQLException {
		Connection conn = open();
					
		movieComingDto dto = new movieComingDto();
		String sql = "select * from movieComing where num=?";
				
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		ResultSet rs = pstmt.executeQuery();
					
		rs.next();
		try{
			dto.setNum(rs.getInt("num"));
			dto.setTitle(rs.getString("title"));
			dto.setCategory(rs.getString("category"));
			dto.setCountry(rs.getString("country"));
			dto.setDirector(rs.getString("director"));
			dto.setActor(rs.getString("actor"));
			dto.setMovieTime(rs.getInt("movieTime"));
			dto.setOpenDate(rs.getDate("openDate"));
			dto.setImg(rs.getString("img"));
			dto.setContent(rs.getString("content"));
			pstmt.executeQuery();
			return dto;
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {		
				if (rs != null) 
					rs.close();
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}	
		}
		return null;
	}
	
	//영화(현재상영작) 추가 메소드
	public void addMovie_showing(movieShowingDto dto) throws Exception{
		Connection conn = open();
		String sql = "insert into movieShowing(title, category, country, director, actor, movieTime, openDate, img, content) values(?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
			
		try {
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getCategory());
			pstmt.setString(3, dto.getCountry());
			pstmt.setString(4, dto.getDirector());
			pstmt.setString(5, dto.getActor());
			pstmt.setInt(6, dto.getMovieTime());
			pstmt.setDate(7, dto.getOpenDate());
			pstmt.setString(8, dto.getImg());
			pstmt.setString(9, dto.getContent());
			pstmt.executeUpdate();
		}catch (Exception ex) {
			System.out.println("현재상영작 추가() 에러 : " + ex);
		} finally {
			try {									
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}		
		}	
	}
	
	//영화(상영예정작) 추가 메소드
	public void addMovie_coming(movieComingDto dto) throws Exception{
		Connection conn = open();
		String sql = "insert into movieComing(title, category, country, director, actor, movieTime, openDate, img, content) values(?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
				
		try {
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getCategory());
			pstmt.setString(3, dto.getCountry());
			pstmt.setString(4, dto.getDirector());
			pstmt.setString(5, dto.getActor());
			pstmt.setInt(6, dto.getMovieTime());
			pstmt.setDate(7, dto.getOpenDate());
			pstmt.setString(8, dto.getImg());
			pstmt.setString(9, dto.getContent());
			pstmt.executeUpdate();
		}catch (Exception ex) {
			System.out.println("상영예정작 추가() 에러 : " + ex);
		} finally {
			try {									
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}		
		}	
	}
	
	//현재상영작 댓글 목록 들고오기
	public List<movieShowingReplyDto> getMovieReply(int num) throws SQLException{
		List<movieShowingReplyDto> replyList = new ArrayList<>();
		Connection conn = open();
		String sql = "select * from movieShowing_reply where movie_num=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		ResultSet rs = pstmt.executeQuery();
				
		try{ 
			while(rs.next()) { //while문을 써서 DB에 있는값 전체를 ResultSet값에 들어간 값을 차례로 dto에 담는 과정
				movieShowingReplyDto dto = new movieShowingReplyDto();
				dto.setNum(rs.getInt("num"));
				dto.setContent(rs.getString("content"));
				dto.setRegist_day(rs.getDate("regist_day"));
				dto.setCus_id(rs.getString("cus_id"));
				replyList.add(dto);
			}
			return replyList;
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {										
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
				if (rs != null) 
					rs.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}	
		}
		return null;
	}
	
	//현재상영작 댓글 추가하는 메소드
	public void addMovieReply(movieShowingReplyDto dto) throws Exception {
		Connection conn = open();
				
		String sql = "insert into movieShowing_reply(num, content, regist_day, movie_num, cus_id) values(?,?,CURRENT_TIMESTAMP(),?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
				
		try{ // sql문의 파라미타(?)값에 데이터 대입
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getMovie_num());
			pstmt.setString(4, dto.getCus_id());
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {										
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}	
		}
	}
	
	//현재상영작 댓글 삭제하는 메소드
	public void delMovieReply(int num){
		Connection conn = open();
		PreparedStatement pstmt = null;
		
		String sql = "delete from movieShowing_reply where num=?";
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		}catch (Exception ex) {
			System.out.println("delMovieReply() 오류 : " + ex);
		} finally {
			try {										
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}		
		}
	}
	
	//영화 하트 수 증가시키기 메서드
	public void addHeart(int num) {
		Connection conn = open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select heart from movieShowing where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			int heart = 0;
			if (rs.next()) {
				heart = rs.getInt("heart") + 1;
			}

			sql = "update movieShowing set heart=? where num=?";
			pstmt = conn.prepareStatement(sql);		
			pstmt.setInt(1, heart);
			pstmt.setInt(2, num);
			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("updateHeart() 오류 : " + ex);
		} finally {
			try {
				if (rs != null) 
					rs.close();							
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}			
		}
	}
	
}
