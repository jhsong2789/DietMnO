<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <%
Cookie[] cookies = request.getCookies(); 
    String id=null;
    String usertype=null;
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
<form action="List" method="POST">
<h1>식단내역</h1>
<input type="hidden" name="user" id="user" value="<%= id %>"/>


<label>날짜 :</label>
<input type="date" id="date1" name="date1"/>
    <label>~</label>
   <input type="date" id="date2" name="date2"/>
   <input type="submit" class="btn btn-primary" id="searchBtn" value="조회하기">
   
	<table class="table table-striped">
    <thead><th>날짜</th><th>음식종류</th><th>음식</th><th>섭취량</th><th>섭취칼로리</th></thead>
   	<c:if test="">
   	
   	</c:if>
   	 <c:forEach items="${diet_infolist}" var="diet_infolist">
		<tr>	
			<td>${diet_infolist.dates}</td>
			<td>${diet_infolist.foodtype}</td>
			<td>${diet_infolist.foodname}</td>
			<td>${diet_infolist.eat} 그릇</td>
			<td>${diet_infolist.cal}</td>		
		</tr>
	</c:forEach>
	</table>

</form>
</div>
</div>
<script>
window.onload = function () {
	
var date=new Date().toISOString().slice(0, 10);
document.getElementById('date2').value=date;
document.getElementById('date1').value=a();
}
	

function a() {
	var d = new Date();
	 d.setTime(new Date().getTime() - (7 * 24 * 60 * 60 * 1000)); //1일전
	   return d.toISOString().slice(0, 10);
}

</script>
</html>
<jsp:include page="include/footer.jsp"></jsp:include>