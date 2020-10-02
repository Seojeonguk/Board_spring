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
		var form = document.form;
		if(cnt==1) {
			form.action = '<c:out value="/board/modify.do"/>';
		}else {
			form.action = '<c:out value="/board/delete.do"/>';
		}
		form.submit();
	}
</script>
</head>
<body>
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
			<a href="/board/list.do?page=1" class="btn btn-default" >목록</a>
			<a href="#" onclick="btn(1);" class="btn btn-default">수정</a>
			<a href="#" onclick="btn(2); return 0" class="btn btn-default">삭제</a>
		</div>
		
		<form name="form" action="/board/modify.do" method="post">
			<input type="hidden" id="board_number" name="board_number" value="${resultVO.board_number }"/>
			<input type="hidden" id="title" name="title" value="${resultVO.title }"/>
			<input type="hidden" id="writer" name="writer" value="${resultVO.writer }"/>
			<input type="hidden" id="write_date" name="write_date" value="${resultVO.write_date }"/>
			<input type="hidden" id="content" name="content" value="${resultVO.content }"/>
		</form>
	</div>
</body>
</html>