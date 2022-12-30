<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JH시네마 - 예매하기</title>
	
	<!-- font-awesome 아이콘 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	
	<!-- css 파일 불러오기 -->
	<link rel="stylesheet" href="./resources/css/setup.css"/>
	<link rel="stylesheet" href="./resources/css/header.css"/>
	<link rel="stylesheet" href="./resources/css/footer.css"/>
	<link rel="stylesheet" href="./resources/css/ticketing.css"/>
	
</head>
<body>
	<jsp:include page="../header.jsp"/>
	
	<section id="ticketing">
		<h1>예매하기</h1>
        <div class="container">
            <div class="dateContainer">
                <form action="ticketing_movie" method="post" name="ticketingDateForm">
                    <label for="date"> <span>예매하실 날짜를 선택해주세요.</span>  
                        <input type="date" name="screenDate" id="date" value="${date}" required>
                        <input type="submit" value="검색">
                    </label>
                </form>
            </div>
            <div class="movieContainer">
                <h1>영화</h1>
                <form action="ticketing_cinema" method="post" name="ticketingMovieForm">
                	<input type="date" name="screenDate" value="${date}" hidden>
                    <ul class="list on">
                        <c:forEach var="screeningMovie" items="${screeningMovie}" varStatus="status">
                        	<li>
		                        <label for="${screeningMovie.movie}">${screeningMovie.movie}
		                        	<input type="submit" name="movie" id="${screeningMovie.movie}" value="${screeningMovie.movie}">
		                        </label>
	                        </li>
                        </c:forEach>
                    </ul>
                    <div class="movie_info">
                        <div class="img" style="background-image: url(./resources/img/movie/${movie_info.img});"></div>
                        <div class="text">
                        	<p class="title">${movie_info.title}</p>
                        	<p class="sub"><span>개요</span> ${movie_info.category} / ${movie_info.country} / ${movie_info.movieTime}분</p>
                        	<p class="sub"><span>감독</span> ${movie_info.director}</p>
                        	<p class="sub"><span>출연</span> ${movie_info.actor}</p>
                        </div>
                    </div>
                </form>
            </div>
            <div class="cinemaContainer">
                <h1>극장</h1>
                <form action="ticketing_time" method="post" name="ticketingCinemaForm">
                	<input type="date" name="screenDate" value="${date}" hidden>
                	<input type="text" name="movie" value="${movie}" hidden>
                	<input type="text" name="movieImg" value="${movieImg}" hidden>
                    <ul class="list">
                        <c:forEach var="screeningCinema" items="${screeningCinema}" varStatus="status">
                        	<li>
		                        <label for="${screeningCinema.cinema}">${screeningCinema.cinema}
		                        	<input type="submit" name="cinema" id="${screeningCinema.cinema}" value="${screeningCinema.cinema}">
		                        </label>
	                        </li>
                        </c:forEach>
                    </ul>
                </form>
            </div>
            <div class="seatContainer">
            	<ul class="showcase">
                    <li>
                        <div></div>
                        <small class="small">예매가능 좌석</small>
                    </li>
                    <li>
                        <div></div>
                        <small class="small">선택한 좌석</small>
                    </li>
                    <li>
                        <div></div>
                        <small class="small">예매된 좌석</small>
                    </li>

                </ul>
                <div class="seatSelector">
                	<form action="ticketing_seat" method="post" name="ticketingTimeForm">
	                	<input type="date" name="screenDate" value="${date}" hidden>
	                	<input type="text" name="movie" value="${movie}" hidden>
	                	<input type="text" name="cinema" value="${cinema}" hidden>
	                	<input type="text" name="movieImg" value="${movieImg}" hidden>
		                <ul class="list border-bottom">
		               		<c:forEach var="screeningTime" items="${screeningTime}" varStatus="status">
		                  		<li>
				   					<label for="${screeningTime.screenTime}" class="time">${screeningTime.screenTime}
				                   		<input type="submit" name="screenTime" id="${screeningTime.screenTime}" value="${screeningTime.screenTime}">
				                    </label>
			                    </li>
		                   	</c:forEach>
		           		</ul>
	           		</form>
	                <form action="ticketing_pay?id=${login_id}" method="post" name="ticketingSeatForm">
	                	<input type="date" name="screenDate" value="${date}" hidden>
	                	<input type="text" name="movie" value="${movie}" hidden>
	                	<input type="text" name="cinema" value="${cinema}" hidden>
	                	<input type="text" name="movieImg" value="${movieImg}" hidden>
	                	<input type="text" name="screenTime" value="${screenTime}" hidden>
		           		<div class="screen">SCREEN</div>
		           			<div class="row">
	                            <label for="A1" class="seat">A1
	                                <input type="checkbox" name="seat" value="A1" id="A1" onclick="seat_check()">
	                            </label>
	                            <label for="A2" class="seat">A2
	                                <input type="checkbox" name="seat" value="A2" id="A2" onclick="seat_check()">
	                            </label>
	                            <label for="A3" class="seat">A3
	                                <input type="checkbox" name="seat" value="A3" id="A3" onclick="seat_check()">
	                            </label>
	                            <label for="A4" class="seat">A4
	                                <input type="checkbox" name="seat" value="A4" id="A4" onclick="seat_check()">
	                            </label>
	                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                            <label for="A5" class="seat">A5
	                                <input type="checkbox" name="seat" value="A5" id="A5" onclick="seat_check()">
	                            </label>
	                            <label for="A6" class="seat">A6
	                                <input type="checkbox" name="seat" value="A6" id="A6" onclick="seat_check()">
	                            </label>
	                            <label for="A7" class="seat">A7
	                                <input type="checkbox" name="seat" value="A7" id="A7" onclick="seat_check()">
	                            </label>
	                            <label for="A8" class="seat">A8
	                                <input type="checkbox" name="seat" value="A8" id="A8" onclick="seat_check()">
	                            </label>
	                        </div>
	                        <div class="row">
	                            <label for="B1" class="seat">B1
	                                <input type="checkbox" name="seat" value="B1" id="B1" onclick="seat_check()">
	                            </label>
	                            <label for="B2" class="seat">B2
	                                <input type="checkbox" name="seat" value="B2" id="B2" onclick="seat_check()">
	                            </label>
	                            <label for="B3" class="seat">B3
	                                <input type="checkbox" name="seat" value="B3" id="B3" onclick="seat_check()">
	                            </label>
	                            <label for="B4" class="seat">B4
	                                <input type="checkbox" name="seat" value="B4" id="B4" onclick="seat_check()">
	                            </label>
	                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                            <label for="B5" class="seat">B5
	                                <input type="checkbox" name="seat" value="B5" id="B5" onclick="seat_check()">
	                            </label>
	                            <label for="B6" class="seat">B6
	                                <input type="checkbox" name="seat" value="B6" id="B6" onclick="seat_check()">
	                            </label>
	                            <label for="B7" class="seat">B7
	                                <input type="checkbox" name="seat" value="B7" id="B7" onclick="seat_check()">
	                            </label>
	                            <label for="B8" class="seat">B8
	                                <input type="checkbox" name="seat" value="B8" id="B8" onclick="seat_check()">
	                            </label>
	                        </div>
	                        <div class="row">
	                            <label for="C1" class="seat">C1
	                                <input type="checkbox" name="seat" value="C1" id="C1" onclick="seat_check()">
	                            </label>
	                            <label for="C2" class="seat">C2
	                                <input type="checkbox" name="seat" value="C2" id="C2" onclick="seat_check()">
	                            </label>
	                            <label for="C3" class="seat">C3
	                                <input type="checkbox" name="seat" value="C3" id="C3" onclick="seat_check()">
	                            </label>
	                            <label for="C4" class="seat">C4
	                                <input type="checkbox" name="seat" value="C4" id="C4" onclick="seat_check()">
	                            </label>
	                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                            <label for="C5" class="seat">C5
	                                <input type="checkbox" name="seat" value="C5" id="C5" onclick="seat_check()">
	                            </label>
	                            <label for="C6" class="seat">C6
	                                <input type="checkbox" name="seat" value="C6" id="C6" onclick="seat_check()">
	                            </label>
	                            <label for="C7" class="seat">C7
	                                <input type="checkbox" name="seat" value="C7" id="C7" onclick="seat_check()">
	                            </label>
	                            <label for="C8" class="seat">C8
	                                <input type="checkbox" name="seat" value="C8" id="C8" onclick="seat_check()">
	                            </label>
	                        </div>
	                        <div class="row">
	                            <label for="D1" class="seat">D1
	                                <input type="checkbox" name="seat" value="D1" id="D1" onclick="seat_check()">
	                            </label>
	                            <label for="D2" class="seat">D2
	                                <input type="checkbox" name="seat" value="D2" id="D2" onclick="seat_check()">
	                            </label>
	                            <label for="D3" class="seat">D3
	                                <input type="checkbox" name="seat" value="D3" id="D3" onclick="seat_check()">
	                            </label>
	                            <label for="D4" class="seat">D4
	                                <input type="checkbox" name="seat" value="D4" id="D4" onclick="seat_check()">
	                            </label>
	                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                            <label for="D5" class="seat">D5
	                                <input type="checkbox" name="seat" value="D5" id="D5" onclick="seat_check()">
	                            </label>
	                            <label for="D6" class="seat">D6
	                                <input type="checkbox" name="seat" value="D6" id="D6" onclick="seat_check()">
	                            </label>
	                            <label for="D7" class="seat">D7
	                                <input type="checkbox" name="seat" value="D7" id="D7" onclick="seat_check()">
	                            </label>
	                            <label for="D8" class="seat">D8
	                                <input type="checkbox" name="seat" value="D8" id="D8" onclick="seat_check()">
	                            </label>
	                        </div>
	                        <div class="row">
	                            <label for="E1" class="seat">E1
	                                <input type="checkbox" name="seat" value="E1" id="E1" onclick="seat_check()">
	                            </label>
	                            <label for="E2" class="seat">E2
	                                <input type="checkbox" name="seat" value="E2" id="E2" onclick="seat_check()">
	                            </label>
	                            <label for="E3" class="seat">E3
	                                <input type="checkbox" name="seat" value="E3" id="E3" onclick="seat_check()">
	                            </label>
	                            <label for="E4" class="seat">E4
	                                <input type="checkbox" name="seat" value="E4" id="E4" onclick="seat_check()">
	                            </label>
	                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                            <label for="E5" class="seat">E5
	                                <input type="checkbox" name="seat" value="E5" id="E5" onclick="seat_check()">
	                            </label>
	                            <label for="E6" class="seat">E6
	                                <input type="checkbox" name="seat" value="E6" id="E6" onclick="seat_check()">
	                            </label>
	                            <label for="E7" class="seat">E7
	                                <input type="checkbox" name="seat" value="E7" id="E7" onclick="seat_check()">
	                            </label>
	                            <label for="E8" class="seat">E8
	                                <input type="checkbox" name="seat" value="E8" id="E8" onclick="seat_check()">
	                            </label>
	                        </div>
	                	<div class="bottom">
	                		<div class="flex">
	                			<p class="order">
	                				10000원 x 
	                				<input type="text" class="people" name="people" readonly>명 
	                				= <input type="text" class="price" name="price" readonly><span>원</span>
	                			</p>
	                			<input type="button" value="예매하기" onclick="loginCheck()">
	                		</div>
	                	</div>
	           		</form>
	           	</div>
            </div>
		</div>
    </section>
    
    <jsp:include page="../footer.jsp"/>
    
    <!-- js 파일 불러오기 -->
    <script src="./resources/js/ticketing.js"></script>
    <script type="text/javascript">
	    $(document).ready(function(){ //클릭한 영화에 addClass하여 스타일 변화주기
	        let input_movie = document.ticketingMovieForm.movie;
	        let movie = "${movie}";
	        for(var i=0; i<input_movie.length; i++){
	        	if (input_movie[i].value == movie) { 
	        		$(input_movie[i]).parent().addClass("check");
		            return false; 
		        };
	        }
	    })
	    $(document).ready(function(){ //클릭한 극장에 addClass하여 스타일 변화주기
		    let input_cinema = document.ticketingCinemaForm.cinema;
		        let cinema = "${cinema}";
		        for(var i=0; i<input_cinema.length; i++){
		        	if (input_cinema[i].value == cinema) {
		        		$(input_cinema[i]).parent().addClass("check");
			            return false; 
			        };
		        }
	    })
	    $(document).ready(function(){ //클릭한 상영시간에 addClass하여 스타일 변화주기
		    let input_screenTime = document.ticketingTimeForm.screenTime;
		        let screenTime = "${screenTime}";
		        for(var i=0; i<input_screenTime.length; i++){
		        	if (input_screenTime[i].value == screenTime) {
		        		$(input_screenTime[i]).parent().addClass("check");
			            return false; 
			        };
		        }
	    })
	    function loginCheck() {	
			if (${login_id==null}) {
				alert("로그인을 해주세요.");
				location.href = "login"
				return false;
			} else{
				document.ticketingSeatForm.submit();
			}
	    }
	    
	    $(document).ready(function(){
		    <c:forEach var="usedSeat" items="${usedSeat}" varStatus="status">
		    	$("#${usedSeat.seat}").parent().addClass("used");
		    	$("#${usedSeat.seat}").attr("disabled", true);
		    </c:forEach>
	    })
	    
    </script>
    
</body>
</html>