<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JH시네마 - 스토어</title>
	
	<!-- font-awesome 아이콘 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	
	<!-- css 파일 불러오기 -->
	<link rel="stylesheet" href="./resources/css/setup.css"/>
	<link rel="stylesheet" href="./resources/css/header.css"/>
	<link rel="stylesheet" href="./resources/css/footer.css"/>
	<link rel="stylesheet" href="./resources/css/store.css"/>
	
</head>
<body>
	<jsp:include page="../header.jsp"/>
	
	<section id="store_banner" style="background-image: url(./resources/img/store/store-banner.png)"></section>

    <section id="section02">
        <div class="container">
            <ul class="title">
                <li class="view">관람권</li>
                <li>스낵음료</li>
                <li>포토카드</li>
            </ul>
            <div class="tap-box tap_box01">
                <h3>관람권</h3>
                <ul class="items">
                    <li>
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/store/store-ticket01.jpg)"></div>
                            <div class="name">일반 관람권</div>
                            <div class="sub">일반 관람권 1매</div>
                            <div class="price">10,000원</div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/store/store-ticket02.jpg)"></div>
                            <div class="name">수퍼 3종 관람권</div>
                            <div class="sub">수퍼 3종 관람권 1매</div>
                            <div class="price">25,000원</div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/store/store-ticket03.jpg)"></div>
                            <div class="name">샤롯데 관람권</div>
                            <div class="sub">샤롯데 관람권 1매</div>
                            <div class="price">35,000원</div>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="tap-box tap_box02">
                <h3>스낵음료</h3>
                <ul class="items">
                    <li>
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/store/store-snack01.jpg)"></div>
                            <div class="name">스위트콤보</div>
                            <div class="sub">오리지널L + 탄산음료M2</div>
                            <div class="price">10,000원</div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/store/stroe-snack02.jpg)"></div>
                            <div class="name">콜라 L</div>
                            <div class="sub">콜라L</div>
                            <div class="price">3,000원</div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/store/stroe-snack03.jpg)"></div>
                            <div class="name">사이다 M</div>
                            <div class="sub">사이다M</div>
                            <div class="price">2,500원</div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/store/store-snack01.jpg)"></div>
                            <div class="name">스위트콤보</div>
                            <div class="sub">오리지널L + 탄산음료M2</div>
                            <div class="price">10,000원</div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/store/stroe-snack02.jpg)"></div>
                            <div class="name">콜라 L</div>
                            <div class="sub">콜라L</div>
                            <div class="price">3,000원</div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/store/stroe-snack03.jpg)"></div>
                            <div class="name">사이다 M</div>
                            <div class="sub">사이다M</div>
                            <div class="price">2,500원</div>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="tap-box tap_box03">
                <h3>포토카드</h3>
                <ul class="items">
                    <li>
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/store/store-card01.png)"></div>
                            <div class="name">포토카드(일반)</div>
                            <div class="sub"></div>
                            <div class="price">1,000원</div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/store/store-card02.png)"></div>
                            <div class="name">짱구는 못말려 포토카드</div>
                            <div class="sub">짱구는 못말려 포토카드 1매</div>
                            <div class="price">3,000원</div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/store/store-card03.png)"></div>
                            <div class="name">도라에몽 포토카드</div>
                            <div class="sub">도라에몽 포토카드 1매</div>
                            <div class="price">3,000원</div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/store/store-card01.png)"></div>
                            <div class="name">포토카드(일반)</div>
                            <div class="sub"></div>
                            <div class="price">1,000원</div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/store/store-card02.png)"></div>
                            <div class="name">짱구는 못말려 포토카드</div>
                            <div class="sub">짱구는 못말려 포토카드 1매</div>
                            <div class="price">3,000원</div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="img" style="background-image: url(./resources/img/store/store-card03.png)"></div>
                            <div class="name">도라에몽 포토카드</div>
                            <div class="sub">도라에몽 포토카드 1매</div>
                            <div class="price">3,000원</div>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </section>
	
	<jsp:include page="../footer.jsp"/>
	
	<!-- 자바스크립트 파일 불러오기 -->
    <script src="./resources/js/store.js"></script>
    
</body>
</html>