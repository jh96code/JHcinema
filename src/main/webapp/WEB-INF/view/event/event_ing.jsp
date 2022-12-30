<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JH시네마 - 진행중인 이벤트</title>
	
	<!-- font-awesome 아이콘 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	
	<!-- css 파일 불러오기 -->
	<link rel="stylesheet" href="./resources/css/setup.css"/>
	<link rel="stylesheet" href="./resources/css/header.css"/>
	<link rel="stylesheet" href="./resources/css/footer.css"/>
	<link rel="stylesheet" href="./resources/css/event.css"/>
	
</head>
<body>
	<jsp:include page="../header.jsp"/>
	
	<section id="event">
        <div class="container">
            <div class="title">
                <h2 class="view">진행중인 이벤트</h2>
                <h2>종료된 이벤트</h2>
            </div>
            <div id="event_ing" class="section view">
                <ul class="list">
                    <li>
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/event/event01.jpg);"></div>
                            <div class="name">[블랙 아담]필름마크</div>
                            <div class="date">2022.11.15 ~ 2022.11.30</div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/event/event02.jpg);"></div>
                            <div class="name">[에릭 로메르 특별전]아트포스터 증정 이벤트</div>
                            <div class="date">2022.11.16 ~ 2022.11.30</div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/event/event03.jpg);"></div>
                            <div class="name">[이달의 아이스크림]11월 라인업 미리 만나보기</div>
                            <div class="date">2022.11.17 ~ 2022.11.30</div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/event/event04.jpg);"></div>
                            <div class="name">[원피스 필름 레드]프리미어 상영회</div>
                            <div class="date">2022.11.18 ~ 2022.11.30</div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/event/event05.jpg);"></div>
                            <div class="name">[데시벨]개봉 주말 한정판 포토카드 증정 이벤트</div>
                            <div class="date">2022.11.19 ~ 2022.11.30</div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/event/event06.jpg);"></div>
                            <div class="name">[데시벨]스폐셜 포스터 최초 증정 이벤트</div>
                            <div class="date">2022.11.20 ~ 2022.11.30</div>
                        </a>
                    </li>
                    <li class="more_view">
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/event/event01.jpg);"></div>
                            <div class="name">[블랙 아담]필름마크</div>
                            <div class="date">2022.11.15 ~ 2022.11.30</div>
                        </a>
                    </li>
                    <li class="more_view">
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/event/event02.jpg);"></div>
                            <div class="name">[에릭 로메르 특별전]아트포스터 증정 이벤트</div>
                            <div class="date">2022.11.16 ~ 2022.11.30</div>
                        </a>
                    </li>
                    <li class="more_view">
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/event/event03.jpg);"></div>
                            <div class="name">[이달의 아이스크림]11월 라인업 미리 만나보기</div>
                            <div class="date">2022.11.17 ~ 2022.11.30</div>
                        </a>
                    </li>
                    <li class="more_view">
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/event/event04.jpg);"></div>
                            <div class="name">[원피스 필름 레드]프리미어 상영회</div>
                            <div class="date">2022.11.18 ~ 2022.11.30</div>
                        </a>
                    </li>
                    <li class="more_view">
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/event/event05.jpg);"></div>
                            <div class="name">[데시벨]개봉 주말 한정판 포토카드 증정 이벤트</div>
                            <div class="date">2022.11.19 ~ 2022.11.30</div>
                        </a>
                    </li>
                    <li class="more_view">
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/event/event06.jpg);"></div>
                            <div class="name">[데시벨]스폐셜 포스터 최초 증정 이벤트</div>
                            <div class="date">2022.11.20 ~ 2022.11.30</div>
                        </a>
                    </li>
                </ul>
                <div class="more_btn">펼쳐보기 ∨</div>
            </div>
            <div id="event_end" class="section">
                <ul class="list">
                    <li>
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/event/event_end01.jpg);"></div>
                            <div class="name">[블랙 아담]필름마크</div>
                            <div class="date">2022.10.10 ~ 2022.11.11</div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/event/event_end02.jpg);"></div>
                            <div class="name">[에릭 로메르 특별전]아트포스터 증정 이벤트</div>
                            <div class="date">2022.10.10 ~ 2022.11.07</div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/event/event_end03.jpg);"></div>
                            <div class="name">[이달의 아이스크림]11월 라인업 미리 만나보기</div>
                            <div class="date">2022.10.10 ~ 2022.11.07</div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/event/event_end04.jpg);"></div>
                            <div class="name">[원피스 필름 레드]프리미어 상영회</div>
                            <div class="date">2022.10.10 ~ 2022.11.07</div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/event/event_end05.jpg);"></div>
                            <div class="name">[데시벨]개봉 주말 한정판 포토카드 증정 이벤트</div>
                            <div class="date">2022.10.10 ~ 2022.11.07</div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/event/event_end06.jpg);"></div>
                            <div class="name">[데시벨]스폐셜 포스터 최초 증정 이벤트</div>
                            <div class="date">2022.10.10 ~ 2022.11.07</div>
                        </a>
                    </li>
                    <li class="more_view">
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/event/event_end01.jpg);"></div>
                            <div class="name">[블랙 아담]필름마크</div>
                            <div class="date">2022.10.10 ~ 2022.11.11</div>
                        </a>
                    </li>
                    <li class="more_view">
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/event/event_end02.jpg);"></div>
                            <div class="name">[에릭 로메르 특별전]아트포스터 증정 이벤트</div>
                            <div class="date">2022.10.10 ~ 2022.11.07</div>
                        </a>
                    </li>
                    <li class="more_view">
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/event/event_end03.jpg);"></div>
                            <div class="name">[이달의 아이스크림]11월 라인업 미리 만나보기</div>
                            <div class="date">2022.10.10 ~ 2022.11.07</div>
                        </a>
                    </li>
                    <li class="more_view">
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/event/event_end04.jpg);"></div>
                            <div class="name">[원피스 필름 레드]프리미어 상영회</div>
                            <div class="date">2022.10.10 ~ 2022.11.07</div>
                        </a>
                    </li>
                    <li class="more_view">
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/event/event_end05.jpg);"></div>
                            <div class="name">[데시벨]개봉 주말 한정판 포토카드 증정 이벤트</div>
                            <div class="date">2022.10.10 ~ 2022.11.07</div>
                        </a>
                    </li>
                    <li class="more_view">
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/event/event_end06.jpg);"></div>
                            <div class="name">[데시벨]스폐셜 포스터 최초 증정 이벤트</div>
                            <div class="date">2022.10.10 ~ 2022.11.07</div>
                        </a>
                    </li>
                </ul>
                <div class="more_btn">펼쳐보기 ∨</div>
            </div>
        </div>
    </section>
	
	<jsp:include page="../footer.jsp"/>
	
	<!-- 자바스크립트 파일 불러오기 -->
    <script src="./resources/js/event.js"></script>
    
</body>
</html>