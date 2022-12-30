package com.example.JHcinema.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.example.JHcinema.dto.contactDto;
import com.example.JHcinema.dto.faqDto;
import com.example.JHcinema.dto.noticeDto;

public class csDao {

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
	
	//FAQ 테이블의 레코드 개수, 게시판 검색 기능
	public int getFAQCount(String items_FAQ, String text_FAQ) {
		Connection conn = open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
				
		//System.out.println("게시판 검색 분류 :" + items_FAQ);
		//System.out.println("게시판 검색어 :" + text_FAQ);
				
		int cnt_FAQ = 0; //count 개수
		String sql;
		if (items_FAQ == null && text_FAQ == null)	{//검색에 입력된값이 없다면 게시판 전체갯수를 들고온다.(default)
			sql = "select count(*) from FAQ";
		}else {	//검색에 입력된값(items, text)를 통해 sql문에 해당하는 게시판만 들고온다.
			sql = "SELECT count(*) FROM FAQ where " + items_FAQ + " like'%" + text_FAQ +"%'";
		}
				
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) //rs.next()값이 true(ResultSet에 값이 들어있다면)이면 rs에 있는값을 int타입으로 받아온다 = count(*)
				cnt_FAQ = rs.getInt(1);
		} catch (Exception ex) {
			System.out.println("getFAQCount() 오류: " + ex);
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
		return cnt_FAQ;//검색된 게시판의 총 갯수(int cnt_FAQ)를 리턴한다 (=하는 이유는 검색된 게시판의 수를 알아야 페이징처리 가능)
	}
	
	//FAQ 전체 목록 들고오기
	public List<faqDto> getFAQ(int page_FAQ, int limit_FAQ, String items_FAQ, String text_FAQ) throws Exception{
		Connection conn = open();
		List<faqDto> FAQList = new ArrayList<>();
		
		int total_record_FAQ = getFAQCount(items_FAQ, text_FAQ);
		int start_FAQ = (page_FAQ - 1) * limit_FAQ;				
		int index_FAQ = start_FAQ + 1;
		
		//페이징 처리 sql
		String sql;
		if (items_FAQ == null && text_FAQ == null) //검색에 입력된값이 없다면 게시판 전체갯수를 들고온다.(default)
			sql = "select * from FAQ ORDER BY num desc";
		else //검색에 입력된값(items, text)를 통해 sql문에 해당하는 게시판만 들고온다.
			sql = "SELECT * from FAQ where " + items_FAQ + " like'%" + text_FAQ + "%' ORDER BY num desc";
			//System.out.println("불러올때 sql문= " + sql);
		PreparedStatement pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
		//select문이기 때문에 executeQuery() 실행
		ResultSet rs = pstmt.executeQuery();
				
		try {
			while(rs.absolute(index_FAQ)) {
				faqDto dto = new faqDto();
				dto.setNum(rs.getInt("num"));
				dto.setCategory(rs.getString("category"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				FAQList.add(dto);
				
				if (index_FAQ < (start_FAQ + limit_FAQ) && index_FAQ <= total_record_FAQ) {
					index_FAQ++;
				} else {
					break;
				}
				
			}return FAQList;
		}catch (Exception ex) {
			System.out.println("getFAQ() 에러 :"+ex);
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
	
	//공지사항 테이블의 레코드 개수, 게시판 검색 기능
	public int getNoticeCount(String items_notice, String text_notice) {
		Connection conn = open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
					
		//System.out.println("게시판 검색 분류 :" + items_notice);
		//System.out.println("게시판 검색어 :" + text_notice);
					
		int cnt_notice = 0; //count 개수
		String sql;
		if (items_notice == null && text_notice == null)	{//검색에 입력된값이 없다면 게시판 전체갯수를 들고온다.(default)
			sql = "select count(*) from notice";
		}else {	//검색에 입력된값(items, text)를 통해 sql문에 해당하는 게시판만 들고온다.
			sql = "SELECT count(*) FROM notice where " + items_notice + " like'%" + text_notice +"%'";
		}
					
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) //rs.next()값이 true(ResultSet에 값이 들어있다면)이면 rs에 있는값을 int타입으로 받아온다 = count(*)
				cnt_notice = rs.getInt(1);
		} catch (Exception ex) {
			System.out.println("getNoticeCount() 오류: " + ex);
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
		return cnt_notice;//검색된 게시판의 총 갯수(int cnt_notice)를 리턴한다 (=하는 이유는 검색된 게시판의 수를 알아야 페이징처리 가능)
	}
	
	//공지사항 전체 목록 들고오기
	public List<noticeDto> getNotice(int page_notice, int limit_notice, String items_notice, String text_notice) throws Exception{
		Connection conn = open();
		List<noticeDto> noticeList = new ArrayList<>();
					
		int total_record_notice = getFAQCount(items_notice, text_notice);
		int start_notice = (page_notice - 1) * limit_notice;				
		int index_notice = start_notice + 1;
		
		//페이징 처리 sql
		String sql;
		if (items_notice == null && text_notice == null) //검색에 입력된값이 없다면 게시판 전체갯수를 들고온다.(default)
			sql = "select * from notice ORDER BY num asc";
		else //검색에 입력된값(items, text)를 통해 sql문에 해당하는 게시판만 들고온다.
			sql = "SELECT * from notice where " + items_notice + " like'%" + text_notice + "%' ORDER BY num asc";
			//System.out.println("불러올때 sql문= " + sql);
		PreparedStatement pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
		//select문이기 때문에 executeQuery() 실행
		ResultSet rs = pstmt.executeQuery();
					
		try {
			while(rs.absolute(index_notice)) {
				noticeDto dto = new noticeDto();
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRegist_day(rs.getDate("regist_day"));
				noticeList.add(dto);
				
				if (index_notice < (start_notice + limit_notice) && index_notice <= total_record_notice) {
					index_notice++;
				} else {
					break;
				}
				
			}return noticeList;
		}catch (Exception ex) {
			System.out.println("getNotice() 에러 :"+ex);
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
	
	//공지사항 상세목록 들고오기
	public noticeDto getNotice(int num) throws SQLException {
		Connection conn = open();
					
		noticeDto dto = new noticeDto();
		String sql = "select * from notice where num=?";
				
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		ResultSet rs = pstmt.executeQuery();
					
		rs.next();
		try{
			dto.setNum(rs.getInt("num"));
			dto.setTitle(rs.getString("title"));
			dto.setContent(rs.getString("content"));
			dto.setHit(rs.getInt("hit"));
			dto.setRegist_day(rs.getDate("regist_day"));
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
	
	//공지사항 조회수 증가시키기
	public void addHit(int num) {
		Connection conn = open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
			
		try {
			String sql = "select hit from notice where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
				
			int hit = 0;
			if (rs.next()) {
				hit = rs.getInt("hit") + 1;
			}

			sql = "update notice set hit=? where num=?";
			pstmt = conn.prepareStatement(sql);		
			pstmt.setInt(1, hit);
			pstmt.setInt(2, num);
			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("addHit() 오류 : " + ex);
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
	
	//공지사항 삭제 메소드
	public void delNotice(int num){
		Connection conn = open();
		PreparedStatement pstmt = null;
		
		String sql = "delete from notice where num=?";
		
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		}catch (Exception ex) {
			System.out.println("delNotice() 오류 : " + ex);
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
	
	//FAQ 추가 메소드
	public void addFAQ(faqDto dto) throws Exception{
		Connection conn = open();
		String sql = "insert into FAQ(num, category, title, content) values(?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
				
		try {
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getCategory());
			pstmt.setString(3, dto.getTitle());
			pstmt.setString(4, dto.getContent());
			pstmt.executeUpdate();
		}catch (Exception ex) {
			System.out.println("FAQ 추가() 에러 : " + ex);
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
	
	//공지사항 추가 메소드
	public void addNotice(noticeDto dto) throws Exception{
		Connection conn = open();
		String sql = "insert into notice(num, title, content, regist_day) values(?,?,?,current_date())";
		PreparedStatement pstmt = conn.prepareStatement(sql);
					
		try {
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.executeUpdate();
		}catch (Exception ex) {
			System.out.println("notice 추가() 에러 : " + ex);
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
	
	//1:1문의 보내기 메소드
	public void addContact(contactDto dto) throws Exception{
		Connection conn = open();
		String sql = "insert into contact(num, category, title, content, regist_day, cus_id) values(?,?,?,?,current_date(),?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
						
		try {
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getCategory());
			pstmt.setString(3, dto.getTitle());
			pstmt.setString(4, dto.getContent());
			pstmt.setString(5, dto.getCus_id());
			pstmt.executeUpdate();
		}catch (Exception ex) {
			System.out.println("contact 추가() 에러 : " + ex);
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
	
	//1:1문의 전체 내역 갯수 가져오기
	public int getAllContactCnt() {
		Connection conn = open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
					
		int cnt_contact = 0; //count 개수
		String sql = "SELECT count(*) FROM contact";
					
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) //rs.next()값이 true(ResultSet에 값이 들어있다면)이면 rs에 있는값을 int타입으로 받아온다 = count(*)
				cnt_contact = rs.getInt(1);
		} catch (Exception ex) {
			System.out.println("getAllContactCnt() 오류: " + ex);
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
		return cnt_contact;
	}
	
	//1:1문의 개인 내역 갯수 가져오기
	public int getContactCnt(String id) {
		Connection conn = open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
						
		int cnt_contact = 0; //count 개수
		String sql = "SELECT count(*) FROM contact where cus_id=?";
						
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) //rs.next()값이 true(ResultSet에 값이 들어있다면)이면 rs에 있는값을 int타입으로 받아온다 = count(*)
				cnt_contact = rs.getInt(1);
		} catch (Exception ex) {
			System.out.println("getContactCnt() 오류: " + ex);
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
		return cnt_contact;
	}
	
	//1:1문의 목록 전체(관리자) 들고오기
	public List<contactDto> getAllContact() throws Exception{
		Connection conn = open();
		List<contactDto> contactList = new ArrayList<>();
						
		String sql = "select * from contact";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
						
		try {
			while(rs.next()) {
				contactDto dto = new contactDto();
				dto.setNum(rs.getInt("num"));
				dto.setCategory(rs.getString("category"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setReply(rs.getString("reply"));
				dto.setRegist_day(rs.getDate("regist_day"));
				dto.setReply_day(rs.getDate("reply_day"));
				dto.setCus_id(rs.getString("cus_id"));
				dto.setAdmin_id(rs.getString("admin_id"));
				contactList.add(dto);
			}return contactList;
		}catch (Exception ex) {
			System.out.println("getAllContact() 에러 :"+ex);
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
	
	//1:1문의 목록 (일반회원) 들고오기
	public List<contactDto> getContact(String id) throws Exception{
		Connection conn = open();
		List<contactDto> contactList = new ArrayList<>();
							
		String sql = "select * from contact where cus_id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
							
		try {
			while(rs.next()) {
				contactDto dto = new contactDto();
				dto.setNum(rs.getInt("num"));
				dto.setCategory(rs.getString("category"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setReply(rs.getString("reply"));
				dto.setRegist_day(rs.getDate("regist_day"));
				dto.setReply_day(rs.getDate("reply_day"));
				dto.setCus_id(rs.getString("cus_id"));
				dto.setAdmin_id(rs.getString("admin_id"));
				contactList.add(dto);
			}return contactList;
		}catch (Exception ex) {
			System.out.println("getContact() 에러 :"+ex);
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
	
	//1:1문의 답변 달기 메소드
	public void contactReply(contactDto dto) throws Exception {
		Connection conn = open();
				
		String sql = "update contact set admin_id=?, reply=?, reply_day=CURRENT_TIMESTAMP() where num=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		try{ 
			pstmt.setString(1, dto.getAdmin_id());
			pstmt.setString(2, dto.getReply());
			pstmt.setInt(3, dto.getNum());
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
	
	//1:1문의 삭제 메소드
	public void deleteContact(int num){
		Connection conn = open();
		PreparedStatement pstmt = null;
					
		String sql = "delete from contact where num=?";
					
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		}catch (Exception ex) {
			System.out.println("deleteContact() 오류 : " + ex);
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

	
}
