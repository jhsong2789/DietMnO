<%@page import="com.spring.mno.ht.domain.HtVO"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="https://www.youtube.com/player_api"></script>
<%@include file="../include/header.jsp"%>
<%
	HtVO vo = (HtVO) request.getAttribute("view");
	String v = vo.getVideo();
%>
<div id="saveOK" class="alert alert-warning hidden" role="alert">글이
	수정되었습니다.</div>
<h1>홈트레이닝</h1>
<hr>
<div class="box-body">
	<span><b>글번호:</b> ${view.hbno}</span>
	<div class="form-group">
		<label for="title">Title</label> <input type="text" id="title"
			name="title" class="form-control" value="${view.title}"
			readonly="readonly" />
	</div>
	<div class="form-group">
		<label for="content">Content</label>
		<textarea name="content" id="content" class="form-control" rows="5"
			readonly="readonly">${view.content}</textarea>
	</div>

	<div class="form-group">
		<label for="writer">Writer</label> <input type="text" id="writer"
			name="writer" class="form-control" value="${view.writer}"
			readonly="readonly" />
	</div>

	<div id="youTubePlayer1"></div>
	<!-- 플레이어를 불러올 영역-->




	<%
		if (vo.getFileName() != null) {
	%>
	<div>
		<img src="/fileDownload.do?fileName=${view.fileName}" width="500px"
			height="auto" />
	</div>
	<%
		}
	%>
</div>

<div>
	<a href="/ht/listPage${cri.makeQuery()}" class="btn btn-primary">목록으로
		돌아가기</a>
	<%
		if (id.equals(vo.getWriter()) || usertype.equals("2")) {
	%>
	<a href="/ht/modify${cri.makeQuery()}&hbno=${view.hbno}"
		class="btn btn-warning">수정</a>

	<button id="btn-remove" class="btn btn-danger">삭제</button>
	<%
		}
	%>
</div>

<script>
	var tag = document.createElement('script');
	tag.src = "https://www.youtube.com/player_api";
	var firstScriptTag = document.getElementsByTagName('script')[0];
	firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

	// 플레이어변수 설정
	var youTubePlayer1;

	function onYouTubeIframeAPIReady() {
	    youTubePlayer1 = new YT.Player('youTubePlayer1', {
	        width: '1000',
	        height: '563',
	        videoId: '<%=v%>',
			playerVars : {
				rel : 0
			},//추천영상 안보여주게 설정
			events : {
				'onReady' : onPlayerReady, //로딩할때 이벤트 실행
				'onStateChange' : onPlayerStateChange
			//플레이어 상태 변화시 이벤트실행
			}
		});//youTubePlayer1셋팅
	}

	function onPlayerReady(event) {
		event.target.playVideo();//자동재생
		//로딩할때 실행될 동작을 작성한다.
	}

	function onPlayerStateChange(event) {
		if (event.data == YT.PlayerState.PLAYING) {
			//플레이어가 재생중일때 작성한 동작이 실행된다.
		}
	}

	$(document).ready(function() {
		$(".btn_play").on("click", function() {
			youTubePlayer1.playVideo();//재생
		});
		$(".btn_stop").on("click", function() {
			youTubePlayer1.stopVideo();//정지
		});
		$(".btn_pause").on("click", function() {
			youTubePlayer1.pauseVideo();//일시정지
		});
	});
</script>

<script>
	var result = '${result}';
	$(function() {
		$('#btn-remove')
				.click(
						function() {
							if (confirm("삭제하시겠습니까??")) {
								self.location.href = "/ht/delete?${cri.makeQuery()}&hbno=${view.hbno}";
							}
						});

		//수정 성공시 문구 나타났다 사라짐
		if (result === 'saveOK') {
			$('#saveOK').removeClass('hidden');
			$('#saveOK').fadeOut(2000);
		}
	})
</script>

<%@include file="../include/footer.jsp"%>
