package com.example.JHcinema.dto;

import java.sql.Date;

public class customerDto {
	
	private String id; //아이디
	private String password; //비밀번호
	private String name; //이름
	private String gender; //성별
	private String year; //생년
	private String month; //월
	private String day; //일
	private String birth; //완전한 생년월일
	private String phone; //전화번호
	private String postcode; //우편번호
	private String address; //주소
	private String detailAddress; //상세주소
	private String addr; //완전한 주소
	private String mail1; //앞이메일
	private String mail2; //뒷이메일
	private String mail; //완전한 주소
	private String recom_id; //추천인아이디
	private Date regist_day; //가입날짜
	private String grade; //등급
	private int point; //적립금
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	public String getMail1() {
		return mail1;
	}
	public void setMail1(String mail1) {
		this.mail1 = mail1;
	}
	public String getMail2() {
		return mail2;
	}
	public void setMail2(String mail2) {
		this.mail2 = mail2;
	}
	public String getRecom_id() {
		return recom_id;
	}
	public void setRecom_id(String recom_id) {
		this.recom_id = recom_id;
	}
	public Date getRegist_day() {
		return regist_day;
	}
	public void setRegist_day(Date regist_day) {
		this.regist_day = regist_day;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	
}
