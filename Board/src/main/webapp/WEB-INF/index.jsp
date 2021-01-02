<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1.0">
<title></title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/util/header.jsp" flush="false"/>
	<c:choose>
		<c:when test="${param.pid eq 'board' }">
			<jsp:include page="/board/index.do"/>
		</c:when>
		<c:when test="${param.pid eq 'user' }">
			<jsp:include page="/user/index.do"/>
		</c:when>
		<c:otherwise>
			<jsp:include page="/board/main.do"/>
		</c:otherwise>
	</c:choose>
</body>
</html>