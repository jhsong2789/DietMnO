<%@page import="com.spring.mno.community.domain.CommunityVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>
<%
CommunityVO vo=(CommunityVO) request.getAttribute("view");
%>

<div id="saveOK" class="alert alert-warning hidden" role="alert">글이 수정되었습니다.</div>
<div class="box-body">
	<h1>커뮤니티</h1>
	<hr>
	<span><b>글번호:</b> ${view.bno}</span>	
	<div class="form-group">
		<label for="title">Title</label>
		<input type="text" id="title" name="title" class="form-control" value="${view.title}" readonly="readonly"/>		
	</div>
	<div class="form-group">
		<label for="content">Content</label>
		<textarea name="content" id="content" class="form-control" rows="15" readonly="readonly">${view.content}</textarea>		
	</div>
	<div class="form-group">
		<label for="writer">Writer</label>
		<input type="text" id="writer" name="writer" class="form-control" value="${view.writer}" readonly="readonly"/>		
	</div>
	<%if(vo.getFileName()!=null) {%>
	<div >
	<img  src="/fileDownload.do?fileName=${view.fileName}" width="500px" height="auto" />
	</div>
	<div class="form-group">
		<label for="download">첨부파일</label> 
		<a class="form-control "
			href="/fileDownload.do?fileName=${view.fileName}">${view.fileName}</a>
	</div>
	<%} %>
</div>
	
<div>
	<a href="/community/listPage${cri.makeQuery()}" class="btn btn-primary">목록으로 돌아가기</a>
	<%if(id.equals(vo.getWriter()) || usertype.equals("2") ){ %>
	<a href="/community/modify${cri.makeQuery()}&bno=${view.bno}" class="btn btn-warning">수정</a>
	
	<button id="btn-remove" class="btn btn-danger">삭제</button>
	<%} %>
</div>
	
<script>
	var result = '${result}';
	$(function(){
		$('#btn-remove').click(function(){
			if(confirm("삭제하시겠습니까??")){
				self.location.href = "/community/delete?${cri.makeQuery()}&bno=${view.bno}";
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
