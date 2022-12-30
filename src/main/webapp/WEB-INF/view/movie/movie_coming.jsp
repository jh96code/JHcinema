<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JH시네마 - 상영 예정작</title>
	
	<!-- font-awesome 아이콘 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	
	<!-- swiper css 불러오기 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
	
	<!-- css 파일 불러오기 -->
	<link rel="stylesheet" href="./resources/css/setup.css"/>
	<link rel="stylesheet" href="./resources/css/header.css"/>
	<link rel="stylesheet" href="./resources/css/footer.css"/>
	<link rel="stylesheet" href="./resources/css/movie_tap.css"/>
	<link rel="stylesheet" href="./resources/css/movie_banner_slide.css"/>
	
</head>
<%
  String today = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
%>
<body>
	<jsp:include page="../header.jsp"/>

	<jsp:include page="./movie_banner.jsp"/>

    <section id="section02">
        <div class="container">
            <div class="head">
                <div class="flex">
                    <div class="title">
                        <div>현재 상영작</div>
                        <div class="view">상영 예정작</div>
                    </div>
                    <%
	                    String admincheck = (String) session.getAttribute("admincheck");
	                    if(admincheck == "true"){ 
	                %>
						<a href="addMovie_showing" class="addBtn addBtn01">영화등록</a>
						<a href="addMovie_coming" class="addBtn addBtn02 view">영화등록</a>
					<%
						}
					%>
                </div>
            </div>
            <div id="showing" class="section">
                <ul class="list">
                	<c:forEach var="showingList" items="${showingList}" varStatus="status" end="9">
                        <li>
                            <div class="img" style="background-image: url(./resources/img/movie/${showingList.img});">
                                <div class="bg"></div>
                                <div class="view">
                                    <a href="ticketing_cinema?screenDate=<%=today%>&movie=${showingList.title}" class="view-1">예매하기</a> <br>
                                    <a href="movieView_showing?num=${showingList.num}" class="view-2">상세정보</a>
                                </div>
                                <div class="rank">${showingList.num}</div>
                            </div>
                            <div class="bottom">
                                <p class="name">${showingList.title}</p>
                                <p class="heart">♥ <span>${showingList.heart}</span></p>
                            </div>
                        </li>
            		</c:forEach>
            		<c:forEach var="showingList" items="${showingList}" varStatus="status" begin="10">
                        <li class="more-view">
                            <div class="img" style="background-image: url(./resources/img/movie/${showingList.img});">
                                <div class="bg"></div>
                                <div class="view">
                                    <a href="#" class="view-1">예매하기</a> <br>
                                    <a href="movieView_showing?num=${showingList.num}" class="view-2">상세정보</a>
                                </div>
                                <div class="rank">${showingList.num}</div>
                            </div>
                            <div class="bottom">
                                <p class="name">${showingList.title}</p>
                                <p class="heart">♥ <span>${showingList.heart}</span></p>
                            </div>
                        </li>
            		</c:forEach>
                </ul>
                <div class="more-btn">펼쳐보기 ∨</div>
            </div>
            <div id="coming" class="section tap-view">
                <ul class="list">
                    <c:forEach var="comingList" items="${comingList}" varStatus="status" end="9">
	                    <li>
	                        <div class="img" style="background-image: url(./resources/img/movie/${comingList.img});">
	                            <div class="bg"></div>
	                            <div class="view">
	                                <a href="movieView_coming?num=${comingList.num}" class="view-2">상세정보</a>
	                            </div>
	                            <div class="rank">${comingList.num}</div>
	                        </div>
	                        <div class="bottom">
	                            <p class="name">${comingList.title}</p>
	                            <p class="d-day">${comingList.openDate}</p>
	                        </div>
	                    </li>
	               	</c:forEach>
	               	<c:forEach var="comingList" items="${comingList}" varStatus="status" begin="10">
	                    <li class="more-view">
	                        <div class="img" style="background-image: url(./resources/img/movie/${comingList.img});">
	                            <div class="bg"></div>
	                            <div class="view">
	                                <a href="movieView_coming?num=${comingList.num}" class="view-2">상세정보</a>
	                            </div>
	                            <div class="rank">${comingList.num}</div>
	                        </div>
	                        <div class="bottom">
	                            <p class="name">${comingList.title}</p>
	                            <p class="d-day">${comingList.openDate}</p>
	                        </div>
	                    </li>
	               	</c:forEach>
                </ul>
                <div class="more-btn">펼쳐보기 ∨</div>
            </div>
        </div>
    </section>

	<jsp:include page="../footer.jsp"/>
	
	<!-- js 파일 불러오기 -->
    <script src="./resources/js/movie_slide.js"></script>
    <script src="./resources/js/movie_tap.js"></script>
</body>
</html>