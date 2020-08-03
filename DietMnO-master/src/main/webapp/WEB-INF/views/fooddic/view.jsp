<%@page import="com.spring.mno.fooddic.domain.FoodDicVO"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>
	<%
FoodDicVO vo=(FoodDicVO) request.getAttribute("view");
%>
<div id="saveOK" class="alert alert-warning hidden" role="alert">글이 수정되었습니다.</div>
<h1>음식사전</h1>
<hr>
<div class="box-body">
	<span><b>글번호:</b> ${view.fbno}</span>	
	<div class="form-group">
		<label for="title">Title</label>
		<input type="text" id="title" name="title" class="form-control" value="${view.title}" readonly="readonly"/>		
	</div>
	<%if(vo.getFileName()!=null) {%>
	<div>
	<img src="/fileDownload.do?fileName=${view.fileName}" width="500px" height="auto" />
	</div>
	<%} %>
	<div class="form-group">
		<label for="content">Content</label>
		<textarea name="content" id="content" class="form-control" rows="10" readonly="readonly">${view.content}</textarea>		
	</div>
	
	
</div>
	
<div>
	<a href="/fooddic/listPage${cri.makeQuery()}" class="btn btn-primary">목록으로 돌아가기</a>
	<%if(id.equals(vo.getWriter()) || usertype.equals("2") ){ %>
	<a href="/fooddic/modify${cri.makeQuery()}&fbno=${view.fbno}" class="btn btn-warning">수정</a>

	<button id="btn-remove" class="btn btn-danger">삭제</button>
	<%} %>
</div>
	
<script>
	var result = '${result}';
	$(function(){
		$('#btn-remove').click(function(){
			if(confirm("삭제하시겠습니까?")){
				self.location.href = "/fooddic/delete?${cri.makeQuery()}&fbno=${view.fbno}";
			}
		});
			
		//수정 성공시 문구 나타났다 사라짐
		if(result === 'saveOK'){
			$('#saveOK').removeClass('hidden');
			$('#saveOK').fadeOut(2000);
		}
	})
	</script>
	<%@include file="../include/footer.jsp" %>
