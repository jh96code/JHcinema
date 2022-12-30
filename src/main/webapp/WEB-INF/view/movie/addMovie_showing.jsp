<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JH시네마 - 영화등록(현재상영작)</title>
	
	<!-- font-awesome 아이콘 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	
	<!-- swiper css 불러오기 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
	
	<!-- css 파일 불러오기 -->
	<link rel="stylesheet" href="./resources/css/setup.css"/>
	<link rel="stylesheet" href="./resources/css/header.css"/>
	<link rel="stylesheet" href="./resources/css/footer.css"/>
	<link rel="stylesheet" href="./resources/css/addMovie.css"/>
	<link rel="stylesheet" href="./resources/css/movie_banner_slide.css"/>
	
</head>
<body>
	<jsp:include page="../header.jsp"/>

	<jsp:include page="./movie_banner.jsp"/>
	
	<section id="addMovie">
        <div class="container">
            <h1>영화등록 <span>(현재상영작)</span></h1>
            <hr>
            <div class="form_box">
                <form action="procAddMovie_showing" method="post" name="addMovieForm" enctype="multipart/form-data">
                    <div class="form_group">
                        <label for="title" class="label">영화제목</label>
                        <input type="text" name="title" id="title" placeholder="영화제목을 입력해주세요." size="65">
                    </div>
                    <div class="form_group">
                        <label class="label">장르</label>
                        <select name="category">
							<option value="default">장르를 선택해주세요.</option>
							<option value="로맨스, 멜로">로맨스,멜로</option>
							<option value="미스테리, 범죄">미스테리,범죄</option>
							<option value="스릴러">스릴러</option>
							<option value="코미디">코미디</option>
							<option value="판타지">판타지</option>
							<option value="SF">SF</option>
							<option value="공포, 호러">공포,호러</option>
							<option value="다큐">다큐</option>
							<option value="애니메이션">애니메이션</option>
							<option value="기타">기타</option>
						</select>
                    </div>
                    <div class="form_group">
                        <label class="label">국가</label>
                        <select name="country">
							<option value="default">국가를 선택해주세요.</option>
							<option value="한국">한국</option>
							<option value="외국">외국</option>
						</select>
                    </div>
                    <div class="form_group">
                        <label for="director" class="label">감독</label>
                        <input type="text" name="director" id="director" placeholder="감독을 입력해주세요." size="25">
                    </div>
                    <div class="form_group">
                        <label for="actor" class="label">출연진</label>
                        <input type="text" name="actor" id="actor" placeholder="출연진을 입력해주세요. (출연진1, 출연진2, ...)" size="65">
                    </div>
                    <div class="form_group">
                        <label for="movieTime" class="label">상영시간</label>
                        <input type="text" name="movieTime" id="movieTime" placeholder="분을 입력해주세요." size="15">
                    </div>
                    <div class="form_group">
                        <label for="openDate" class="label">개봉일</label>
                        <input type="date" name="openDate" id="openDate" >
                    </div>
                    <div class="form_group">
                        <label class="label">영화 이미지</label>
                        <input type="file" name="file" placeholder="첨부파일" size="25" readonly>
                    </div>
                    <div class="form_group">
                        <label for="content" class="label">줄거리</label>
                        <textarea name="content" id="content" style="resize: none;" placeholder="줄거리를 입력해주세요." cols="67" rows="5"></textarea>
                    </div> <br><br><br><br>
                    <button type="button" onclick="validate();">등록하기</button>
                </form>
            </div>
        </div>
    </section>
	
	<jsp:include page="../footer.jsp"/>
	
	<!-- js 파일 불러오기 -->
    <script src="./resources/js/movie_slide.js"></script>
    <script src="./resources/js/addMovie.js"></script>
    
    <!-- 개봉일을 오늘 날짜 이후로 클릭 못하게 하기 -->
    <script type="text/javascript">
	    let nowDate = Date.now() // 지금 날짜를 밀리초로
		// getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
		let timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
		// new Date(nowDate-timeOff).toISOString()은 '2022-11-30T18:09:38.134Z'를 반환
		let today = new Date(nowDate-timeOff).toISOString().split("T")[0];
		document.getElementById("openDate").setAttribute("max", today);
    </script>
    
</body>
</html>