package com.example.JHcinema.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.example.JHcinema.dao.*;

@Configuration
public class daoConfig {
	
	@Bean
	public loginDao loginDao() {
		return new loginDao();
	}
	
	@Bean
	public movieDao movieDao() {
		return new movieDao();
	}
	
	@Bean
	public csDao csDao() {
		return new csDao();
	}
	
	@Bean
	public ticketingDao ticketingDao() {
		return new ticketingDao();
	}
}
