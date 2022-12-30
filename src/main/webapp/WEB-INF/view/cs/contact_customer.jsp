<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JH시네마 - 고객센터</title>
	
	<!-- font-awesome 아이콘 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	
	<!-- css 파일 불러오기 -->
	<link rel="stylesheet" href="./resources/css/setup.css"/>
	<link rel="stylesheet" href="./resources/css/header.css"/>
	<link rel="stylesheet" href="./resources/css/footer.css"/>
	<link rel="stylesheet" href="./resources/css/cs.css"/>
	
</head>
<body>
	<jsp:include page="../header.jsp"/>
	
	<section id="section02">
        <div class="container">
            <div class="head">
                <h1>고객센터</h1>
                <ul class="title">
                    <li>
						<a href="FAQ">FAQ</a>
					</li>
                    <li>
                    	<a href="notice">공지사항</a>
                    </li>
                    <li class="view">
                    	<%
				            String admincheck = (String) session.getAttribute("admincheck");
		                	if(admincheck == "true"){
						%>
		                	<a href="contact_admin">1:1문의</a>
		                <%	} else if(admincheck == "false"){ %>
		                	<a href="contact_customer?id=${login_id}">1:1문의</a>
		                <% 	} else{ %>
		                	<a href="#" onclick="loginCheck();">1:1문의</a>
		                <%  } %>
                    </li>
                </ul>
            </div>
            <br><br><br>
            <div id="OneToOne" class="tap_box">
                <table>
                    <tbody>
                        <tr>
                            <th style="width: 20%;">아이디</th>
                            <th style="width: 50%;">제목</th>
                            <th style="width: 15%;">등록일</th>
                            <th style="width: 15%;">답변일</th>
                        </tr>
                        <c:forEach var="contactList" items="${contactList}" varStatus="status">
	                        <tr class="contact">
	                            <td>${contactList.cus_id}</td>
	                            <td align="left">${contactList.title}</td>
	                            <td>${contactList.regist_day}</td>
	                            <td>${contactList.reply_day}</td>
	                        </tr>
	                        <tr class="contact_reply">
	                            <td colspan="5">
	                            	<div class="reply_group">
	                            		<div class=name>문의 유형</div> 
	                            		<div class="sub">${contactList.category}</div>
									</div> <br>
									<div class="reply_group"> 
										<div class=name>문의 내용</div> 
										<div class="sub">${contactList.content}</div>
									</div> <br><br><hr><br><br>
									<c:choose>
										<c:when test="${empty contactList.reply_day}">
											<h3>아직 답변이 등록되지 않았습니다.</h3><br>
										</c:when>
										<c:otherwise>
											<div class="reply_group">
			                            		<div class=name>답변자 아이디</div> 
			                            		<div class="sub">${contactList.admin_id}</div>
											</div> <br>
											<div class="reply_group">
			                            		<div class=name>답변 내용</div> 
			                            		<div class="sub">${contactList.reply}</div>
											</div> <br>
										</c:otherwise>
									</c:choose>
									<a href="deleteContact?num=${contactList.num}&cus_id=${login_id}" class="delete">삭제하기</a>
	                            </td>
	                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <a href="addContact" class="button">문의하기</a>
            </div>
        </div>
    </section>
	
	<jsp:include page="../footer.jsp"/>
	
	<!-- 자바스크립트 파일 불러오기 -->
    <script src="./resources/js/cs.js"></script>
    
</body>
</html>