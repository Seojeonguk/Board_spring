<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title></title>
</head>
<body>
	<!-- 파라미터값에 따라 include
	게시판 글 리스트 : list
	등록 및 수정 : reg
	상세보기 : view
	
	 -->
	 <c:choose>
	 	<c:when test="${param.cmd eq 'list' }">
	 		<jsp:include page="/board/main_list.do"/>
	 	</c:when>
	 	
	 	<c:when test="${param.cmd eq 'main' }">
	 		<jsp:include page="/board/main.do"/>
	 	</c:when>
	 	
	 	<c:when test="${param.cmd eq 'reg' or param.cmd eq 'modify' }">
	 		<jsp:include page="/board/main_write.do"/>
	 	</c:when>
	 	
	 	<c:when test="${param.cmd eq 'view' }">
	 		<jsp:include page="/board/main_view.do"/>
	 	</c:when>
	 </c:choose>

</body>
</html>