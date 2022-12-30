<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JH시네마 - 회원가입 유형</title>
	
	<!-- font-awesome 아이콘 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	
	<!-- css 파일 불러오기 -->
	<link rel="stylesheet" href="./resources/css/setup.css"/>
	<link rel="stylesheet" href="./resources/css/header.css"/>
	<link rel="stylesheet" href="./resources/css/footer.css"/>
	<link rel="stylesheet" href="./resources/css/member_category.css"/>
	
</head>
<body>
	<jsp:include page="../header.jsp"/>
 
 	<section id="member_category">
        <div class="container">
            <h1 class="title">회원가입 유형</h1>
            <div class="box">
                <div class="click_box">
                    <div class="name">일반회원</div>
                    <i class="fas fa-users"></i> <br>
                    <div class="text">JH시네마를 통해 <br>제공하는 서비스를 <br>사용하는 회원</div>
                    <a href="addMember_customer" class="btn">가입하기</a>
                </div>
                <div class="click_box">
                    <div class="name">관리자</div>
                    <i class="fas fa-users-cog"></i> <br>
                    <div class="text">JH시네마의 상품 <br>등록이나 문의 답변을 <br>관리하는 회원</div>
                    <a href="addMember_admin" class="btn">가입하기</a>
                </div>
            </div>
        </div>
    </section>      
            
	<jsp:include page="../footer.jsp"/>
</body>
</html>