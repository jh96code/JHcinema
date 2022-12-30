<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JH시네마 - 공지사항 등록</title>
	
	<!-- font-awesome 아이콘 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	
	<!-- css 파일 불러오기 -->
	<link rel="stylesheet" href="./resources/css/setup.css"/>
	<link rel="stylesheet" href="./resources/css/header.css"/>
	<link rel="stylesheet" href="./resources/css/footer.css"/>
	<link rel="stylesheet" href="./resources/css/addCS.css"/>
	
</head>
<body>
	<jsp:include page="../header.jsp"/>
	
	<section id="addNotice">
        <div class="container">
            <h1>공지사항 등록</h1>
            <hr>
            <div class="form_box">
                <form action="procAddNotice" method="post" name="addNoticeForm">
                    <div class="form_group">
                        <label for="title" class="label">제목</label>
                        <input type="text" name="title" id="title" placeholder="공지사항 제목을 입력해주세요." size="65">
                    </div>
                    <div class="form_group">
                        <label for="content" class="label">내용</label>
                        <textarea name="content" id="content" style="resize: none;" placeholder="공지사항 내용을 입력해주세요." cols="67" rows="15"></textarea>
                    </div> <br><br><br><br>
                    <button type="button" onclick="addNotice();">등록하기</button>
                </form>
            </div>
        </div>
    </section>
	
	<jsp:include page="../footer.jsp"/>
	
	<!-- js 파일 불러오기 -->
    <script src="./resources/js/addCS.js"></script>
    
</body>
</html>