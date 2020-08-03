<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <%
Cookie[] cookies = request.getCookies(); 
    String id=null;
    String usertype="10";
for(int i = 0 ; i<cookies.length; i++){                        
	if(cookies[i].getName().equals("id")){
		 id=cookies[i].getValue();
	}
	if(cookies[i].getName().equals("usertype")){
		usertype=cookies[i].getValue();
	}
}
%>
<jsp:include page="include/header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style >
    .body{
    text-align: center;
    }
    </style>

</head>

<div class="body">

<div class="container">
<h1>식단 추천</h1>
<hr>
<form action="rec" method="POST">
<input type="radio" name="rec_category" value="1" checked="checked">잡식
<input type="radio" name="rec_category" value="2">육식
<input type="radio" name="rec_category" value="3">채식
<br>
<input class="btn btn-warning" type="submit" value="식단 추천 받기">
</form>
<br>


<form name="pay" action="pay" method="POST">
<input type="hidden" name="user" id="user" value="<%= id %>"/>
	<table class="table table-striped" border="1px solid #444444">
    <thead><th>요일</th><th>아침</th><th>점심</th><th>저녁</th><th>탄단지</th><th>칼로리</th><th>가격</th></thead>
   	 	<%int i=0; 
   	 		String[] a={"월","화","수","목","금","토","일"};
   	 	%>
   	 <c:forEach items="${recommends}" var="recommends">
		<tr>	
			<td><input type="checkbox" id="ch" name="rec_id" value="${recommends.rec_id}"><%=a[i]%></td>
			<td>${recommends.rec_food1}</td>
			<td>${recommends.rec_food2}</td>
			<td>${recommends.rec_food3}</td>
			<td>${recommends.rec_nutrient}</td>
			<td>${recommends.rec_cal}</td>
			<td>${recommends.rec_price}</td>
		</tr>
		<%i=i+1; %>
	</c:forEach>
	</table>
<input type="button" class = "btn btn-primary" id="searchBtn"  value="결제하기" onclick="sub()" >
</form>
</div>
<script >


function sub() {
	var chkbox = document.getElementsByName('rec_id');
	var chk = false; 
	for(var i=0 ; i<chkbox.length ; i++) { 
		if(chkbox[i].checked) {
			chk = true;
			break;
			} 
		}
	
	if(chk){
		document.pay.submit();
	}
	else{
		alert('추천을 받아주세요');
}
}
</script>

</div>
</html>
<jsp:include page="include/footer.jsp"></jsp:include>