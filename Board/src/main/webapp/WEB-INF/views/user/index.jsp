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
	<c:choose>
		<c:when test="${param.cmd eq 'login' }">
			<jsp:include page="/user/login.do"/>
		</c:when>
		
		<c:when test="${param.cmd eq 'reg' or param.cmd eq 'modify'}">
			<jsp:include page="/user/reg.do"/>
		</c:when>
	</c:choose>
</body>
</html>