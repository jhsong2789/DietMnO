<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
.login_box input[type="number"] ,
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
.login_box h3 {
  color: white;
  text-transform: uppercase;
  font-weight: 500;
  font-size: 30px;
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
@import url(https://fonts.googleapis.com/css?family=BenchNine:700);
.snip1535 {
  background-color: #c47135;
  border: none;
  color: #ffffff;
  cursor: pointer;
  display: inline-block;
  font-family: 'BenchNine', Arial, sans-serif;
  font-size: 1em;
  font-size: 22px;
  line-height: 1em;
  margin: 15px 40px;
  outline: none;
  padding: 12px 40px 10px;
  position: relative;
  text-transform: uppercase;
  font-weight: 700;
}
.snip1535:before,
.snip1535:after {
  border-color: transparent;
  -webkit-transition: all 0.25s;
  transition: all 0.25s;
  border-style: solid;
  border-width: 0;
  content: "";
  height: 24px;
  position: absolute;
  width: 24px;
}
.snip1535:before {
  border-color: #c47135;
  border-right-width: 2px;
  border-top-width: 2px;
  right: -5px;
  top: -5px;
}
.snip1535:after {
  border-bottom-width: 2px;
  border-color: #c47135;
  border-left-width: 2px;
  bottom: -5px;
  left: -5px;
}
.snip1535:hover,
.snip1535.hover {
  background-color: #c47135;
}
.snip1535:hover:before,
.snip1535.hover:before,
.snip1535:hover:after,
.snip1535.hover:after {
  height: 100%;
  width: 100%;
}
   </style>
    <title>비밀번호 찾기</title>
    <script>
      function pwfind() {
    	var id=document.getElementById("id");
    	var name=document.getElementById("name");
      	var ssn=document.getElementById("ssn");
      	var ch=true;
  	      	 if(name.value=="" || ssn.value=="" || id.value==""){
  	      		alert("재대로 입력해주세요");  		 
  	      	 }
  	      	 else{
	      			 <c:forEach items = "${memberlist}" var = "members">	
	  		    	  if("${members.name}"==name.value && "${members.ssn}"==ssn.value && "${members.id}"==id.value){
	  		    		alert("비밀번호는 "+"${members.passwd1}"+" 입니다");
	  		    		ch=false;
		  			 }   
	  			   </c:forEach>    
  					if(ch){
  						alert("확인된 정보가 없습니다.");  		 
  					}
  	      	 } 	 
  	    }
      </script>
   
  </head>
  <body class="loginForm">
  
   <div class="login_box">
    <section>
      <article>
        <h1>비밀번호 찾기</h1>
        
         
          <hr/>
          
          <h3>id</h3>
          <input type="text" name="id" id="id" />
          <h3>이름</h3>
          <input type="text" name="name" id="name" />
          <h3>주민번호</h3>
          <input type="number" name="ssn" id="ssn" />
         <button type="button" class="snip1535" id="searchBtn"  onclick="pwfind()" >확인</button>
       <br><br>
         <button type="button" class="snip1535" onClick="location.href='loginform'" >돌아가기</button>
      
      </article>
      
      <script>
      </script>
    </section>
    </div>
  </body>
</html>
