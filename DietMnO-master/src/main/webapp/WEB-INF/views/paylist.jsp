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


<form action="paylist" method="POST">
<h1>결제 내역</h1>
<hr>
<input type="hidden" name="user" id="user" value="<%= id %>"/>
<label>날짜 :</label>
<input type="date" name="date1" id="date1" />
    <label>~</label>
   <input type="date" name="date2" id="date2" />
   <input type="submit"  class="btn btn-primary" id=searchBtn" value="조회하기">
	<table class="table table-striped">
   <thead><th>날짜</th><th>가격</th><th></th></thead>
 
	 <c:forEach items="${paylist}" var="paylist">
		<tr>	
			<td>${paylist.paylist_date}</td>
			<td>${paylist.paylist_price}</td>			
			<td><a href="pay1?id=${paylist.paylist_orderlist}" onclick="window.open(this.href, '_blank', 'width=1000px,height=400px,toolbars=no,scrollbars=no'); return false;">상세 내역 보기</a> </td>
		</tr>
	</c:forEach>
	</table>
	
</form>
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