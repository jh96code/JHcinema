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
                    <ul class="list">
                    	<c:forEach var="screeningMovie" items="${screeningMovie}" varStatus="status">
	                        <li>
	                            <label for="${screeningMovie.movie}">${screeningMovie.movie}
	                                <input type="submit" name="movie" id="${screeningMovie.movie}" value="${screeningMovie.movie}">
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
    
</body>
</html>