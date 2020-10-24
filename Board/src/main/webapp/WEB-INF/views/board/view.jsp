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
<title></title>

<script>
	function btn(cnt) {
		var form = document.hidden_form;
		if(cnt==1) {
			form.action = '<c:out value="/board/main_modify.do"/>';
		}else {
			form.action = '<c:out value="/board/main_delete.do"/>';
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
				location.reload();
			},
			error:function(data) {
				console.log(data);
			}
		});
	}

	function comment_list() {
		var comment = document.getElementById("comment_div");
		comment.style.display="none";
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
		
		<div class="text-center">
			<a href="/board/main_list.do?page=1&category=001" class="btn btn-default" >목록</a>
			<a href="#" onclick="btn(1);" class="btn btn-default">수정</a>
			<a href="#" onclick="btn(2); return 0" class="btn btn-default">삭제</a>
		</div>
		
		<div>
			<input type="button" class="btn btn-default" style="border-radius:0px" onclick="comment_list(); return false;" value="댓글"/>
		</div>
		
		<div id="comment_div" style="background:rgb(239, 247, 235); border:30px solid rgb(239,247,235)">
			<div >
				<c:forEach items="${comment_list}" var="list" varStatus="status">
					<div style="border-bottom:7px">
						<span><h3><c:out value="${list.comment_writer }"/></h3></span>
					</div>
					<div>
						<span style="word-break:break-all"><c:out value="${list.comment_content }"/></span>
					</div>
					<div style="border-bottom:1px solid black; border-top:2px">
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