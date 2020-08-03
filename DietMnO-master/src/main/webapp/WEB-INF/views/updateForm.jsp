<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<form action="update" name="update" method="POST" enctype="multipart/form-data" >
<h1>내 정보 수정</h1>
<hr>
<table class="table table-striped">
	<tr>
	 <td>이름</td>
	 <td>이메일</td>
	 <td>전화번호</td>
	 <td>주소</td>
	 <td>비밀번호 변경</td>
	 <td>프로필 변경</td>	 
	</tr>
	<tr>
		<td><input type="hidden" name="id" value="${member.id}"/>
		 <input type="text" name="name" id="name" value="${member.name}"/></td>
		<td><input type="text" name="email" id="email" value="${member.email}"/></td>
		<td><input type="text" name="phone" id="phone" value="${member.phone}"/></td>
		<td><input type="text" name="addr" id="addr" value="${member.addr}"/></td>
		<td><input type="password" name="passwd1" id="passwd1" value="${member.passwd1}"/></td>
		<td><input type="file" name="uploadFile" id="uploadFile" class="form-control"/></td>
	</tr>
		<tr><td colspan="6"><input class="btn btn-primary" id="searchBtn" type="submit" value="수정" onclick="send()"/></td></tr>
</table>
 <script>
	function send() {
		alert("프로필 변경은 로그아웃 이후 적용됩니다.");
		document.update.submit();
	
		}
  </script>

</form>
</div>
</div>
</html>
<jsp:include page="include/footer.jsp"></jsp:include>