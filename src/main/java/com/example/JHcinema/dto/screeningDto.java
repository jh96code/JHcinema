package com.example.JHcinema.dto;

import java.sql.Date;

public class screeningDto {
	
	private Date screenDate;
	private String movie;
	private String cinema;
	private String movieImg;
	private String screenTime;
	
	public Date getScreenDate() {
		return screenDate;
	}
	public void setScreenDate(Date screenDate) {
		this.screenDate = screenDate;
	}
	public String getMovie() {
		return movie;
	}
	public void setMovie(String movie) {
		this.movie = movie;
	}
	public String getCinema() {
		return cinema;
	}
	public void setCinema(String cinema) {
		this.cinema = cinema;
	}
	public String getMovieImg() {
		return movieImg;
	}
	public void setMovieImg(String movieImg) {
		this.movieImg = movieImg;
	}
	public String getScreenTime() {
		return screenTime;
	}
	public void setScreenTime(String screenTime) {
		this.screenTime = screenTime;
	}
	
}
