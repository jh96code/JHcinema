<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JH시네마 - FAQ 등록</title>
	
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
	
	<section id="addFAQ">
        <div class="container">
            <h1>FAQ 등록</h1>
            <hr>
            <div class="form_box">
                <form action="procAddFAQ" method="post" name="addFAQForm">
                	<div class="form_group">
                        <label class="label">구분</label>
                        <select name="category">
							<option value="default">구분 유형을 선택해주세요.</option>
							<option value="영화관 이용">영화관 이용</option>
							<option value="회원">회원</option>
							<option value="온라인">온라인</option>
							<option value="관람권">관람권</option>
							<option value="할인혜택">할인혜택</option>
							<option value="스토어">스토어</option>
						</select>
                    </div>
                    <div class="form_group">
                        <label for="title" class="label">질문</label>
                        <input type="text" name="title" id="title" placeholder="질문 제목을 입력해주세요." size="65">
                    </div>
                    <div class="form_group">
                        <label for="content" class="label">답변</label>
                        <textarea name="content" id="content" style="resize: none;" placeholder="답변 내용을 입력해주세요." cols="67" rows="10"></textarea>
                    </div> <br><br><br><br>
                    <button type="button" onclick="addFAQ();">등록하기</button>
                </form>
            </div>
        </div>
    </section>
	
	<jsp:include page="../footer.jsp"/>
	
	<!-- js 파일 불러오기 -->
    <script src="./resources/js/addCS.js"></script>
    
</body>
</html>