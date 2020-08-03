<%@page import="java.util.ArrayList"%>
<%@page import="com.spring.mno.rec.domain.Recommendvo"%>
<%@page import="com.spring.mno.user.domain.MemberVO"%>
<%@page import="java.lang.reflect.Array"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<style >
    .body,.table table-striped{
    text-align: center;
    }
    </style>
</head>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<div class="body">
<h1>상세 주문 내역</h1>
<hr>
 <table class="table table-striped">
    <thead><th>아침</th><th>점심</th><th>저녁</th><th>탄단지</th><th>칼로리</th><th>가격</th></thead>
   	 <c:forEach items="${recommends}" var="recommends">
		<tr>	
			<td>${recommends.rec_food1}</td>
			<td>${recommends.rec_food2}</td>
			<td>${recommends.rec_food3}</td>
			<td>${recommends.rec_nutrient}</td>
			<td>${recommends.rec_cal}</td>
			<td>${recommends.rec_price}</td>
		</tr>
	</c:forEach>
	</table>
	<c:if test="${not empty member}">
	<label>아이디 : </label>${member.id} 
	<label>이름 : </label>${member.name}
	<label>이메일 : </label>${member.email}
	<label>전화번호 : </label>${member.phone}
	<label>주소 : </label>${member.addr}
	<br>
	</c:if>
	<input type="button" class="btn btn-primary" id="searchBtn"  value="창닫기" onClick="window.close()">
</div>
</html>