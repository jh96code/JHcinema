<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JH시네마 - 아이디찾기</title>
	
	<!-- css 파일 불러오기 -->
	<link rel="stylesheet" href="./resources/css/setup.css"/>
	<link rel="stylesheet" href="./resources/css/loginFind.css"/>
	
</head>
<body>
	<div class="container">
		<br>
		<h1>아이디 찾기 <span>(결과)</span></h1>
		<hr><br>
		<c:choose>
			<c:when test="${empty member}">
				<br>
				<b>가입된 아이디가 없습니다.</b>
				<br><br><br>
				<a href="javascript:history.back()" class="button">다시 검색</a>
			</c:when>
			<c:otherwise>
				<p><b>${admincheck}</b></p> <br>
				<div class="form-group">
					<label>아이디</label>
					<input readonly value="${member.id}">
				</div>
				<div class="form-group">
					<label>가입날짜</label>
					<input readonly value="${member.regist_day}">
				</div>
				<br>
				<a href="pwFind" class="button">비밀번호찾기</a>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>