<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JH시네마 - 비밀번호찾기</title>
	
	<!-- css 파일 불러오기 -->
	<link rel="stylesheet" href="./resources/css/setup.css"/>
	<link rel="stylesheet" href="./resources/css/loginFind.css"/>
	
</head>
<body>
	<div class="container">
		<br>
		<h1>비밀번호 찾기</h1>
		<hr><br>
		<form action="processPwFind" method="post" name="pwFindForm">
			<div class="form-group">
				<label for="id">아이디</label>
				<input name="id" type="text" id="id" placeholder="아이디를 입력해주세요." >
			</div>
			<div class="form-group">
				<label for="name">이름</label>
				<input name="name" type="text" id="name" placeholder="이름을 입력해주세요." >
			</div>
			<br>
			<button type="button" onclick="validate_pwFind();">비밀번호 찾기</button>
		</form>
	</div>
	
	<!-- 자바스크립트 파일 불러오기 -->
    <script src="./resources/js/loginFind.js"></script>
    
</body>
</html>