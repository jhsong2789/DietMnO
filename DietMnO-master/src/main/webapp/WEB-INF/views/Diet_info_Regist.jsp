<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <% Date date; %>
    <jsp:include page="include/header.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    
    <style >
    .body{
    text-align: center;
    }
    </style>
    </head>
    


   <div class="body">
    <div class="container">
<form name="Diet_info_Regist" action="Diet_info_Regist" method="POST">
<h1>식단등록</h1>
<hr>
<input type="hidden" name="user" id="user" value="<%= id %>"/>
<table class="table table-striped">
<tr>
<td><label>날짜 :</label></td>
  <td colspan="4"><input name="dates" id="dates" type="datetime-local"  /></td>
</tr>
<tr>
<td><label>음식 종류: </label></td>
<td colspan="4"><select class="form-control" name="foodtype" id="ft" onchange="ch()">
   	<option value="">음식 종류선택</option>
    <option value="한식">한식</option>
    <option value="중식">중식</option>
    <option value="일식">일식</option>
    <option value="양식">양식</option>
    </select></td>
</tr>
<tr>
    <td><label>음식 : </label></td>
    <td colspan="4">
    	<select  class="form-control"name="foodname" id="fn">
   <option value="김치찌개">김치찌개</option>
    <option value="된장찌개">된장찌개</option>
    <option value="순두부찌개">순두부찌개</option> 
        </select></td>
    </tr>
    <tr>
        <td><label>섭취량: </label></td>
        <td colspan="4">
        	<select  class="form-control btn btn-default dropdown-toggle" name="eat" >
            <option value="0.25">1/4</option>
            <option value="0.33">1/3</option>
            <option value="0.5">1/2</option>
            <option value="1">1</option>
            </select> 그릇</td>
        </tr>
        <tr>
        <td colspan="5"> <input type="button" class="btn btn-primary" value="등록"  id="searchBtn"  onclick="send()"/></td>
        </tr>
</table>
<input type="hidden" id="cal" name="cal" value="">
<script >
function ch() {
	var ft=document.getElementById('ft');
	var fn=document.getElementById('fn');
	var cal=document.getElementById('cal');
	fn.innerHTML = ""; 
    if(ft.value == "한식") { 
    	fn.innerHTML +=
    '<option value="'+ "김치찌개" +'">'+"김치찌개" +'</option>' +
    '<option value="'+ "된장찌개" +'">'+"된장찌개" +'</option>' +
    '<option value="'+ "순두부찌개" +'">'+"순두부찌개" +'</option>' 
    	}
    if(ft.value == "중식") { 
    	fn.innerHTML +=
    '<option value="'+ "짜장면" +'">'+"짜장면" +'</option>' +
    '<option value="'+ "짬뽕" +'">'+"짬뽕" +'</option>' +
    '<option value="'+ "경장육사" +'">'+"경장육사" +'</option>' 
    	}
    if(ft.value == "일식") { 
    	fn.innerHTML +=
    '<option value="'+ "초밥" +'">'+"초밥" +'</option>' +
    '<option value="'+ "오코노미야끼" +'">'+"오코노미야끼" +'</option>' +
    '<option value="'+ "소바" +'">'+"소바" +'</option>' 
    	}
    if(ft.value == "양식") { 
    	fn.innerHTML +=
    '<option value="'+ "비프스튜" +'">'+"비프스튜" +'</option>' +
    '<option value="'+ "까느보나라 파스타" +'">'+"까느보나라 파스타" +'</option>' +
    '<option value="'+ "토마토 파스타" +'">'+"토마토 파스타" +'</option>' 
    	}
    
    switch (fn.value) {
	case "김치찌개":	
		cal.value ="240";
		break;
	case "된장찌개":	
		cal.value ="250";
		break;
	case "순두부찌개":	
		cal.value ="260";
		break;
	case "짜장면":	
		cal.value ="270";
		break;
	case "짬뽕":	
		cal.value ="280";
		break;
	case "경장육사":	
		cal.value ="290";
		break;
	case "초밥":	
		cal.value ="300";
		break;
	case "오코노미야끼":	
		cal.value ="310";
		break;
	case "소바":	
		cal.value ="320";
		break;
	case "비프스튜":	
		cal.value ="330";
		break;
	case "까느보나라 파스타":	
		cal.value ="340";
		break;
	case "토마토 파스타":	
		cal.value ="350";
		break;

	default:
		break;
	}  
    
}


function send() {
	var ft=document.getElementById('ft');
	if(ft.value == ""){
		alert('음식종류를 선택해주세요');
	}
	else{
	alert('저장완료');
	document.Diet_info_Regist.submit();
	}
}
window.onload = function () {

	document.getElementById('dates').value=new Date().toISOString().slice(0, 16);
	}	
</script>
</form>
</div>
</div>
</html>
<jsp:include page="include/footer.jsp"></jsp:include>