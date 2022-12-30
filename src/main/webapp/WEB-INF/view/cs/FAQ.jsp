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
                    <li class="view">
                    	<a href="FAQ">FAQ</a>
                    </li>
                    <li>
                    	<a href="notice">공지사항</a>
                    </li>
                    <li>
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
            <div id="faq" class="tap_box">
            	<div class="search">
		        	<form action="FAQ" method="post">
						<select name="items_FAQ">
							<option value="title">제목</option>
							<option value="content">내용</option>
						</select> 
						<input name="text_FAQ" type="text" placeholder="검색어를 입력해주세요." size="50"> 
						<input type="submit" value="검색">
					</form>
		        </div>
                <table>
                    <tbody>
                    	<c:choose>
							<c:when test="${not empty FAQList}">
		  						<tr>
			                    	<th style="width: 20%;">구분</th>
			                    	<th style="width: 80%;">질문</th>
			                    </tr>
  							</c:when>
  						</c:choose>
                    	<c:forEach var="FAQList" items="${FAQList}" varStatus="status">
	                        <tr class="faq">
	                            <td>${FAQList.category}</td>
	                            <td>
	                                <div class="flex">
	                                    <p><span>Q</span> ${FAQList.title}</p>
	                                    <i class="fas fa-chevron-down"></i>
	                                </div>
	                            </td>
	                        </tr>
	                        <tr class="faq_reply">
	                            <td></td>
	                            <td align="left">
	                                <p><span>A</span> ${FAQList.content}</p>
	                            </td>
	                        </tr>
  						</c:forEach>
  						<c:choose>
							<c:when test="${empty FAQList}">
		  						<tr>
		  							<th colspan="2" style="padding: 100px 0px;">검색 결과가 없습니다.</th>
		  						</tr>
  							</c:when>
  						</c:choose>
                    </tbody>
                </table>
                <br><br><br>
                <c:set var="pageNum_FAQ" value="${pageNum_FAQ}" />
				<c:forEach var="i" begin="1" end="${total_page_FAQ}">
					<a href="<c:url value="/FAQ?pageNum_FAQ=${i}" /> ">
						<c:choose>
							<c:when test="${pageNum_FAQ==i}">
								<b> [${i}]</b>
							</c:when>
							<c:otherwise>[${i}]</c:otherwise>
						</c:choose>
					</a>
				</c:forEach>
				<%
                	if(admincheck == "true"){
				%>
                	<a href="addFAQ" class="button">등록하기</a>
                <%	} %>
            </div>
        </div>
    </section>
	
	<jsp:include page="../footer.jsp"/>
	
	<!-- 자바스크립트 파일 불러오기 -->
    <script src="./resources/js/cs.js"></script>
    <script type="text/javascript">
	    function loginCheck() {	
			if (${login_id==null}) {
				alert("로그인 해주세요.");
				location.href = "login"
				return false;
			}
		}
	</script>
    
</body>
</html>