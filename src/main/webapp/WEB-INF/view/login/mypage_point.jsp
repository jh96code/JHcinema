<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JH시네마 - 포인트 내역</title>

	<!-- css 파일 불러오기 -->
	<link rel="stylesheet" href="./resources/css/setup.css"/>
	<link rel="stylesheet" href="./resources/css/mypage_point.css"/>
	
	<style>
		#point .list{
			counter-reset: list-number ${cnt + 1};
		}
	</style>
	
</head>
<body>

	<section id="point">
		<div class="container">
			<h1>포인트 내역 <span>포인트 내역 조회가 가능합니다.</span></h1>
			<ol class="list" reversed>
				<c:forEach var="pointList" items="${pointList}" varStatus="status">
					<li>
						<div class="box">
							<div class="flex">
								<p class="point">
									${pointList.point} 원
									<c:if test="${pointList.minusPoint eq 0}"><span>(+${pointList.addPoint})</span></c:if>
									<c:if test="${pointList.addPoint eq 0}"><span>(-${pointList.minusPoint})</span></c:if>
								</p>
								<p class="memo">
									${pointList.memo}<span> (${fn:substringBefore(pointList.regist_day, ' ')})</span>
								</p>
								
							</div>
						</div>
					</li>
				</c:forEach>
			</ol>
		</div>
    </section>
    
</body>
</html>