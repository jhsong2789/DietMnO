<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp" %>
<form role="form" method="post">
	<h1>커뮤니티</h1>
	<hr>
	<div class="box-body">
		<span><b>글번호:</b> ${view.bno}</span>
		<input type="hidden" name="bno" value="${view.bno }" />
		
		<!-- page와 perPageNum  추가 -->
		<input type="hidden" name="page" value="${cri.page}" />
		<input type="hidden" name="perPageNum" value="${cri.perPageNum}" />
			
			
		<div class="form-group">
			<label for="title">제목</label>
			<input type="text" id="title" name="title" class="form-control" value="${view.title}"/>		
		</div>
			
		<div class="form-group">
			<label for="content">내용</label>
			<textarea name="content" id="content" class="form-control" rows="3" >${view.content}</textarea>		
		</div>
			
		<div class="form-group">
			<label for="writer">작성자</label>
			<input type="text" id="writer" name="writer" class="form-control" value="${view.writer}" readonly="readonly"/>		
		</div>	
	</div>
	<div>
		<button type="submit" class="btn btn-primary">수정</button>
		<a href="/community/view${cri.makeQuery()}&bno=${view.bno}" class="btn btn-danger">취소</a>
	</div>		
</form>

<%@include file="../include/footer.jsp" %>
