<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JH시네마 - 극장</title>
	
	<!-- font-awesome 아이콘 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	
	<!-- swiper css 불러오기 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
	
	<!-- css 파일 불러오기 -->
	<link rel="stylesheet" href="./resources/css/setup.css"/>
	<link rel="stylesheet" href="./resources/css/header.css"/>
	<link rel="stylesheet" href="./resources/css/footer.css"/>
	<link rel="stylesheet" href="./resources/css/cinema.css"/>
	<link rel="stylesheet" href="./resources/css/movie_banner_slide.css"/>
	
</head>
<body>
	<jsp:include page="../header.jsp"/>
	
	<jsp:include page="/WEB-INF/view/movie/movie_banner.jsp"/>

    <section id="section02">
        <div class="container">
            <ul class="title">
                <li class="view">김해</li>
                <li>창원</li>
                <li>부산</li>
                <li>양산</li>
            </ul>
            <div class="tap-box tap-box01 view">
                <p class="count">총 상영관 수 <span>7개관</span></p>
                <p class="count">총 좌석 수 <span>1,492석</span></p>
                <p class="addr">경상남도 김해시 장유로 469</p>
                <ul class="guide">
                    <li>
                        <i class="fas fa-bus"></i>&nbsp; 대중교통 안내
                    </li>
                    <li>
                        <i class="fas fa-car"></i>&nbsp; 자가용/주차안내
                    </li>
                    <li>
                        <i class="fas fa-map-marked-alt"></i>&nbsp; 지도보기
                    </li>
                </ul>
                <div class="guide_bus">
                    <h3>대중교통안내</h3>
                    <div class="text-box">
                        <p class="name">지하철로 오시는 길</p>
                        <p class="text">경전철 부원역 하차 후 버스 3-1로 환승</p>
                        <p class="name">버스로 오시는 길</p>
                        <p class="text">3-1, 22, 25, 26, 220, 221번 버스 이용</p>
                        <p class="sub">롯데아울렛 정거장 하차 후 아울렛 안쪽으로 350m 직진 <br>
                            아울렛 D동 또는 신관 라코스테, 나이키 건물 4층 이동</p>
                    </div>
                    <div class="close">×</div>
                </div>
                <div class="guide_car">
                    <h3>자가용/주차안내</h3>
                    <div class="text-box">
                        <p class="name">자가용으로 오시는 길</p>
                        <p class="text">[내비게이션 검색] </p>
                        <p class="sub">롯데시네마 김해아울렛(경남 김해시 장유로 469)</p>
                        <p class="text">서부산 출발(빠른 길)</p>
                        <p class="sub">남해 고속도로 서부산 IC>가락IC>김해, 장유방면>봉림지하차도 우측 장유 방면>봉림교차로 장유방면 직진>유통단지 교차로 우회전 후 직진>김해 농수산물 유통센터 앞 삼거리 좌회전 후 직진>롯데 프리미엄 아울렛 김해점</p>
                        <p class="name">[주차장 이용방법]</p>
                        <p class="sub">지하주차장 주차 후 에스컬레이터&엘리베이터 이용 4층 이동 <br>
                            지상주차장 주차 후 아울렛 D동 또는 신관 라코스테, 나이키 건물 4층 이동</p>
                        <p class="name">주차요금 안내</p>
                        <p class="text">5,130대 주차 가능(임시 주차장 1,700여대 포함)</p>
                        <p class="text">주차 요금 무료</p>
                    </div>
                    <div class="close">×</div>
                </div>
                <div class="guide_bg"></div>
                <div id="map">
                    <div class="close">×</div>
                </div>
            </div>

            <div class="tap-box tap-box02">
                <p class="count">총 상영관 수 <span>8개관</span></p>
                <p class="count">총 좌석 수 <span>1,587석</span></p>
                <p class="addr">경상남도 창원시 마산회원구 3·15대로 750</p>
                <ul class="guide">
                    <li>
                        <i class="fas fa-bus"></i>&nbsp; 대중교통 안내
                    </li>
                    <li>
                        <i class="fas fa-car"></i>&nbsp; 자가용/주차안내
                    </li>
                    <li>
                        <i class="fas fa-map-marked-alt"></i>&nbsp; 지도보기
                    </li>
                </ul>
                <div class="guide_bus">
                    <h3>대중교통안내</h3>
                    <div class="text-box">
                        <p class="name">버스로 오시는 길</p>
                        <p class="text">100, 103, 113, 162, 700, 702, 703, 705, 710, 760번</p>
                    </div>
                    <div class="close">×</div>
                </div>
                <div class="guide_car">
                    <h3>자가용/주차안내</h3>
                    <div class="text-box">
                        <p class="name">자가용으로 오시는 길</p>
                        <p class="text">창원 방향</p>
                        <p class="sub">창원역에서 마산시외버스터미널 방향으로 오다가 마산복음병원으로 좌회전하여 약 1km 직진 후 우측 터미널 주차장에 주차</p>
                        <p class="text">마산 방향</p>
                        <p class="sub">마산역에서 마산시외버스터미널 방향으로 직진하다 롯데리아 삼거리에서 우회전 하여 국민은행 사거리에서 좌회전 후 좌측 터미널 주차장에 주차</p>
                        <p class="name">주차요금 안내</p>
                        <p class="text">영화관 뒤편 사거리 마산터미널 주차장 이용 가능</p>
                        <p class="text">평일, 주말, 공휴일</p>
                        <p class="sub">3시간 무료 주차(영화관람 고객 한정)</p>
                        <p class="text">주차요금</p>
                        <p class="sub">최초 30분 1,000원 / 추가 15분당 500원</p>
                        <p class="text">인증방법</p>
                        <p class="sub">영화티켓 발권 및 확인 시 주차권에 무료주차 도장을 받아 퇴차 시 제출</p>
                    </div>
                    <div class="close">×</div>
                </div>
                <div class="guide_bg"></div>
            </div>

            <div class="tap-box tap-box03">
                <p class="count">총 상영관 수 <span>9개관</span></p>
                <p class="count">총 좌석 수 <span>1,782석</span></p>
                <p class="addr">부산광역시 부산진구 가야대로 772</p>
                <ul class="guide">
                    <li>
                        <i class="fas fa-bus"></i>&nbsp; 대중교통 안내
                    </li>
                    <li>
                        <i class="fas fa-car"></i>&nbsp; 자가용/주차안내
                    </li>
                    <li>
                        <i class="fas fa-map-marked-alt"></i>&nbsp; 지도보기
                    </li>
                </ul>
                <div class="guide_bus">
                    <h3>대중교통안내</h3>
                    <div class="text-box">
                        <p class="name">지하철로 오시는 길</p>
                        <p class="text">[백화점 영업시간 내]</p>
                        <p class="sub">-서면역 1,2호선 지하상가 > 롯데백화점 지하 1층 진입 > 백화점 내 E/V 이용(지하 1층 -> 9층) > E/S 이용(9층 -> 10층)</p>
                        <p class="text">[백화점 영업시간 외]</p>
                        <p class="sub">-롯데백화점 1층 정문 > 건물 좌측을 따라 건물 뒷편으로 이동 > 롯데백화점 1층(후문) 진입 > E/V이용 (1층 -> 10층) <br>
                            아울렛 D동 또는 신관 라코스테, 나이키 건물 4층 이동</p>
                        <p class="name">버스로 오시는 길</p>
                        <p class="text">[김해공항 -> 롯데백화점]</p>
                        <p class="sub">공항리무진(1시간 단위)</p>
                        <p class="text">[사상방면 -> 롯데백화점]</p>
                        <p class="sub">107번, 108번, 62번 등</p>
                        <p class="text">[부산역방면 -> 롯데백화점]</p>
                        <p class="sub">98번, 67번, 167번, 81번, 28번</p>
                        <p class="text">[해운대방면 -> 롯데백화점]</p>
                        <p class="sub">141번, 40번, 31번, 5번</p>
                        <p class="text">[동래방면 -> 롯데백화점]</p>
                        <p class="sub">111번, 77번, 31번, 52번</p>
                    </div>
                    <div class="close">×</div>
                </div>
                <div class="guide_car">
                    <h3>자가용/주차안내</h3>
                    <div class="text-box">
                        <p class="name">자가용으로 오시는 길</p>
                        <p class="text">부산 부산진구 가야대로 772 </p>
                        <p class="name">주차요금 안내</p>
                        <p class="text">무인 정산기 주차권 인증 시 요금(3시간 기준)</p>
                        <p class="sub">입차시간 (07시 ~18시 59분) 2,000원 <br>
                            입차시간 (19시 ~ 06시 59분) 1,500원</p>
                    </div>
                    <div class="close">×</div>
                </div>
                <div class="guide_bg"></div>
            </div>

            <div class="tap-box tap-box04">
                <p class="count">총 상영관 수 <span>6개관</span></p>
                <p class="count">총 좌석 수 <span>1,092석</span></p>
                <p class="addr">경상남도 양산시 물금읍 백호로 68</p>
                <ul class="guide">
                    <li>
                        <i class="fas fa-bus"></i>&nbsp; 대중교통 안내
                    </li>
                    <li>
                        <i class="fas fa-car"></i>&nbsp; 자가용/주차안내
                    </li>
                    <li>
                        <i class="fas fa-map-marked-alt"></i>&nbsp; 지도보기
                    </li>
                </ul>
                <div class="guide_bus">
                    <h3>대중교통안내</h3>
                    <div class="text-box">
                        <p class="name">지하철로 오시는 길</p>
                        <p class="text">지하철 2호선 부산대양산캠퍼스역 3번 출구 또는</p>
                        <p>증산역 1번 출구 하차 후 도보 15분 소요</p>
                        <p class="name">버스로 오시는 길</p>
                        <p class="text">양산 8, 26, 32-1, 1300번 버스를 이용하시면 물금농협가촌지점</p>
                        <p>정류장에 하차 후 도보 3분 소요, 부산 21, 1500번 버스를 이용하시면 가촌 마을 정류장에 하차 후 도보 15분 소요</p> 
                    </div>
                    <div class="close">×</div>
                </div>
                <div class="guide_car">
                    <h3>자가용/주차안내</h3>
                    <div class="text-box">
                        <p class="name">자가용으로 오시는 길</p>
                        <p class="text">양우내안애아파트 1,2차 정문 방향에서 진입 가능하며, 지하 1~2층에 주차.</p>
                        <p class="name">주차요금 안내</p>
                        <p class="text">상영관 입장 전 매표소에서 주차 등록 후 3시간 무료 이용 가능.</p>
                        <p>(만차 시, 영화관 건물 맞은편 무료 공영 주차장 이용 바랍니다)</p>
                    </div>
                    <div class="close">×</div>
                </div>
                <div class="guide_bg"></div>
            </div>
        </div>
    </section>	

	<jsp:include page="../footer.jsp"/>
	
	<!-- 자바스크립트 파일 불러오기 -->
    <script src="./resources/js/movie_slide.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=61c4181caa07a296127adeb2d21267a4"></script>
    <script src="./resources/js/cinema.js"></script>
</body>
</html>