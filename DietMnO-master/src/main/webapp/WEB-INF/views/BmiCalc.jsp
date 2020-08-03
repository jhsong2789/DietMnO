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
<jsp:include page="include/header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>

	<meta charset="utf-8">
	<title> Am I fat? </title>
	
 <style >
    .body{
    text-align: center;
    }
    </style>
</head>

<div class="body">
 <div class="container">
<form name="bmiform" action="BmiCalcs" method = "post">
<h1>BMI 계산</h1>
<hr>
	<div>
	<h2> 당신의 표준체중과 체질량지수(BMI)는? </h2>
	<br>
	<input type="hidden" name="userid" id="userid" value="<%= id %>"/>
	<input type="number" name="weight" id="weight"  placeholder="몸무게"> kg
	<br>
	<input type="number" name="height" id="height"  placeholder="키"> cm
	<br><br>
	<input type="button" class="btn btn-primary" id=searchBtn" value="계산하기"  onclick="bmicalc()"/>
	<br>
	</div>

		<div id="bmi2" style="display:none;">
		<h3 id="bmih3">나의 신체질량지수(BMI)</h3>
		<label id="bmila"></label><br>
		<img src="/resources/bmi.png" width="1000px" height="auto">
		<br>
		<input type="submit" class="btn btn-primary" id="submit" value="저장하기" onclick="send()" disabled="disabled"/>
	</div>
	
</form>
	
	<script>
		function send() {
		alert('저장완료');
		document.bmiform.submit();
	
		}
	
		function bmicalc(){
			var w = weight.value;
			var h = height.value;
			document.getElementById('submit').disabled=false;
			 if(w.length==0 || w.length>3) {
				alert('몸무게를 옳바르게 입력하세요');
				}
			else if(h.length<3 || h.length>3) {
				alert('키를 옳바르게 입력하세요');
				}
			else{ 
			var img=document.getElementById('bmi2');
				img.style.display="block";
				standardWeight(w,h)	;
			}
		}

	

	function standardWeight(w, h){

		var bmila = document.getElementById('bmila');
		var bmi = w / (h*h / 10000);
		bmila.innerHTML=bmi.toFixed(2)+"%";
		
}


	</script>
	</div>
</div>

</html>
<jsp:include page="include/footer.jsp"></jsp:include>