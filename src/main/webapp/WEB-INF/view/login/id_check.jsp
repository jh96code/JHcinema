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
		<form action="processId_check" method="post" name="idCheckForm">
			<div class="form-group">
				<input name="id" type="text" placeholder="아이디를 입력해주세요.(4~20자리)" > <br><br>
			</div>
			<button type="button" class="button" onclick="validate();">검색</button>
		</form>
	</div>
	
	<!-- 자바스크립트 파일 불러오기 -->
    <script src="./resources/js/idCheck.js"></script>
</body>
</html>