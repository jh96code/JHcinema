package com.example.JHcinema.dto;

public class pointDetailDto {
	
	private String id;
	private int point;
	private int minusPoint;
	private int addPoint;
	private String memo;
	private String regist_day;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getMinusPoint() {
		return minusPoint;
	}
	public void setMinusPoint(int minusPoint) {
		this.minusPoint = minusPoint;
	}
	public int getAddPoint() {
		return addPoint;
	}
	public void setAddPoint(int addPoint) {
		this.addPoint = addPoint;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getRegist_day() {
		return regist_day;
	}
	public void setRegist_day(String regist_day) {
		this.regist_day = regist_day;
	}
	
}
