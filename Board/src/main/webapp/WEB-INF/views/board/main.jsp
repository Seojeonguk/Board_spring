<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title></title>

<c:set var="BoardVO.totalcount" value="${BoardVO.totalcount }" />
<c:set var="BoardVO.startpage" value="${BoardVO.startpage }" />
<c:set var="BoardVO.endpage" value="${BoardVO.endpage }" />
<c:set var="BoardVO.page" value="${BoardVO.page }" />
<c:set var="BoardVO.perpagenum" value="${BoardVO.perpagenum }" />
<c:set var="BoardVO.pagenum" value="${BoardVO.pagenum }" />
<c:set var="BoardVO.perpagetotalcount" value="${BoardVO.perpagetotalcount }" />
<c:set var="BoardVO.category" value="${BoardVO.category }"/>
<%
	int p = (int)pageContext.getAttribute("BoardVO.page");
	int pn = (int)pageContext.getAttribute("BoardVO.pagenum");
	int ep = (int)pageContext.getAttribute("BoardVO.endpage");
	String ctgr = (String)pageContext.getAttribute("BoardVO.category");
	boolean last_page_chk = false;
	int st = ((int)Math.ceil((double)p/(double)pn)-1)*pn+1;
	pageContext.setAttribute("st",st);
%>

<script>
	function session_check() {
		<%
		String session_id = (String)session.getAttribute("id");
		if(session_id != null) {
			out.print("location.href='/board/main_write.do?category=" +ctgr + "';" );
		} else  {
			out.print("alert('로그인이 필요합니다');");
			out.print("location.href='/user/login.do';");
		}
		%>
	}
</script>	
</head>
<body>
	<jsp:include page="/WEB-INF/views/util/header.jsp" flush="false"/>
	<div class="container" style="max-width: 700px">
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
					<td>
						<a href="${path}/board/main_view.do?board_number=${row.board_number}">${row.title}</a></td>
					<td>${row.content }</td>
					<td>${row.view_cnt }</td>
				</tr>
			</c:forEach>
		</table>
		<div class="text-right">
			<a href="#" onclick="javascript:session_check(); return false;" class="btn btn-default">글쓰기</a>
		</div>
	</div>
	<div class="text-center">
		<ul class="pagination">
			<c:if test="${BoardVO.page ne 1 }">
				<li><a href="/board/main_list.do?page=1&category=${BoardVO.category }">&laquo;</a></li>
			</c:if>
			<c:if test="${st ne 1 }">
				<li><a href="/board/main_list.do?page=<%=st-pn%>&category=${BoardVO.category}">&lt;</a></li>
			</c:if>
			<%for(int i=st; i<= ep && i<st+pn;i++) { %>
			<li><a href="/board/main_list.do?page=<%=i%>&category=${BoardVO.category}"><%=i %></a></li>
			<%if(i==ep) {
					last_page_chk = true;
					pageContext.setAttribute("last_page_chk",last_page_chk);} 
				%>
			<%} %>
			<c:if test="${last_page_chk ne true and BoardVO.endpage ne 0 }">
				<li><a href="/board/main_list.do?page=<%=st+pn%>&category=${BoardVO.category}">&gt;</a></li>
			</c:if>
			<c:if test="${BoardVO.page ne BoardVO.endpage and BoardVO.endpage ne 0 }">
				<li>
					<a href="/board/main_list.do?page=<c:out value="${BoardVO.endpage }"/>&category=${BoardVO.category}">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>