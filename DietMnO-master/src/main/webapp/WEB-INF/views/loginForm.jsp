<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>로그인</title>
   <style>
   
  .loginForm {
  margin: 0;
  padding: 0;
  font-family: sans-serif;
  background: #34495e;
}

/* form공통 */
.login_box {
  width: 800px;
  padding: 60px;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background: #2c3e50;
  text-align: center;
}

.login_box input[type="text"],
.login_box input[type="password"] {
  border: 0;
  background: none;
  display: block;
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
.login_box input[type="submit"] {
  border: 0;
  background: none;
  display: block;
  margin: 20px auto;
  text-align: center;
  border: 2px solid #2ecc71;
  padding: 14px 40px;
  width: 200px;
  outline: none;
  color: azure;
  border-radius: 20px;
  transition: 0.25s;
  cursor: pointer;
}
.login_box h1 {
  color: white;
  text-transform: uppercase;
  font-weight: 500;
  font-size: 50px;
}
.login_box input[type="text"]:focus,
.login_box input[type="password"]:focus {
  width: 280px;
  border-color: #2ecc71;
}
.login_box input[type="submit"]:hover {
  background: #2ecc71;
}
.login_box a:hover {
  background: #f6d55c;
}
.login_box a {
  border: 0;
  background: none;
  display: inline-block;
  margin: 0;
  text-align: center;
  border: 2px solid #f1c40f;
  padding: 0;
  width: 120px;
  outline: none;
  color: azure;
  border-radius: 20px;
  transition: 0.25s;
}
.findPw {
  width: 600px;
  padding: 40px;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background: #2c3e50;
  text-align: center;
}
.findPw div {
  width: 200px;
  display: inline-block;
  border: 0;
  margin: 0% 5px;
  text-align: center;
  font-style: initial;
  outline: none;
  color: azure;
}
.findPw input[type="text"] {
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
.findPw input[type="text"]:focus {
  width: 280px;
  border-color: #2ecc71;
}
.findPw input[type="submit"] {
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
.findPw input[type="submit"]:hover {
  background: #2ecc71;
}
.findPw a {
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
.findPw a:hover {
  background: #2ecc71;
}
.findPw select {
  border: 0;
  background: none;
  display: inline-block;
  margin: 20px auto;
  text-align: center;
  border: 2px solid #3498db;
  padding: 14px 40px;
  width: 280px;
  outline: none;
  color: azure;
  border-radius: 20px;
  transition: 0.25s;
}
.findPw select:hover {
  background: #2ecc71;
}
.findPw option {
  color: black;
  text-align: center;
  background: #95a5a6;
  outline: none;
  margin: 20px auto;
  width: auto;
}
.findPw_result {
  width: 600px;
  padding: 40px;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background: #2c3e50;
  text-align: center;
}
.findPw_result div {
  border: 0;
  background: none;
  display: block;
  margin: 20px auto;
  text-align: center;
  padding: 14px 40px;
  width: 280px;
  outline: none;
  color: azure;
}
.findPw_result div > span {
  color: #f39c12;
}

.findPw_result a {
  border: 0;
  background: none;
  display: block;
  margin: 20px auto;
  text-align: center;
  border: 2px solid #2ecc71;
  padding: 14px 40px;
  width: 280px;
  outline: none;
  color: azure;
  border-radius: 20px;
  transition: 0.25s;
  cursor: pointer;
}
.findPw_result a:hover {
  background: #2ecc71;
}
/*  */

.memberReg {
  width: 600px;
  padding: 40px;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background: #2c3e50;
  text-align: center;
}
.memberReg div {
  width: 200px;
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
  <body class="loginForm">
    <header></header>
    <nav></nav>
    <section>
      <article>
        <form class="login_box" action="login" method="post">
          <h1>로그인</h1>
          <hr>
          <input type="text" name="id" id="id" required="required" placeholder="userId" />
          <input type="password" name="passwd1" id="passwd1" required="required" placeholder="userPw" />
          <input type="submit" value="로그인"/>
          <a href="memberRegform">회원가입하기</a>
          <a href="findidform">아이디 찾기</a>
          <a href="findpwform">비밀번호 찾기</a>
            
        </form>
       <c:if test="${loginSuccess eq 'false'}">
        	<script>alert("로그인 실패");</script>
       </c:if>
      </article>
    </section>
    <footer></footer>
  </body>
</html>
