<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JH시네마 - 홈</title>
	
	<!-- font-awesome 아이콘 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	
	<!-- swiper css 불러오기 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
	
	<!-- css 파일 불러오기 -->
	<link rel="stylesheet" href="./resources/css/setup.css"/>
	<link rel="stylesheet" href="./resources/css/header.css"/>
	<link rel="stylesheet" href="./resources/css/footer.css"/>
	<link rel="stylesheet" href="./resources/css/index.css"/>
	
</head>
<%
  String today = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
%>
<body>
	<jsp:include page="./header.jsp"/>
	<section id="section01">
        <div class="container">
            <div class="swiper movie-slider">
                <ul class="swiper-wrapper">
                	<c:forEach var="showingList" items="${showingList}" varStatus="status" end="9">
	                    <li class="swiper-slide">
	                        <div class="img" style="background-image: url(./resources/img/movie/${showingList.img});">
	                            <div class="bg"></div>
	                            <div class="view">
	                                <a href="ticketing_cinema?screenDate=<%=today%>&movie=${showingList.title}" class="view-1">예매하기</a> <br>
	                                <a href="movieView_showing?num=${showingList.num}" class="view-2">상세정보</a>
	                            </div>
	                            <div class="rank">${showingList.num}</div>
	                        </div>
	                        <div class="bottom">
	                            <a href="addHeart_index?num=${showingList.num}" class="heart">♥ <span>${showingList.heart}</span></a>
	                            <a href="ticketing_cinema?screenDate=<%=today%>&movie=${showingList.title}" class="ticketing">예매하기</a> 
	                        </div>
	                    </li>
					</c:forEach>
                </ul>
            </div>
        </div>
    </section>

    <section id="section02">
        <div class="container">
            <div class="head flex">
                <h1>EVENT</h1>
                <a href="event_ing" class="more">전체보기 <span>></span></a>
            </div> <hr>
            <ul class="list">
                <li>
                    <a href="#">
                        <div class="img" style="background-image: url(./resources/img/event/event01.jpg);"></div>
                        <div class="text">
                            <div class="name">[블랙 아담]필름마크</div>
                            <div class="sub">2022.11.15 ~ 2022.11.30</div>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img" style="background-image: url(./resources/img/event/event02.jpg);"></div>
                        <div class="text">
                            <div class="name">[에릭 로메르 특별전]아트포스터 증정 이벤트</div>
                            <div class="sub">2022.11.16 ~ 2022.11.30</div>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img" style="background-image: url(./resources/img/event/event03.jpg);"></div>
                        <div class="text">
                            <div class="name">[이달의 아이스크림]11월 라인업 미리 만나보기</div>
                            <div class="sub">2022.11.17 ~ 2022.11.30</div>
                        </div>
                    </a>
                </li>
            </ul>
        </div>
    </section>
    
    <jsp:include page="./footer.jsp"/>
    
    <!-- 자바스크립트 파일 불러오기 -->
    <script src="./resources/js/index.js"></script>
</body>
</html>