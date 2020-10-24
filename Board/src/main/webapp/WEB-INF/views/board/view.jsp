<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title></title>

<style type="text/css">
	.btn {
		border-radius: inherit !important;
	}
	.dropdown-menu {
		min-width: 50px !important;
	}
	.content_btn {
		border-bottom: 4px solid rgba(255,255,255,0);
		border-radius: 0px;
	}
	.content_btn_left {
		float: left;
		border-radius: inherit;
		border-bottom: 8px solid rgba(255,255,255,0);
	}
	
	.content_btn_right{
		float: right;
		border-radius: inherit;
		border-bottom: 8px solid rgba(255,255,255,0);
	}

	.comment_div {
		background: rgb(239,247,235);
		border: 30px solid rgba(255,255,255,0);
		clear: both;
	}
	
	.comment_div_div {
		border-bottom: 8px solid rgba(255,255,255,0);
	}

	.comment_writer_div {
		border-top:8px solid rgba(255,255,255,0);
		font-size:16px;
		font-weight: 700;
	}
	.comment_writer_span {
		float:left;
		color: rgb(138, 131, 126) !important;
	}
	.comment_writer_icon {
		float:right;
	}
	.comment_content {
		word-break: break-all;
		clear: left;
		border-top: 5px solid rgba(255,255,255,0);
		color: rgb(138, 131, 126) !important;
	}
	.comment_info {
		border-top: 3px solid rgba(255,255,255,0);
		border-bottom: 0.5px solid black;
		opacity: .5;
	}
</style>

<script>
	$(function() {
		<%
			String cmd = (String)request.getParameter("cmd");
			if(cmd !=null) {
		%>
			var comment = document.getElementById("comment_div");
			comment.style.display="block";
		<%
			} else {
		%>
			var comment = document.getElementById("comment_div");
			comment.style.display="none";
		<%
			}
		%>
	});
	function btn(cnt) {
		var form = document.hidden_form;
		if(cnt==1) {
			form.action = '<c:out value="/board/main_modify.do"/>';
		}else {
			if(confirm('삭제하시겠습니까?')) {
				form.action = '<c:out value="/board/main_delete.do"/>';
			}
		}
		form.submit();
	}

	function comment_insert() {
		$.ajax({
			url:"/board/comment_reg.do",
			type:"POST",
			data:$('#comment_form').serialize(),
			dataType:"json",
			success:function(success) {
				//location.reload();
				location.href="/board/main_view.do?board_number=1086&cmd=reload";
			},
			error:function(data) {
				console.log(data);
			}
		});
	}

	function comment_list() {
		var comment = document.getElementById("comment_div");
		if(comment.style.display=="none") comment.style.display="block";
		else comment.style.display="none";
	}

	function comment_delete(number) {
		if(confirm('댓글을 삭제하시겠습니까?')) {
			var comment_number = document.getElementById("comment_number");
			var action_url = "/board/comment_delete.do";
			comment_number.value = number;
			$.ajax({
				url: action_url,
				type:"POST",
				data:$('#comment_form').serialize(),
				dataType:"json",
				success:function(success) {
					location.href="/board/main_view.do?board_number=1086&cmd=reload";
				},
				error:function(data) {
					console.log('삭제 실패하였습니다.');
				}
			});
		}
	}
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/util/header.jsp" flush="false"/>
	<div class="container" style="max-width:700px">
		<table class="table">
			<tr>
				<td>게시판 제목</td>
				<td><c:out value="${resultVO.title}"/></td>
			</tr>
			
			<tr>
				<td>작성자</td>
				<td><c:out value="${resultVO.writer}"/></td>
			</tr>
			
			<tr>
				<td>작성 시간</td>
				<td>
					<fmt:parseDate value="${resultVO.write_date }" pattern="yyyy-MM-dd HH:mm:ss" var="date"/>
					<fmt:formatDate value="${date }" pattern="yyyy.MM.dd HH:mm:ss" var="write_date"/>
					<c:out value="${write_date }"/>
				</td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td><c:out value="${resultVO.content}"/></td>
			</tr>
		</table>
		
		<div class="content_btn">
			<div class="content_btn_left">
				<input type="button" class="btn btn-default" onclick="comment_list(); return false;" value="댓글  <c:out value='${comment_count }'/>"/>
			</div>
			<div class="content_btn_right">
				<a href="/board/main_list.do?page=1&category=001" class="btn btn-default" >목록</a>
				<a href="#" onclick="btn(1);" class="btn btn-default">수정</a>
				<a href="#" onclick="btn(2); return 0" class="btn btn-default">삭제</a>
			</div>
		</div>
		
		<div id="comment_div" class="comment_div" style="display:none">
			<div class="comment_div_div" >
				<c:forEach items="${comment_list}" var="list" varStatus="status">
					<div class="comment_writer_div">
						<div class="comment_writer_span">
							<span><c:out value="${list.comment_writer }"/></span>
						</div>
						<div class="comment_writer_icon dropdown">
							<a href="#" data-toggle="dropdown" aria-haspopup="true" role="button" aria-expanded="false" >
								<span class="glyphicon glyphicon-option-horizontal" aria-hidden="true"></span>
							</a>
							<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
								<li><a href="#">수정</a></li>
								<li><a href="#" onclick="comment_delete(<c:out value="${list.comment_number}"/>); return false;">삭제</a></li>
							</ul>
						</div>
					</div>
					<div class="comment_content">
						<span><c:out value="${list.comment_content }"/></span>
					</div>
					<div class="comment_info">
						<span><c:out value="${list.comment_date }"/></span>
					</div>
				</c:forEach>
			</div>
			<form name="comment_form" id="comment_form">
				<div class="form-group">
					<label><c:out value="${id }"></c:out></label>
					<textarea class="form-control" id="comment_content" name="comment_content" cols="20"></textarea>
				</div>
				<div class="text-right">
					<input type="hidden" name="comment_writer" value="${id }"/>
					<input type="hidden" name="board_number" value="${resultVO.board_number }"/>
					<input type="hidden" id="comment_number" name="comment_number" value="0"/>
					<input type="submit" onclick="javascipt:comment_insert(); return false;" class="btn btn-default" value="등록">
					
				</div>
				
			</form>
		</div>
		
		<form name="hidden_form" action="/board/main_modify.do" method="post">
			<input type="hidden" id="board_number" name="board_number" value="${resultVO.board_number }"/>
			<input type="hidden" id="category" name="category" value="${resultVO.category }"/>
			<input type="hidden" id="title" name="title" value="${resultVO.title }"/>
			<input type="hidden" id="writer" name="writer" value="${resultVO.writer }"/>
			<input type="hidden" id="write_date" name="write_date" value="${resultVO.write_date }"/>
			<input type="hidden" id="content" name="content" value="${resultVO.content }"/>
		</form>
	</div>
</body>
</html>