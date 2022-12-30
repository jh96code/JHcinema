<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JH시네마 - 혜택</title>
	
	<!-- font-awesome 아이콘 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	
	<!-- swiper css 불러오기 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
	
	<!-- css 파일 불러오기 -->
	<link rel="stylesheet" href="./resources/css/setup.css"/>
	<link rel="stylesheet" href="./resources/css/header.css"/>
	<link rel="stylesheet" href="./resources/css/footer.css"/>
	<link rel="stylesheet" href="./resources/css/benefit.css"/>
	
</head>
<body>
	<jsp:include page="../header.jsp"/>
	
	<section id="banner">
        <div class="container">
            <div class="swiper benefit-banner-slider">
                <ul class="swiper-wrapper">
                    <li class="swiper-slide">
                        <div class="img" style="background-image: url(./resources/img/benefit/benefit_banner01.jpg);"></div>
                    </li>
                    <li class="swiper-slide">
                        <div class="img" style="background-image: url(./resources/img/benefit/benefit_banner02.jpg);"></div>
                    </li>
                    <li class="swiper-slide">
                        <div class="img" style="background-image: url(./resources/img/benefit/benefit_banner03.jpg);"></div>
                    </li>
                </ul>
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
            </div>
        </div>
    </section>  
	
	<section id="benefit">
        <div class="container">
            <div class="title">
                <h2 class="view">할인정보</h2>
                <h2>CLUB서비스</h2>
            </div>
            <div id="sale" class="section view">
                <ul class="list">
                    <li>
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/benefit/benefit_sale01.jpg);"></div>
                            <div class="name">관람권 4,000원 ~ 8,000원 할인</div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/benefit/benefit_sale02.jpg);"></div>
                            <div class="name">TOSS로 결제하고 3,000원 캐시백 혜택받기!</div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/benefit/benefit_sale03.jpg);"></div>
                            <div class="name">현대 M포인트로 매주 6천 M포인트 차감할인</div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/benefit/benefit_sale01.jpg);"></div>
                            <div class="name">관람권 4,000원 ~ 8,000원 할인</div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/benefit/benefit_sale02.jpg);"></div>
                            <div class="name">TOSS로 결제하고 3,000원 캐시백 혜택받기!</div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/benefit/benefit_sale03.jpg);"></div>
                            <div class="name">현대 M포인트로 매주 6천 M포인트 차감할인</div>
                        </a>
                    </li>
                    <li class="more_view">
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/benefit/benefit_sale01.jpg);"></div>
                            <div class="name">관람권 4,000원 ~ 8,000원 할인</div>
                        </a>
                    </li>
                    <li class="more_view">
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/benefit/benefit_sale02.jpg);"></div>
                            <div class="name">TOSS로 결제하고 3,000원 캐시백 혜택받기!</div>
                        </a>
                    </li>
                    <li class="more_view">
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/benefit/benefit_sale03.jpg);"></div>
                            <div class="name">현대 M포인트로 매주 6천 M포인트 차감할인</div>
                        </a>
                    </li>
                    <li class="more_view">
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/benefit/benefit_sale01.jpg);"></div>
                            <div class="name">관람권 4,000원 ~ 8,000원 할인</div>
                        </a>
                    </li>
                    <li class="more_view">
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/benefit/benefit_sale02.jpg);"></div>
                            <div class="name">TOSS로 결제하고 3,000원 캐시백 혜택받기!</div>
                        </a>
                    </li>
                    <li class="more_view">
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/benefit/benefit_sale03.jpg);"></div>
                            <div class="name">현대 M포인트로 매주 6천 M포인트 차감할인</div>
                        </a>
                    </li>
                </ul>
                <div class="more_btn">펼쳐보기 ∨</div>
            </div>
            <div id="club" class="section">
                <ul class="list">
                    <li>
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/benefit/benefit_club01.jpg);"></div>
                            <div class="name">1318 CLUB</div>
                            <div class="sub">만 13~18세 청소년이라면 누구나! <br>누구나 가입하고 다양한 혜택과 특별 이벤트를 만나보세요.</div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/benefit/benefit_club02.jpg);"></div>
                            <div class="name">커플링 CLUB</div>
                            <div class="sub">현재 진행형(ing)인 커플이라면 <br>누구나 누릴 수 있는 커플 전용 클럽 서비스입니다.</div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/benefit/benefit_club03.jpg);"></div>
                            <div class="name">아트하우스 CLUB</div>
                            <div class="sub">회원제 서비스로, 아트하우스 영화를 즐겨 보고 <br>좋아하는 사람이라면 누구나 가입 할 수 있습니다.</div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/benefit/benefit_club01.jpg);"></div>
                            <div class="name">1318 CLUB</div>
                            <div class="sub">만 13~18세 청소년이라면 누구나! <br>누구나 가입하고 다양한 혜택과 특별 이벤트를 만나보세요.</div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/benefit/benefit_club02.jpg);"></div>
                            <div class="name">커플링 CLUB</div>
                            <div class="sub">현재 진행형(ing)인 커플이라면 <br>누구나 누릴 수 있는 커플 전용 클럽 서비스입니다.</div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/benefit/benefit_club03.jpg);"></div>
                            <div class="name">아트하우스 CLUB</div>
                            <div class="sub">회원제 서비스로, 아트하우스 영화를 즐겨 보고 <br>좋아하는 사람이라면 누구나 가입 할 수 있습니다.</div>
                        </a>
                    </li>
                    <li class="more_view">
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/benefit/benefit_club01.jpg);"></div>
                            <div class="name">1318 CLUB</div>
                            <div class="sub">만 13~18세 청소년이라면 누구나! <br>누구나 가입하고 다양한 혜택과 특별 이벤트를 만나보세요.</div>
                        </a>
                    </li>
                    <li class="more_view">
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/benefit/benefit_club02.jpg);"></div>
                            <div class="name">커플링 CLUB</div>
                            <div class="sub">현재 진행형(ing)인 커플이라면 <br>누구나 누릴 수 있는 커플 전용 클럽 서비스입니다.</div>
                        </a>
                    </li>
                    <li class="more_view">
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/benefit/benefit_club03.jpg);"></div>
                            <div class="name">아트하우스 CLUB</div>
                            <div class="sub">회원제 서비스로, 아트하우스 영화를 즐겨 보고 <br>좋아하는 사람이라면 누구나 가입 할 수 있습니다.</div>
                        </a>
                    </li>
                    <li class="more_view">
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/benefit/benefit_club01.jpg);"></div>
                            <div class="name">1318 CLUB</div>
                            <div class="sub">만 13~18세 청소년이라면 누구나! <br>누구나 가입하고 다양한 혜택과 특별 이벤트를 만나보세요.</div>
                        </a>
                    </li>
                    <li class="more_view">
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/benefit/benefit_club02.jpg);"></div>
                            <div class="name">커플링 CLUB</div>
                            <div class="sub">현재 진행형(ing)인 커플이라면 <br>누구나 누릴 수 있는 커플 전용 클럽 서비스입니다.</div>
                        </a>
                    </li>
                    <li class="more_view">
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/benefit/benefit_club03.jpg);"></div>
                            <div class="name">아트하우스 CLUB</div>
                            <div class="sub">회원제 서비스로, 아트하우스 영화를 즐겨 보고 <br>좋아하는 사람이라면 누구나 가입 할 수 있습니다.</div>
                        </a>
                    </li>
                </ul>
                <div class="more_btn">펼쳐보기 ∨</div>
            </div>
        </div>
    </section>

	<jsp:include page="../footer.jsp"/>
	
	<!-- 자바스크립트 파일 불러오기 -->
    <script src="./resources/js/benefit.js"></script>
   
</body>
</html>