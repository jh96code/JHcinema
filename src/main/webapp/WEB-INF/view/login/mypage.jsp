<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JH시네마 - 마이페이지</title>
	
	<!-- font-awesome 아이콘 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	
	<!-- css 파일 불러오기 -->
	<link rel="stylesheet" href="./resources/css/setup.css"/>
	<link rel="stylesheet" href="./resources/css/header.css"/>
	<link rel="stylesheet" href="./resources/css/footer.css"/>
	<link rel="stylesheet" href="./resources/css/mypage.css"/>
	
</head>
<body>
	<jsp:include page="../header.jsp"/>	

	<section id="mypage">
        <div class="container">
            <div class="box">
                <h1>마이페이지</h1>
                <ul class="list">
                    <li>
                        <i class="fas fa-user"></i>
                        <p class="text">
                            안녕하세요 ${member.id}님 <br>
                            <c:choose>
								<c:when test="${member.grade eq '브론즈'}">
							  		브론즈등급 ㅣ 0.5% 적립
							 	</c:when>
							 	<c:when test="${member.grade eq '실버'}">
							  		실버등급 ㅣ 1.0% 적립
							 	</c:when>
							 	<c:when test="${member.grade eq '골드'}">
							  		골드등급 ㅣ 2.0% 적립 
							 	</c:when>
							</c:choose>
                        </p>
                    </li>
                    <li>
                    	<a onclick="mypage_point()">
	                        <div class="name">적립금 ></div>
	                        <div class="sub">${member.point}원</div>
                        </a>
                    </li>
                    <li>
                        <%
				            String admincheck = (String) session.getAttribute("admincheck");
		                	if(admincheck == "true"){
						%>
		                	<a href="contact_admin">
		                		<div class="name">1:1문의 내역 ></div>
                            	<div class="sub">${contactCnt}개</div>
		                	</a>
		                <%	} else{ %>
		                	<a href="contact_customer?id=${login_id}">
		                		<div class="name">1:1문의 내역 ></div>
                            	<div class="sub">${contactCnt}개</div>
		                	</a>
		                <% 	} %>
                            
                    </li>
                </ul>
            </div>
            <div class="tap_box">
                <div class="left">
                    <ul class="tap_btn">
                        <li>
                            <a>
                                <div class="flex">
                                    <div class="name">개인정보 수정</div>
                                    <div class="arrow">></div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a>
                                <div class="flex">
                                    <div class="name">영화예매 내역</div>
                                    <div class="arrow">></div>
                                </div>
                            </a>
                        </li>
                        <li>
							<a href="FAQ">
                                <div class="flex">
                                    <div class="name">고객센터</div>
                                    <div class="arrow">></div>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="right">
                    <div class="user_info">
                        <div class="flex">
                            <h2>개인정보 수정</h2>
                            <button type="button" class="delete_btn" onclick="deleteMember();">회원탈퇴</button>
                        </div> 
                        <form name="updateMemberForm" class="form"  action="updateMember" method="post">
                            <div class="form-group">
                                <h3>아이디</h3>
                                <div class="input-box">
                                    <input name="id" type="text" class="form-control readonly" value="${member.id}" readonly>
                                </div>
                            </div>
                            <div class="form-group">
                                <h3>비밀번호 변경</h3>
                                <div class="input-box">
                                    <input name="password" type="password" class="form-control" placeholder="영문, 숫자, 특수문자 조합 8~20자리" >
                                </div>
                            </div>
                            <div class="form-group">
                                <h3>비밀번호 변경 재확인</h3>
                                <div class="input-box">
                                    <input name="password_confirm" type="password" class="form-control" placeholder="비밀번호를 한 번 더 입력해주세요." >
                                </div>
                            </div>
                            <div class="form-group">
                                <h3>이름</h3>
                                <div class="input-box">
                                    <input name="name" type="text" class="form-control" value="${member.name}">
                                </div>
                            </div>
                            <div class="form-group">
                                <h3>성별</h3>
                                <div class="input-box">
                                    <input name="gender" type="text" class="form-control readonly" placeholder="${member.gender}" readonly>
                                </div>
                            </div>
                            <div class="form-group">
                                <h3>생일</h3>
                                <div class="input-box">
                                    <input type="text" name="year" class="form-control readonly" placeholder="${member.birth}">
                                </div>
                            </div>
                            <div class="form-group">
                                <h3>전화번호</h3>
                                <div class="input-box">
                                    <input name="phone" type="text" class="form-control" value="${member.phone}" >
                                </div>
                            </div>
                            <div class="form-group" style="min-height: 105px">
                                <h3>주소</h3>
                                <div class="input-box">
                                    <input type="text" class="readonly" id="postcode" name="postcode" value="${member.postcode}" size="9" readonly style="margin-bottom: 5px; padding: 1px 5px;"> 
                                    <button type="button" class="input-btn" onclick="findAddr()">주소 검색</button> <br>
                                    <input type="text" class="form-control readonly" id="address" name="address" value="${member.address}" readonly style="margin-bottom: 5px;"> <br>
                                    <input type="text" class="form-control" id="detailAddress" name="detailAddress" value="${member.detailAddress}">
                                </div>
                            </div>
                            <div class="form-group">
                                <h3>이메일</h3>
                                <div class="input-box">
                                    <input type="text" name="mail" class="form-control" value="${member.mail}"> 
                                </div>
                            </div>
                            <div class="form-group">
                                <h3>가입날짜</h3>
                                <div class="input-box">
                                    <input name="gender" type="text" class="form-control readonly" placeholder="${member.regist_day}" readonly>
                                </div>
                            </div>
                            <button type="button" class="submit" onclick="validate();">수정하기</button>
                        </form>
                    </div>
                    <div class="ticketing_info">
                        <h2>영화예매 내역 <span> 영화예매 내역 조회가 가능합니다.</span></h2>
                        <ul class="list">
                        	<c:forEach var="ticketingList" items="${ticketingList}" varStatus="status">
	                        	<li>
	                        		<div class="flex">
	                        			<div class="left">
			                        		<div class="img" style="background-image: url(./resources/img/movie/${ticketingList.movieImg});"></div>
			                        		<div class="text">
			                        			<p class="title">${ticketingList.movie}</p>
			                        			<p class="sub_title">예매내용</p>
			                        			<p class="sub">${ticketingList.screenDate} <span>/</span> ${ticketingList.screenTime}</p>
			                        			<p class="sub">JH시네마 ${ticketingList.cinema}점 <span>/</span> 좌석: ${ticketingList.seat}</p>
			                        		</div>
		                        		</div>
		                        		<p class="price">${ticketingList.people}명 <br><span>(${ticketingList.price})원</span></p>
	                        		</div>
	                        	</li>
                        	</c:forEach>
                        </ul>
		                <c:choose>
			                <c:when test="${empty ticketingList}">
			  					<p class="empty">영화예매 내역이 존재하지 않습니다.</p>
	  						</c:when>
  						</c:choose>
                    </div>
                </div>
            </div>
        </div>
    </section>

	<jsp:include page="../footer.jsp"/>
	
	<!-- 자바스크립트 파일 불러오기 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="./resources/js/mypage.js"></script>
    <script type="text/javascript">
  		/* 마이페이지 - 포인트내역 페이지 열기 */
	    function mypage_point(){
	    	window.open("mypage_point?id=${login_id}", "", "width=500, height=500 left=700, top=300");
	    }
    </script>
    
</body>
</html>