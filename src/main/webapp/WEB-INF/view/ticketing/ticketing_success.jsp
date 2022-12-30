<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JH시네마 - 예매성공</title>
	
	<!-- font-awesome 아이콘 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	
	<!-- css 파일 불러오기 -->
	<link rel="stylesheet" href="./resources/css/setup.css"/>
	<link rel="stylesheet" href="./resources/css/header.css"/>
	<link rel="stylesheet" href="./resources/css/footer.css"/>
	<link rel="stylesheet" href="./resources/css/ticketing.css"/>
	
</head>
<body>
	<jsp:include page="../header.jsp"/>
	
	<section id="ticketing_success">
		<div class="container">
			<p>
				예매를 완료하였습니다. <br><br>
				<a href="mypage?id=${login_id}">마이페이지</a>에서 영화예매 내역을 확인하실 수 있습니다.
			</p>
		</div>
	</section>
    
    <jsp:include page="../footer.jsp"/>
</body>
</html>