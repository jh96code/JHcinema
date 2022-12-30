<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<h1>아이디 찾기</h1>
		<hr><br>
		<form action="processIdFind" method="post" name="idFindForm">
			<div class="form-group">
				<label for="name">이름</label>
				<input name="name" type="text" id="name" placeholder="이름을 입력해주세요." autofocus>
			</div>
			<div class="form-group">
				<label for="phone">전화번호</label>
				<input name="phone" type="text" id="phone" placeholder="전화번호를 입력해주세요." >
			</div>
			<br>
			<button type="button" onclick="validate_idFind();">아이디 찾기</button>
		</form>
	</div>
	
	<!-- 자바스크립트 파일 불러오기 -->
    <script src="./resources/js/loginFind.js"></script>
    
</body>
</html>