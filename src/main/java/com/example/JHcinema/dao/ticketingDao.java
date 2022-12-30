package com.example.JHcinema.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.example.JHcinema.dto.movieShowingDto;
import com.example.JHcinema.dto.screeningDto;
import com.example.JHcinema.dto.ticketPayDto;

public class ticketingDao {
	
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
	
	//예매하기 - 영화목록 불러오기 메서드
	public List<screeningDto> getScreenMovie() throws Exception{
		Connection conn = open();
		List<screeningDto> screening = new ArrayList<>();
			
		String sql = "select distinct(movie) from screeningMovie order by num";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
			
		try {
			while(rs.next()) {
				screeningDto dto = new screeningDto();
				dto.setMovie(rs.getString("movie"));
				screening.add(dto);
			}
			return screening;
		}catch (Exception ex) {
			System.out.println("getScreenMovie() 에러 :"+ex);
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
	
	//예매하기 - 클릭한 영화 상세정보 보여주기
	public movieShowingDto getMovieInfo(String movie) throws SQLException {
		Connection conn = open();
				
		movieShowingDto dto = new movieShowingDto();
		String sql = "select * from movieShowing where title=?;";
			
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, movie);
		ResultSet rs = pstmt.executeQuery();
				
		rs.next();
		try{
			dto.setTitle(rs.getString("title"));
			dto.setCategory(rs.getString("category"));
			dto.setCountry(rs.getString("country"));
			dto.setMovieTime(rs.getInt("movieTime"));
			dto.setDirector(rs.getString("director"));
			dto.setActor(rs.getString("actor"));
			dto.setImg(rs.getString("img"));
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
	
	//예매하기 - 극장목록 불러오기 메서드
	public List<screeningDto> getScreenCinema(String movie, Date screenDate) throws Exception{
		Connection conn = open();
		List<screeningDto> screening = new ArrayList<>();
				
		String sql = "select distinct(cinema) from screeningMovie where movie=? and screenDate=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, movie);
		pstmt.setDate(2, screenDate);
		ResultSet rs = pstmt.executeQuery();
				
		try {
			while(rs.next()) {
				screeningDto dto = new screeningDto();
				dto.setCinema(rs.getString("cinema"));
				screening.add(dto);
			}
			return screening;
		}catch (Exception ex) {
			System.out.println("getScreenCinema() 에러 :"+ex);
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
	
	//예매하기 - 예매시간 불러오기 메서드
	public List<screeningDto> getScreenTime(String cinema, String movie, Date screenDate) throws Exception{
		Connection conn = open();
		List<screeningDto> screening = new ArrayList<>();
					
		String sql = "select screenTime from screeningMovie where cinema=? and movie=? and screenDate=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cinema);
		pstmt.setString(2, movie);
		pstmt.setDate(3, screenDate);
		ResultSet rs = pstmt.executeQuery();
					
		try {
			while(rs.next()) {
				screeningDto dto = new screeningDto();
				dto.setScreenTime(rs.getString("screenTime"));
				screening.add(dto);
			}
			return screening;
		}catch (Exception ex) {
			System.out.println("getScreenTime() 에러 :"+ex);
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
	
	//예매하기 - 예매가능한 좌석 불러오기
	public List<ticketPayDto> getScreenSeat(String cinema, String movie, Date screenDate, String screenTime) throws Exception{
		Connection conn = open();
		List<ticketPayDto> seatList = new ArrayList<>();
						
		String sql = "SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(ticketPay.seat,',',numbers.n),',',-1) seat FROM (select  1 n union  all  select 2 union  all  select  3  union  all select 4 union  all  select  5) numbers INNER JOIN ticketPay on CHAR_LENGTH(ticketPay.seat) - CHAR_LENGTH(REPLACE(ticketPay.seat ,  ',' ,  ''))>= numbers.n-1 WHERE cinema=? and movie=? and screenDate=? and screenTime=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cinema);
		pstmt.setString(2, movie);
		pstmt.setDate(3, screenDate);
		pstmt.setString(4, screenTime);
		ResultSet rs = pstmt.executeQuery();
						
		try {
			while(rs.next()) {
				ticketPayDto dto = new ticketPayDto();
				dto.setSeat(rs.getString("seat"));
				seatList.add(dto);
			}
			return seatList;
		}catch (Exception ex) {
			System.out.println("getScreenSeat() 에러 :"+ex);
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
	
	//영화예매 결제 테이블에 추가하는 메서드
	public void ticketPay(ticketPayDto dto) throws Exception{
		Connection conn = open();
		String sql = "insert into ticketPay(id, movie, cinema, screenDate, screenTime, seat, people, price, movieImg) values(?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
					
		try {
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getMovie());
			pstmt.setString(3, dto.getCinema());
			pstmt.setDate(4, dto.getScreenDate());
			pstmt.setString(5, dto.getScreenTime());
			pstmt.setString(6, dto.getSeat());
			pstmt.setInt(7, dto.getPeople());
			pstmt.setInt(8, dto.getPrice());
			pstmt.setString(9, dto.getMovieImg());
			pstmt.executeUpdate();
		}catch (Exception ex) {
			System.out.println("영화예매 결제() 에러 : " + ex);
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
	
	//영화예매 결제시 포인트 사용
	public void minusPoint(String id, String admincheck, int minusPoint) {
		Connection conn = open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		if(admincheck.equals("false")) {admincheck = "customer"; } 
		else {admincheck = "admin"; }
		
		try {
			String sql = "select point from " + admincheck + " where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			rs.next();
			int point = rs.getInt("point") - minusPoint;
			
			sql = "update " + admincheck + " set point=" + point + " where id=?";
			pstmt = conn.prepareStatement(sql);		
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			
			if(minusPoint > 0) {
				sql = "insert into pointDetail(id, point, minusPoint, memo, regist_day) values(?, ?, ?, '포인트 사용', current_timestamp());";
				pstmt = conn.prepareStatement(sql);		
				pstmt.setString(1, id);
				pstmt.setInt(2, point);
				pstmt.setInt(3, minusPoint);
				pstmt.executeUpdate();
			}
		} catch (Exception ex) {
			System.out.println("minusPoint() 오류 : " + ex);
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
	
	//영화예매 결제시 포인트 적립
	public void addPoint(String id, String admincheck, int addPoint) {
		Connection conn = open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
			
		if(admincheck.equals("false")) {admincheck = "customer"; } 
		else {admincheck = "admin"; }
			
		try {
			String sql = "select point from " + admincheck + " where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			rs.next();
			int point = rs.getInt("point") + addPoint;
				
			sql = "update " + admincheck + " set point=" + point + " where id=?";
			pstmt = conn.prepareStatement(sql);		
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			
			sql = "insert into pointDetail(id, point, addPoint, memo, regist_day) values(?, ?, ?, '포인트 적립', current_timestamp());";
			pstmt = conn.prepareStatement(sql);		
			pstmt.setString(1, id);
			pstmt.setInt(2, point);
			pstmt.setInt(3, addPoint);
			pstmt.executeUpdate();
			
		} catch (Exception ex) {
			System.out.println("addPoint() 오류 : " + ex);
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
