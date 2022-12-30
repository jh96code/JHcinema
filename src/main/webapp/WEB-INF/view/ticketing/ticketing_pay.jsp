<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JH시네마 - 예매하기(결제)</title>
	
	<!-- font-awesome 아이콘 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	
	<!-- css 파일 불러오기 -->
	<link rel="stylesheet" href="./resources/css/setup.css"/>
	<link rel="stylesheet" href="./resources/css/header.css"/>
	<link rel="stylesheet" href="./resources/css/footer.css"/>
	<link rel="stylesheet" href="./resources/css/ticketPay.css"/>
	
</head>
<body>
	<jsp:include page="../header.jsp"/>
	
	<section id="pay">
        <div class="container">
            <h1>결제하기</h1>
            <div class="pay_container">
                <form action="ticketing_success" method="post" name="ticketingPayForm">
                	<input type="text" name="seat" value="${seat}" hidden>
                	<input type="text" name="id" value="${login_id}" hidden>
                	<input type="text" name="admincheck" value="${admincheck}" hidden>
                	<input type="text" name="movieImg" value="${movieImg}" hidden>
                    <div class="info_box">
                        <div class="input_group">
                            <input type="text" name="movie" value="${movie}" readonly>
                        </div>
                        <div class="input_group">
                            <p>예매 정보</p>
                        </div>
                        <div class="input_group">
                            <input type="text" name="cinema" value="${cinema}" readonly style="width: 10%;"> 
                            <span>/</span>
                            <input type="text" name="screenTime" value="${screenTime}" readonly style="width: 15%;">
                        </div>
                        <div class="input_group">
                            <input type="date" name="screenDate" value="${date}" readonly>
                        </div>
                    </div>
                    <div class="pay_box">
                        <div class="input_pay">
                        	<span style="margin: 0px 5px 0px 0px; ">${member.name}님 /</span>
                            <input type="text" name="people" value="${people}" readonly style="width: 3%;"><span>명</span>
                        </div>
                        <div class="input_pay">
                            <div class="flex">
                                <p>금액</p>
                                <div class="right">
                                	<p class="price">${price}</p> <span>원</span>
                                </div>
                            </div>
                        </div>
                        <div class="input_pay">
                            <div class="flex">
                                <p>포인트 사용</p>
                                <div class="right border">
                                    <input type="text" name="miunsPoint" class="minusPoint" value="0" size="3"><span>원</span>
                                </div>
                            </div>
                        </div>
                        <p class="pointInfo">(내 포인트 : <span>${member.point}</span>원)</p>
                        <div class="input_pay">
                            <div class="flex">
                                <p>결제 금액</p>
                                <div class="right">
                                    <input type="text" name="price" value="${price}" class="pay_price" readonly><span>원</span>
                                </div>
                            </div>
                        </div>
                        <div class="input_pay">
                        	<div class="flex">
                        		<p class="addPointP">포인트 적립 
                        			<c:choose>
										<c:when test="${member.grade eq '브론즈'}">
									  		(${member.grade} 0.5% 적립)
									 	</c:when>
									 	<c:when test="${member.grade eq '실버'}">
									  		(${member.grade} 1.0% 적립)
									 	</c:when>
									 	<c:when test="${member.grade eq '골드'}">
									  		(${member.grade} 2.0% 적립) 
									 	</c:when>
									</c:choose>
                        		</p>
                        		<div class="right">
                        			<input type="text" name="addPoint" class="addPoint" value="" readonly size="3"><span class="addPointSpan">원</span>
                        		</div>
                        	</div>
                        </div>
                    </div>
                    <div class="button">
                        <a href="javascript:history.back()">이전</a>
                        <input type="button" value="결제" onclick="submit()">
                    </div>
                </form>
            </div>
        </div>
    </section>
    
    <jsp:include page="../footer.jsp"/>
    
    <script type="text/javascript">
	    $(document).ready(function(){ 
	        let input_addPoint = $(".input_pay .addPoint");
	        let price = $(".input_pay .price").html();
	        let grade = "${member.grade}";
	        if(grade == "브론즈"){
	        	input_addPoint.val(price * 0.005);
	        } else if(grade == "실버"){
	        	input_addPoint.val(price * 0.01);
	        } else{
	        	input_addPoint.val(price * 0.02);
	        }
	    })
	    let myPoint = $(".pointInfo span").html();
	    let input_minusPoint = $(".input_pay .minusPoint");
	    let pay_price = $(".input_pay .pay_price");
	    $(input_minusPoint).change(function(){
	    	if(myPoint >= input_minusPoint.val()){
	    		pay_price.val(pay_price.val() - input_minusPoint.val());
	    	} else{
	    		alert("포인트를 확인후 다시 입력해주세요.");
	    	}
		});
	    
	    function submit(){
	    	document.ticketingPayForm.submit();
	    }
	</script>
    
</body>
</html>