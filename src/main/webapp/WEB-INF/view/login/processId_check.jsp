<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JH시네마 - ID중복확인</title>
	
	<!-- css 파일 불러오기 -->
	<link rel="stylesheet" href="./resources/css/setup.css"/>
	<link rel="stylesheet" href="./resources/css/id_check.css"/>
	
</head>
<body>
	<div class="container">
		<br>
		<h1>ID 중복확인</h1>
		<hr><br>
		<p>${id}</p>
		<p><b>${msg}</b></p> <br>
		<a href="javascript:history.back()" class="button">다시 검색</a>
	</div>
</body>
</html>