<%@page import="java.util.ArrayList"%>
<%@page import="com.spring.mno.rec.domain.Recommendvo"%>
<%@page import="com.spring.mno.user.domain.MemberVO"%>
<%@page import="java.lang.reflect.Array"%>
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
<%
String name ="";
String email = "";
String phone = "";
String addr ="";
	int sum=(int)request.getAttribute("sum");
	MemberVO member=(MemberVO)request.getAttribute("member");
  name = member.getName();
    email = member.getEmail();
     phone = member.getPhone();
     addr = member.getAddr();     
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

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<div class="body">
<script>


    function pay(){
    	var IMP = window.IMP; // 생략가능
    	   IMP.init('imp34887078');  // 가맹점 식별 코드

    	   IMP.request_pay({
    	      pg : 'kakaopay', // 결제방식
    	       pay_method : 'card',	// 결제 수단
    	       merchant_uid : 'merchant_' + new Date().getTime(),
    	      name : '다이어트M&O',	// order 테이블에 들어갈 주문명 혹은 주문 번호
    	       amount :  <%=sum%>,	// 결제 금액
    	       buyer_email : "<%=email%>",	// 구매자 email
    	      buyer_name : "<%=name%>",		// 구매자 이름
    	       buyer_tel : "<%=phone%>",	// 구매자 전화번호
    	       buyer_addr : "<%=addr%>",	// 구매자 주소
    	       buyer_postcode :  '123-123',	// 구매자 우편번호  	       
    	       m_redirect_url : '/khx/payEnd.action'	// 결제 완료 후 보낼 컨트롤러의 메소드명
    	   }, function(rsp) {
    		if ( rsp.success ) { // 성공시
    			var msg = '결제가 완료되었습니다.';
    			msg += '고유ID : ' + rsp.imp_uid;
    			msg += '상점 거래ID : ' + rsp.merchant_uid;
    			msg += '결제 금액 : ' + rsp.paid_amount;
    			msg += '카드 승인번호 : ' + rsp.apply_num;
    			alert("결제가 완료되었습니다. 결제내역으로 넘어갑니다.");
    			 location.href='/paySuccess?id=<%=id%>&sum=<%=sum%>';
    		} else { // 실패시
    			var msg = '결제에 실패하였습니다.';
    			msg += '에러내용 : ' + rsp.error_msg;
    			alert(msg);
    		}
    	});
    }
    </script>
    <h1>결제</h1>
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
	<tr>
	<td colspan="3">총 가격 :</td><td colspan="3">${sum}</td>
	</tr>
	</table>
	<button id="searchBtn" class="btn btn-primary"  onclick="pay()">결제하기</button>
</div>
</html>
<jsp:include page="include/footer.jsp"></jsp:include>