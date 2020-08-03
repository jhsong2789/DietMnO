<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="include/header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <style>
   

.memberReg {
  width: 800px;
  padding: 20px;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background: #2c3e50;
  text-align: center;
}
.memberReg div {
  width: 400px;
  display: inline-block;
  border: 0;
  margin: 0% 5px;
  text-align: center;
  font-style: initial;
  outline: none;
  color: azure;
}
.memberReg input[type="text"],
input[type="password"],
input[type="email"] {
  border: 0;
  background: none;
  display: inline-block;
  margin: 20px auto;
  text-align: center;
  border: 2px solid #3498db;
  padding: 14px 40px;
  width: 200px;
  outline: none;
  color: azure;
  border-radius: 20px;
  transition: 0.25s;
}
.memberReg input[type="text"]:focus,
input[type="password"]:focus,
input[type="email"]:focus {
  width: 280px;
  border-color: #2ecc71;
}
.memberReg input[type="submit"] {
  border: 0;
  background: none;
  display: inline block;
  margin: 20px auto;
  text-align: center;
  border: 2px solid #2ecc71;
  padding: 14px 40px;
  outline: none;
  color: azure;
  border-radius: 20px;
  transition: 0.25s;
  cursor: pointer;
}
.memberReg input[type="submit"]:hover {
  background: #2ecc71;
}
.memberReg a {
  border: 0;
  background: none;
  display: inline-block;
  margin: 20px auto;
  text-align: center;
  border: 2px solid #2ecc71;
  padding: 14px 40px;
  width: auto;
  outline: none;
  color: azure;
  border-radius: 20px;
  transition: 0.25s;
  cursor: pointer;
}
.memberReg a:hover {
  background: #2ecc71;
}

   </style>
</head>
<body>
<div class="container">
<form action="updateform" method="POST">
<h1>마이페이지</h1>
<hr>
<table class="table table-striped">
	<tr>
	 <td>아이디</td>
	 <td>이름</td>
	 <td>이메일</td>
	 <td>전화번호</td>
	 <td>주소</td>
	 <td>주민번호</td>
	</tr>
	<tr>
	
		<td><input type="hidden" name="id" value="${member.id}"/>
		${member.id}</td>
		<td>${member.name}</td>
		<td>${member.email}</td>
		<td>${member.phone}</td>
		<td>${member.addr}</td>
		<td>${member.ssn}</td>
	</tr>
		<tr><td colspan="6"><input   class="btn btn-primary" id="searchBtn" type="submit" value="수정"/></td></tr>
</table>
</form>
</div>
</body>

</html>
<jsp:include page="include/footer.jsp"></jsp:include>