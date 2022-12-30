package com.example.JHcinema.dto;

import java.sql.Date;

public class movieShowingReplyDto {
	
	private int num;
	private String content;
	private Date regist_day;
	private int movie_num;
	private String cus_id;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegist_day() {
		return regist_day;
	}
	public void setRegist_day(Date regist_day) {
		this.regist_day = regist_day;
	}
	public int getMovie_num() {
		return movie_num;
	}
	public void setMovie_num(int movie_num) {
		this.movie_num = movie_num;
	}
	public String getCus_id() {
		return cus_id;
	}
	public void setCus_id(String cus_id) {
		this.cus_id = cus_id;
	}
}
