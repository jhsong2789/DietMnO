<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>회원가입 양식</title>
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
  padding: 10px;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background: #2c3e50;
  text-align: center;
}

.memberReg div {
  width: 350px;
  display: inline-block;
  border: 0;
  margin: 0% 3px;
  text-align: center;
  font-style: initial;
  outline: none;
  color: azure;
}
.memberReg input[type="text"],
input[type="password"],
input[type="number"],
input[type="file"],
input[type="email"] {
  border: 0;
  background: none;
  display: inline-block;
  margin: 10px auto;
  text-align: center;
  border: 2px solid #3498db;
  padding: 10px 20px;
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
.memberReg input[type="submit"] ,
.memberReg input[type="button"] {
  border: 0;
  background: none;
  display: inline block;
  margin: 10px auto;
  text-align: center;
  border: 2px solid #2ecc71;
  padding: 14px 40px;
  outline: none;
  color: azure;
  border-radius: 20px;
  transition: 0.25s;
  cursor: pointer;
}
.memberReg input[type="submit"]:hover,
input[type="file"]:hover,
input[type="button"]:hover {
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
    <script>
    function ckeckPasswd() {
    	var passwd1=document.getElementById("passwd1");
    	var passwd2=document.getElementById("passwd2");
    	var passwdCheck=document.getElementById("passwdCheck");
    	if(passwd1.value != passwd2.value){
    		passwdCheck.innerHTML = "<font color='red'>비밀번호가 일치하지 않습니다.</font>";
    		passwd2.focus();
    		passwd2.select(); 
    	}
    	else{
    		passwdCheck.innerHTML = "";
    	}
    }
    
    function idcheck() {
    	var id=document.getElementById("id");
    	
    	var idCheck = true;
	    if(id.value!=""){
	     	<c:forEach items = "${memberlist}" var = "members">	
		    	 if("${members.id}"==id.value){
		    		 var idCheck = false;
		    		 alert(id.value+"는 사용 불가능합니다.");
		    		 id.value="";
			    	} 
			  </c:forEach> 
				  if(idCheck){
				    	alert(id.value+"는 사용 가능합니다.");
				    	document.getElementById('submit').disabled=false;
				    } 			
	    }
	    else{
	    	alert("id를 입력해주세요.");
	    }
    	
 
    
    }
    </script>
    
  </head>
  <body class="loginForm">
 
    <header>
      <nav></nav>
    </header>
    <section>
      <article>
        <form action="memberReg" name="memberReg" method="post" class="memberReg" enctype="multipart/form-data" >
          <h2>회원가입</h2>
          <hr />

          <div>아이디</div>
     
          <input type="text" name="id" id="id"  required="required"/>
        <br>  <input type="button" value="중복체크" onclick="idcheck()" />
        <br>  <div>비밀번호</div>
			<input type ="password" name= "passwd1" id="passwd1" required="required"/> 
			 <div>비밀번호 확인</div>	
			<input type ="password" name= "passwd2" id="passwd2" required="required" onblur="ckeckPasswd()"/> 
			<div id=passwdCheck></div>
          <div>이름</div>
          <input type="text" name="name" id="name"  required="required"/>
          <div>주소</div>
          <input type="text" name="addr" id="addr"  required="required"/>

          <div>전화번호</div>
          <input type="number" name="phone" id="phone"  required="required"/>

          <div>주민번호</div>
          <input type="number" name="ssn" id="ssn"  required="required"/>
          <div>이메일</div>
          <input type="email" name="email" id="email"  required="required"/>
          <br>
          <div>프로필 사진 설정</div>
          
		<label for="upload"></label> 
		<input type="file" name="uploadFile" id="uploadFile" class="form-control"/>
		
          
         <div> 
         <input type="radio" name="usertype" value="1" checked="checked"/> 사용자
		  <input type="radio" name="usertype" value="2"  /> 관리자
		  </div><br>
          <input type="submit" value="회원가입하기" id="submit" disabled="disabled" onclick="send()"/>
        	
        </form>
      </article>
    </section>
    <footer></footer>
  </body>
  <script>
	function send() {
		alert('회원가입에 성공하셨습니다.');
		document.memberReg.submit();
	
		}
  </script>
</html>
