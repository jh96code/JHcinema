<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JH시네마 - 공지사항(상세)</title>
	
	<!-- font-awesome 아이콘 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	
	<!-- css 파일 불러오기 -->
	<link rel="stylesheet" href="./resources/css/setup.css"/>
	<link rel="stylesheet" href="./resources/css/header.css"/>
	<link rel="stylesheet" href="./resources/css/footer.css"/>
	<link rel="stylesheet" href="./resources/css/noticeView.css"/>
	
</head>
<body>
	<jsp:include page="../header.jsp"/>
	
	<section id="noticeView">
        <div class="container">
            <h1>공지사항</h1>
            <hr>
            <div class="title">${notice.title}</div>
            <hr>
            <div class="content_box">
                <div class="head">
                	<p>
                        <span class="name">번호</span> <span class="line">ㅣ</span> <span class="sub">${notice.num}</span>
                    </p>
                    <p>
                        <span class="name">등록일</span> <span class="line">ㅣ</span> <span class="sub">${notice.regist_day}</span>
                    </p>
                    <p>
                        <span class="name">조회수</span> <span class="line">ㅣ</span> <span class="sub">${notice.hit}</span>
                    </p>
                </div>
                <div class="content">
                    <p>${notice.content}</p>
                </div>
            </div>
            <%
            	String admincheck = (String) session.getAttribute("admincheck");
            	if(admincheck == "true"){ 
            %>
				<a href="deleteNotice?num=${notice.num}" class="delete">삭제하기</a>
			<%	} %>
            <div class="back">
      			<a href="javascript:history.back()" class="back">목록</a>      
            </div>
        </div>
    </section>
	
	<jsp:include page="../footer.jsp"/>
</body>
</html>