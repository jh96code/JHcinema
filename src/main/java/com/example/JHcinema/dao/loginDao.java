package com.example.JHcinema.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.example.JHcinema.dto.adminDto;
import com.example.JHcinema.dto.customerDto;
import com.example.JHcinema.dto.movieShowingDto;
import com.example.JHcinema.dto.pointDetailDto;
import com.example.JHcinema.dto.ticketPayDto;

public class loginDao {
	
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
	
	//로그인된 일반회원 정보 들고오기
	public customerDto getCustomer(String id) throws SQLException {
		Connection conn = open();

		customerDto customer = new customerDto();
		String sql = "select * from customer where id=?";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		
		//rs.next();
		try {
			if(rs.next() == true) {
				customer.setId(rs.getString("id"));
				customer.setPassword(rs.getString("password"));
				customer.setName(rs.getString("name"));
				customer.setGender(rs.getString("gender"));
				customer.setBirth(rs.getString("birth"));
				customer.setMail(rs.getString("mail"));
				customer.setPhone(rs.getString("phone"));
				customer.setPostcode(rs.getString("addr").substring(1, 6));
				customer.setAddress(rs.getString("addr").substring(8, rs.getString("addr").indexOf(",")));
				customer.setDetailAddress(rs.getString("addr").substring(rs.getString("addr").indexOf(",") + 2));
				customer.setGrade(rs.getString("grade"));
				customer.setPoint(rs.getInt("point"));
				customer.setRegist_day(rs.getDate("regist_day"));
				pstmt.executeQuery();
				return customer;
			}
		} catch (Exception e) {
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
	
	//로그인된 관리자 정보 들고오기
	public adminDto getAdmin(String id) throws SQLException {
		Connection conn = open();

		adminDto admin = new adminDto();
		String sql = "select * from admin where id=?";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();

		//rs.next();
		try {
			if(rs.next() == true) {
				admin.setId(rs.getString("id"));
				admin.setPassword(rs.getString("password"));
				admin.setName(rs.getString("name"));
				admin.setGender(rs.getString("gender"));
				admin.setBirth(rs.getString("birth"));
				admin.setMail(rs.getString("mail"));
				admin.setPhone(rs.getString("phone"));
				admin.setPostcode(rs.getString("addr").substring(1, 6));
				admin.setAddress(rs.getString("addr").substring(8, rs.getString("addr").indexOf(",")));
				admin.setDetailAddress(rs.getString("addr").substring(rs.getString("addr").indexOf(",") + 2));
				admin.setGrade(rs.getString("grade"));
				admin.setPoint(rs.getInt("point"));
				admin.setRegist_day(rs.getDate("regist_day"));
				pstmt.executeQuery();
				return admin;
			}
		} catch (Exception e) {
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
	
	//일반회원 정보 수정 메소드
	public void updateCustomer(customerDto customer) {
		Connection conn = open();
		PreparedStatement pstmt = null;

		customer.setAddr("(" + customer.getPostcode() + ") " + customer.getAddress() + ", " + customer.getDetailAddress());
		try {
			String sql = "update customer set password=?, name=?, phone=?, addr=?, mail=? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, customer.getPassword());
			pstmt.setString(2, customer.getName());
			pstmt.setString(3, customer.getPhone());
			pstmt.setString(4, customer.getAddr());
			pstmt.setString(5, customer.getMail());
			pstmt.setString(6, customer.getId());
			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("updateMember() 오류 : " + ex);
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
	
	//관리자 정보 수정 메소드
	public void updateAdmin(adminDto admin) {
		Connection conn = open();
		PreparedStatement pstmt = null;

		admin.setAddr("(" + admin.getPostcode() + ") " + admin.getAddress() + ", " + admin.getDetailAddress());
		try {
			String sql = "update admin set password=?, name=?, phone=?, addr=?, mail=? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, admin.getPassword());
			pstmt.setString(2, admin.getName());
			pstmt.setString(3, admin.getPhone());
			pstmt.setString(4, admin.getAddr());
			pstmt.setString(5, admin.getMail());
			pstmt.setString(6, admin.getId());
			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("updateMember() 오류 : " + ex);
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
	
	//일반회원 회원가입 메서드
	public void addMember_customer(customerDto customer) {
		Connection conn = open();
		customer.setBirth(customer.getYear() + "/" + customer.getMonth() + "/" + customer.getDay());
		customer.setAddr("(" + customer.getPostcode() + ") " + customer.getAddress() + ", " + customer.getDetailAddress());
		customer.setMail(customer.getMail1() + "@" + customer.getMail2());
		PreparedStatement pstmt = null;
		try {
			String sql = "insert into customer values(?, ?, ?, ?, ?, ?, ?, ?, ?, current_date(), '브론즈', 500)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, customer.getId());
			pstmt.setString(2, customer.getPassword());
			pstmt.setString(3, customer.getName());
			pstmt.setString(4, customer.getGender());
			pstmt.setString(5, customer.getBirth());
			pstmt.setString(6, customer.getPhone());
			pstmt.setString(7, customer.getAddr());
			pstmt.setString(8, customer.getMail());
			pstmt.setString(9, customer.getRecom_id());
			pstmt.executeUpdate();
			
			sql = "insert into pointDetail(id, point, memo, regist_day) values(?, 500, '회원가입 포인트 적립', current_timestamp());";
			pstmt = conn.prepareStatement(sql);		
			pstmt.setString(1, customer.getId());
			pstmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("addMember_customer() 에러 : " + e);
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
	
	//관리자 회원가입 메서드
	public void addMember_admin(adminDto admin) {
		Connection conn = open();
		admin.setBirth(admin.getYear() + "/" + admin.getMonth() + "/" + admin.getDay());
		admin.setAddr("(" + admin.getPostcode() + ") " + admin.getAddress() + ", " + admin.getDetailAddress());
		admin.setMail(admin.getMail1() + "@" + admin.getMail2());
		PreparedStatement pstmt = null;
		try {
			String sql = "insert into admin values(?, ?, ?, ?, ?, ?, ?, ?, ?, current_date(), '실버', 500)";
				
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, admin.getId());
			pstmt.setString(2, admin.getPassword());
			pstmt.setString(3, admin.getName());
			pstmt.setString(4, admin.getGender());
			pstmt.setString(5, admin.getBirth());
			pstmt.setString(6, admin.getPhone());
			pstmt.setString(7, admin.getAddr());
			pstmt.setString(8, admin.getMail());
			pstmt.setString(9, admin.getRecom_id());
			pstmt.executeUpdate();
			
			sql = "insert into pointDetail(id, point, memo, regist_day) values(?, 500, '회원가입 포인트 적립', current_timestamp());";
			pstmt = conn.prepareStatement(sql);		
			pstmt.setString(1, admin.getId());
			pstmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("addMember_admin() 에러 : " + e);
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
	
	//일반회원 아이디 중복확인 메서드
	public String idCheck_customer(String id) throws SQLException {
		Connection conn = open();
		String memberid;
		String sql = "select id from customer where id=?";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();

		//rs.next();
		try {
			if(rs.next() == true) {
				memberid = rs.getString("id");
				return memberid;
			}
		} catch (Exception e) {
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
	
	//관리자 아이디 중복확인 메서드
	public String idCheck_admin(String id) throws SQLException {
		Connection conn = open();
		String memberid;
		String sql = "select id from admin where id=?";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();

		//rs.next();
		try {
			if(rs.next() == true) {
				memberid = rs.getString("id");
				return memberid;
			}
		} catch (Exception e) {
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
	
	//일반회원 로그인(회원여부) 메소드
	public customerDto loginCheck_customer(String login_id, String login_pw) {
		Connection conn = open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		customerDto customer = new customerDto();

		try {
			String sql = "SELECT * FROM customer WHERE ID=? and password=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, login_id);
			pstmt.setString(2, login_pw);
			rs = pstmt.executeQuery();			
			if (rs.next()) {
				customer.setId(rs.getString("id"));
				customer.setPassword(rs.getString("password"));
				return customer;
			}		
		} catch (Exception ex) {
			System.out.println("로그인 체크 에러 :" + ex);
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
		return customer = null;
	}

	//관리자 로그인(회원여부) 메소드
	public adminDto loginCheck_admin(String login_id, String login_pw) {
		Connection conn = open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		adminDto admin = new adminDto();

		try {
			String sql = "SELECT * FROM admin WHERE ID=? and password=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, login_id);
			pstmt.setString(2, login_pw);
			rs = pstmt.executeQuery();			
			if (rs.next()) {
				admin.setId(rs.getString("id"));
				admin.setPassword(rs.getString("password"));
				return admin;
			}		
		} catch (Exception ex) {
			System.out.println("로그인 체크 에러 :" + ex);
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
		return admin = null;
	}
	
	//일반회원 아이디찾기 메서드
	public customerDto idFind_customer(String name, String phone) throws SQLException {
		Connection conn = open();
		customerDto customer = new customerDto();
		String sql = "select id, regist_day from customer where name=? and phone=?";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, phone);
		ResultSet rs = pstmt.executeQuery();
		
		try {
			if(rs.next()) {
				customer.setId(rs.getString("id"));
				customer.setRegist_day(rs.getDate("regist_day"));
				pstmt.executeQuery();
				return customer;
			}
		} catch (Exception e) {
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
	
	//관리자 아이디찾기 메서드
	public adminDto idFind_admin(String name, String phone) throws SQLException {
		Connection conn = open();
		adminDto admin = new adminDto();
		String sql = "select id, regist_day from admin where name=? and phone=?";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, phone);
		ResultSet rs = pstmt.executeQuery();
			
		try {
			if(rs.next()) {
				admin.setId(rs.getString("id"));
				admin.setRegist_day(rs.getDate("regist_day"));
				pstmt.executeQuery();
				return admin;
			}
		} catch (Exception e) {
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
	
	//일반회원 비밀번호찾기 메서드
	public customerDto pwFind_customer(String id, String name) throws SQLException {
		Connection conn = open();
		customerDto customer = new customerDto();
		String sql = "select id, password from customer where id=? and name=?";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, name);
		ResultSet rs = pstmt.executeQuery();
			
		try {
			if(rs.next()) {
				customer.setId(rs.getString("id"));
				customer.setPassword(rs.getString("password"));
				pstmt.executeQuery();
				return customer;
			}
		} catch (Exception e) {
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
	
	//관리자 비밀번호찾기 메서드
	public adminDto pwFind_admin(String id, String name) throws SQLException {
		Connection conn = open();
		adminDto admin = new adminDto();
		String sql = "select id, password from admin where id=? and name=?";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, name);
		ResultSet rs = pstmt.executeQuery();
				
		try {
			if(rs.next()) {
				admin.setId(rs.getString("id"));
				admin.setPassword(rs.getString("password"));
				pstmt.executeQuery();
				return admin;
			}
		} catch (Exception e) {
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
	
	//일반회원 회원탈퇴 메소드
	public void deleteCustomer(String id) {
		Connection conn = open();
		PreparedStatement pstmt = null;

		String sql = "delete from customer where id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("deleteCustomer() 오류 : " + ex);
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
	
	//관리자 회원탈퇴 메소드
	public void deleteAdmin(String id) {
		Connection conn = open();
		PreparedStatement pstmt = null;

		String sql = "delete from admin where id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("deleteAdmin() 오류 : " + ex);
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
	
	//마이페이지 영화예매내역 불러오기
	public List<ticketPayDto> getTicketPay(String id) throws SQLException {
		Connection conn = open();
		List<ticketPayDto> ticketPayList = new ArrayList<>();
		String sql = "select * from ticketPay where id=?";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
					
		try {
			while(rs.next()){
				ticketPayDto dto = new ticketPayDto();
				dto.setId(rs.getString("id"));
				dto.setMovie(rs.getString("movie"));
				dto.setCinema(rs.getString("cinema"));
				dto.setScreenDate(rs.getDate("screenDate"));
				dto.setScreenTime(rs.getString("screenTime"));
				dto.setSeat(rs.getString("seat"));
				dto.setPeople(rs.getInt("people"));
				dto.setPrice(rs.getInt("price"));
				dto.setMovieImg(rs.getString("movieImg"));
				ticketPayList.add(dto);
			}
			return ticketPayList;
		} catch (Exception e) {
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
	
	//마이페이지 포인트 내역 불러오기
	public List<pointDetailDto> getPointDetail(String id) throws SQLException {
		Connection conn = open();
		List<pointDetailDto> pointDetailList = new ArrayList<>();
		String sql = "select * from pointDetail where id=? order by regist_day desc, memo desc";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
						
		try {
			while(rs.next()){
				pointDetailDto dto = new pointDetailDto();
				dto.setId(rs.getString("id"));
				dto.setPoint(rs.getInt("point"));
				dto.setMinusPoint(rs.getInt("minusPoint"));
				dto.setAddPoint(rs.getInt("addPoint"));
				dto.setMemo(rs.getString("memo"));
				dto.setRegist_day(rs.getString("regist_day"));
				pointDetailList.add(dto);
			}
			return pointDetailList;
		} catch (Exception e) {
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
	
	//마이페이지 포인트 내역 갯수 불러오기 
	public int getPointDetailCnt(String id) throws SQLException {
		Connection conn = open();
		String sql = "select * from pointDetail where id=? order by regist_day desc";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
							
		try {
			int cnt = 0;
			while(rs.next()){
				cnt = cnt + 1;
			}
			return cnt;
		} catch (Exception e) {
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
		return (Integer) null;
	}
	
}
