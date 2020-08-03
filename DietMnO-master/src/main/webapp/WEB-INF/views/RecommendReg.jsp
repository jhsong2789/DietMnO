<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <%
Cookie[] cookies = request.getCookies(); 
    String id="";
    String usertype="";
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
 <%if(!(usertype.equals("2")) ){ %>
  <script>
location.href='/';
</script>
  <%} %>

<div class="container">
	<form action="recReg" name="recReg" id="recReg">
	<h1>식단등록</h1>
	<hr>
	<table class="table table-striped">
	<tr>
	<td>아침식단 </td>
	<td>점심식단 </td>
	<td>저녁식단 </td>
	</tr>
	<tr>
	<td><textarea name="Rec_food1" cols="20px" rows="10px"  required="required"></textarea></td>
	<td><textarea name="Rec_food2" cols="20px" rows="10px"  required="required"></textarea></td>
	<td><textarea name="Rec_food3" cols="20px" rows="10px"  required="required"></textarea></td>
	</tr>
	<tr><td>탄단지 영양</td> <td colspan="2"><input type="text" name="Rec_nutrient"  required="required"/></td></tr>
	<tr><td>칼로리 </td><td colspan="2"><input type="text" name="Rec_cal"  required="required"/></td></tr>
	<tr><td>가격 </td><td colspan="2"><input type="number" name="Rec_price"  required="required"/>원</td></tr>
	<tr><td>식단 카테고리</td><td colspan="2"> 
	<input type="radio" name="Rec_category" value="1">잡식
	<input type="radio" name="Rec_category" value="2">육식
	<input type="radio" name="Rec_category" value="3">채식
	</td></tr>
	<tr><td colspan="3"><input  class = "btn btn-primary" id="searchBtn"  type="button" onclick="send()" value="전송"/></td></tr>
	</table> 
	</form>
</div>	
</div>
<script>
function send() {
	alert('저장완료');
	document.recReg.submit();
}
</script>

</html>
<jsp:include page="include/footer.jsp"></jsp:include>