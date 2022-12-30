package com.example.JHcinema.dto;

import java.sql.Date;

public class noticeDto {
	
	private int num;
	private String title;
	private String content;
	private int hit;
	private Date regist_day;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public Date getRegist_day() {
		return regist_day;
	}
	public void setRegist_day(Date regist_day) {
		this.regist_day = regist_day;
	}
	
}
