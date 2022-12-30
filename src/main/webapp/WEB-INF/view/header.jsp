<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header>
        <div class="container">
            <nav>
                <div class="topbar">
                    <div class="flex">
                        <ul class="left">
                            <li>
                                <a href="https://www.facebook.com/"><i class="fab fa-facebook"></i> 페이스북</a>
                            </li>
                            <li>
                                <a href="https://www.instagram.com/"><i class="fab fa-instagram-square"></i> 인스타그램</a>
                            </li>
                            <li>
                                <a href="https://www.youtube.com/"><i class="fab fa-youtube"></i> 유튜브</a>
                            </li>
                        </ul>
                        <ul class="right">
	                        <%
		                		String loginid = (String) session.getAttribute("login_id");
	                        	String admincheck = (String) session.getAttribute("admincheck");
								if(loginid != null){
							%>
							<li>
								<a href="mypage?id=<%=loginid%>">
									<span><%=loginid%>님
										<%if(admincheck == "true"){ %>
											(관리자)
										<%} else{%>
											(일반회원)
										<%} %>
									</span>
								</a>
							</li>
							<li>
		                        <a href="mypage?id=<%=loginid%>">마이페이지</a>
		                    </li>
		                    <span>ㅣ</span>
		                    <li>
								<a href="FAQ">고객센터</a>
                            </li>
                            <span>ㅣ</span>
							<li>
		                        <a href="#" onclick="logoutbtn()">로그아웃</a>
		                    </li>	
		                    <%
								} else{
		                    %>
                            <li>
                                <a href="login">로그인</a>
                            </li>
                            <span>ㅣ</span>
                            <li>
                                <a href="addMember_category">회원가입</a>
                            </li>
                            <span>ㅣ</span>
                            <li>
                                <a href="FAQ">고객센터</a>
                            </li>
                            <%} %>
                            
                        </ul>
                    </div>
                </div>
                <div class="menu">
                    <div class="left">
                        <i class="fas fa-bars"></i>
                    </div>
                    <ul class="center">
                        <li>
                            <a href="movie_home">영화</a>
                            <ol class="sub-menu">
                                <li>
                                    <a href="movie_home">홈</a>
                                </li>
                                <span>ㅣ</span>
                                <li>
                                    <a href="movie_showing">현재상영작</a>
                                </li>
                                <span>ㅣ</span>
                                <li>
                                    <a href="movie_coming">상영예정작</a>
                                </li>
                            </ol>
                        </li>
                        <li>
                            <a href="cinema">극장</a>
                        </li>
                        <li>
                            <a href="ticketing_date">예매</a>
                        </li>
                        <li>
                            <a href="/JHcinema/">
                                <img src="./resources/img/logo.png" class="logo" alt="">
                            </a>
                        </li>
                        <li>
                            <a href="store">스토어</a>
                        </li>
                        <li>
                            <a href="event_ing">이벤트</a>
                            <ol class="sub-menu">
                                <li>
                                    <a href="event_ing">진행중인 이벤트</a>
                                </li>
                                <span>ㅣ</span>
                                <li>
                                    <a href="event_end">종료된 이벤트</a>
                                </li>
                            </ol> 
                        </li>
                        <li>
                            <a href="benefit">혜택</a>
                        </li>
                    </ul>
                    <div class="right">
                    	<%
                    		if(loginid != null){
                    	%>
                        	<a href="mypage?id=<%=loginid%>"><i class="far fa-user"></i></a>
                        <% 
                        	} else{ 
                        %>
                        	<a href="#" onclick="loginCheck();"><i class="far fa-user"></i></a>
                        <%	} %>
                    </div>
                </div>
            </nav>
        </div>

        <div class="menu-popup">
                <ul>
                    <li>영화
                        <ol class="sub">
                            <li>
                                <a href="movie_home">홈</a>
                            </li>
                            <li>
                                <a href="movie_showing">현재상영작</a>
                            </li>
                            <li>
                                <a href="movie_coming">상영예정작</a>
                            </li>
                        </ol>
                    </li>
                    <li>극장
                        <ol class="sub">
                            <li>
                                <a href="cinema">김해</a>
                            </li>
                            <li>
                                <a href="cinema">창원</a>
                            </li>
                            <li>
                                <a href="cinema">부산</a>
                            </li>
                            <li>
                                <a href="cinema">양산</a>
                            </li>
                        </ol>
                    </li>
                    <li>예매
                        <ol class="sub">
                            <li>
                                <a href="ticketing_date">예매하기</a>
                            </li>
                        </ol>
                    </li>
                    <li>스토어
                        <ol class="sub">
                            <li>
                                <a href="store">관람권</a>
                            </li>
                            <li>
                                <a href="store">스낵음료</a>
                            </li>
                            <li>
                                <a href="store">포토카드</a>
                            </li>
                        </ol>
                    </li>
                    <li>이벤트
                        <ol class="sub">
                            <li>
                                <a href="event_ing">진행중인 이벤트</a>
                            </li>
                            <li>
                                <a href="event_end">종료된 이벤트</a>
                            </li>
                        </ol>
                    </li>
                    <li>혜택
                        <ol class="sub">
                            <li>
                                <a href="benefit">할인정보</a>
                            </li>
                            <li>
                                <a href="benefit">CLUB 서비스</a>
                            </li>
                        </ol>
                    </li>
                </ul>
                <div class="close">닫기</div>
                <div class="img"></div>
        </div>
        <div class="popup-bg"></div>
    </header>