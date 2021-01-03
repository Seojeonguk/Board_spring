<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<script>
	$(document).ready(function() {
		$("#writebtn").click(function(event) {
			if(<c:out value="${!empty(id)}"/>) {
				location.href='<c:url value="/?pid=board&cmd=reg&category=${param.category}"/>';
			}
			else {
				alert('로그인이 필요합니다');
				location.href='<c:url value="/?pid=user&cmd=login"/>';
			}
		});
	});
</script>	
</head>
<body>
	<div class="container">
		<table class="table table-bordered">
			<tr>
				<td>번호<c:out value="${Page.startpage }"/></td>
				<td>제목</td>
				<td>내용</td>
				<td>조회수</td>
			</tr>

			<c:forEach var="row" items="${BoardList }">
				<tr>
					<td>${row.board_number }</td>
					<td><a href="/?pid=board&cmd=view&category=${param.category }&board_number=${row.board_number}">${row.title}</a></td>
					<td>${row.content }</td>
					<td>${row.view_cnt }</td>
				</tr>
			</c:forEach>
		</table>
		<div class="text-right">
			<a href="#" id="writebtn" class="btn btn-default">글쓰기</a>
		</div>
	</div>
	
	<!-- pagination start -->
	<div class="text-center">
		<ul class="pagination">
			<c:if test="${Page.page ne 1 }">
				<li><a href="/?pid=<c:out value='${param.pid}'/>&cmd=<c:out value='${param.cmd}'/>&category=<c:out value='${param.category }'/> ">&laquo;</a></li>
			</c:if>
			<c:if test="${Page.startpage ne 1 }">
				<li><a href="/?pid=<c:out value='${param.pid}'/>&cmd=<c:out value='${param.cmd}'/>&category=<c:out value='${param.category }'/>&page=<c:out value='${Page.startpage-Page.pagenum }'/>">&lt;</a></li>
			</c:if>
			
			<c:forEach var="ix" begin="${Page.startpage }" end="${Page.startpage+Page.pagenum-1 }">
				<c:if test="${Page.endpage >= ix }">
					<li><a href="/?pid=<c:out value='${param.pid}'/>&cmd=<c:out value='${param.cmd}'/>&category=<c:out value='${param.category }'/>&page=<c:out value='${ix }'/>"><c:out value='${ix }'/></a></li>
				</c:if>
			</c:forEach>
			<c:if test="${Page.startpage + Page.pagenum <= Page.endpage }">
				<li><a href="/?pid=<c:out value='${param.pid}'/>&cmd=<c:out value='${param.cmd}'/>&category=<c:out value='${param.category }'/>&page=<c:out value='${Page.startpage + Page.pagenum }'/>">&gt;</a></li>
			</c:if>
			<c:if test="${BoardVO.page ne BoardVO.endpage}">
				<li><a href="/?pid=<c:out value='${param.pid}'/>&cmd=<c:out value='${param.cmd}'/>&category=<c:out value='${param.category }'/>&page=<c:out value="${BoardVO.endpage }"/>">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
	<!-- pagination end -->
</body>
</html>