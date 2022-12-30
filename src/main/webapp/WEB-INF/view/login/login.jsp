<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JH시네마 - 로그인</title>
	
	<!-- font-awesome 아이콘 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	
	<!-- css 파일 불러오기 -->
	<link rel="stylesheet" href="./resources/css/setup.css"/>
	<link rel="stylesheet" href="./resources/css/header.css"/>
	<link rel="stylesheet" href="./resources/css/footer.css"/>
	<link rel="stylesheet" href="./resources/css/login.css"/>
	
</head>
<body>

	<jsp:include page="../header.jsp"/>
	
	<section id="login">
        <div class="container">
            <div class="tap-box">
                <div class="noadmin view">
                    <h2>일반회원</h2>
                </div>
                <div class="admin">
                    <h2>관리자회원</h2>
                </div>
            </div>
            <div class="login-modal login-noadmin">
                <h1>일반회원 로그인 화면입니다.</h1>
                <form action="login_customer" method="post" name="">
                    <div class="form-group">
                        <input type="text" name="login_id" placeholder="아이디를 입력해주세요." required autofocus>
                        <input type="password" name="login_pw" placeholder="비밀번호를 입력해주세요." required>
                    </div>
                    <button class="button" type="submit">로그인</button>
                </form>
                <ul>
                    <li>
                        <a href="addMember_category">회원가입</a>
                    </li>
                    <span>ㅣ</span>
                    <li>
                        <a href="" onclick="idFind();">아이디 찾기</a>
                    </li>
                    <span>ㅣ</span>
                    <li>
                        <a href="" onclick="pwFind();">비밀번호 찾기</a>
                    </li>
                </ul>
            </div>
            <div class="login-modal login-admin">
                <h1>관리자 로그인 화면입니다.</h1>
                <form action="login_admin" method="post" name="">
                    <div class="form-group">
                        <input type="text" name="login_id" placeholder="아이디를 입력해주세요." required autofocus>
                        <input type="password" name="login_pw" placeholder="비밀번호를 입력해주세요." required>
                    </div>
                    <button class="button" type="submit">로그인</button>
                </form>
                <ul>
                    <li>
                        <a href="addMember_category">회원가입</a>
                    </li>
                    <span>ㅣ</span>
                    <li>
                        <a href="" onclick="idFind();">아이디 찾기</a>
                    </li>
                    <span>ㅣ</span>
                    <li>
                        <a href="" onclick="pwFind();">비밀번호 찾기</a>
                    </li>
                </ul>
            </div>
        </div>
    </section>

	<jsp:include page="../footer.jsp"/>
	
	<!-- 자바스크립트 파일 불러오기 -->
    <script src="./resources/js/login.js"></script>
    
    <!-- 로그인 실패시 alert -->
    <script type="text/javascript">
	    $(document).ready(function() {
	        let msg = "${msg}";
	        if (msg != "") {
	            alert(msg + "\n아이디와 비밀번호를 확인해주세요.");
	        }else{}
	    })
    </script>
</body>
</html>