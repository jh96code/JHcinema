<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JH시네마 - 영화 상세정보</title>
	
	<!-- font-awesome 아이콘 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	
	<!-- swiper css 불러오기 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
	
	<!-- css 파일 불러오기 -->
	<link rel="stylesheet" href="./resources/css/setup.css"/>
	<link rel="stylesheet" href="./resources/css/header.css"/>
	<link rel="stylesheet" href="./resources/css/footer.css"/>
	<link rel="stylesheet" href="./resources/css/movieView.css"/>
	<link rel="stylesheet" href="./resources/css/movie_banner_slide.css"/>
	
</head>
<%
  String today = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
%>
<body>
	<jsp:include page="../header.jsp"/>
	
	<jsp:include page="./movie_banner.jsp"/>
	
	<section id="movieView">
		<div class="container">
			<div class="head">
				<div class="left">
					<div class="img" style="background-image: url(./resources/img/movie/${movie.img});"></div>
				</div>
				<div class="right">
					<div class="flex">
						<h1>${movie.title}</h1>
						<h3>${status}</h3>
					</div>
					<c:if test="${status eq '현재상영작'}">
						<h2>예매율 ${movie.num}위</h2>
					</c:if>
					<c:if test="${status eq '상영예정작'}">
						<h2>기대작 ${movie.num}위</h2>
					</c:if>
					<hr>
					<p><b>장르 </b>${movie.category} / ${movie.country}<span>ㅣ</span>${movie.openDate} <span>ㅣ</span>${movie.movieTime}분</p>
					<p><b>감독 </b>${movie.director}</p>
					<p><b>출연 </b>${movie.actor}</p>
					<c:if test="${status eq '현재상영작'}">
						<div class="btn-group">
							<a href="addHeart?num=${movie.num}" class="heart">♥ <span>${movie.heart}</span></a>
							<a href="ticketing_cinema?screenDate=<%=today%>&movie=${movie.title}">예매하기</a>
						</div>
					</c:if>
				</div>				
			</div>
			<div class="content">
				<h1>줄거리</h1>
				<hr>
				<p>${movie.content}</p>
			</div>
		</div>
	</section>
	
	<c:if test="${status eq '현재상영작'}">
		<section id="reply">
			<div class="container">
				<h1>댓글 목록</h1>
			    <div class="reply_box">
				    <table>
			            <tbody>
			                <tr>
			                    <th style="width: 15%;">아이디</th>
			                    <th style="width: 70%;">내용</th>
			                    <th style="width: 10%;">등록일</th>
			                    <th style="width: 5%;">삭제</th>
			                </tr>
			                <c:forEach var="reply" items="${reply}" varStatus="status">
								<tr>
									<td>${reply.cus_id}</td>
									<td>${reply.content}</td>
									<td>${reply.regist_day}</td>
									<td>
										<c:if test="${reply.cus_id eq login_id}">
											<b><a href="deleteMovieReply?movie_num=${movie.num}&reply_num=${reply.num}">X</a></b>
										</c:if>
									</td>
								</tr>
							</c:forEach>
			            </tbody>
			        </table>
		        </div> <br>
			    <form action="addMovieReply?movie_num=${movie.num}&cus_id=${login_id}" method="post" name="addReplyForm">
			     	<input type="text" name="content" placeholder="댓글 내용을 입력하세요." required>
			     	<input type="button" value="작성하기" onclick="replyWrite()">
			    </form>
			</div>
		</section>
	</c:if>
	
	<jsp:include page="../footer.jsp"/>
	
	<script type="text/javascript">
	   function replyWrite() {   
		  if (${login_id == null}) {
		     alert("로그인 해주세요.");
		     location.href = "login"
		     return false;
		  } else{
			  if(!document.addReplyForm.content.value){
				  alert("댓글 내용을 입력해주세요.");
			  } else{
				  document.addReplyForm.submit();
			  }
		  }
	   }
	</script>
</body>
</html>
