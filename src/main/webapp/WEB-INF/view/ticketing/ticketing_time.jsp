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
                <h1>상영시간을 선택해주세요.</h1> 
                <form action="ticketing_seat" method="post" name="ticketingTimeForm">
                	<input type="date" name="screenDate" value="${date}" hidden>
                	<input type="text" name="movie" value="${movie}" hidden>
                	<input type="text" name="cinema" value="${cinema}" hidden>
                	<input type="text" name="movieImg" value="${movieImg}" hidden>
	                <ul class="list">
	               		<c:forEach var="screeningTime" items="${screeningTime}" varStatus="status">
	                  		<li>
			   					<label for="${screeningTime.screenTime}" class="time">${screeningTime.screenTime}
			                   		<input type="submit" name="screenTime" id="${screeningTime.screenTime}" value="${screeningTime.screenTime}">
			                    </label>
		                    </li>
	                   	</c:forEach>
	           		</ul>
           		</form>
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
    </script>
    
</body>
</html>