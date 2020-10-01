<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1.0">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title></title>
</head>
<body>
	<div class="container" style="max-width:700px">
		<table class="table table-bordered">
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>내용</td>
				<td>조회수</td>
			</tr>

			<c:forEach var="row" items="${BoardList }">
				<tr>
					<td>${row.board_number }</td>
					<td><a href="${path}/board/view.do?board_number=${row.board_number}">${row.title}</a></td>
					<td>${row.content }</td>
					<td>${row.view_cnt }</td>
				</tr>
			</c:forEach>
		</table>
		<div class="text-right">
			<a href="/board/list.do?page=2" class="btn btn-default">홈</a>
			<a href="/board/write.do" class="btn btn-default">글쓰기</a>
		</div>
	</div>
	<div class="text-center">
		<ul class="pagination">
			<li><a href="#">&laquo;</a></li>
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">&raquo;</a></li>
		</ul>
	</div>
</body>
</html>