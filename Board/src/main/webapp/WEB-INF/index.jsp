<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1.0">
<title></title>
</head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<link rel="stylesheet" href="<c:url value='resources/CSS/index.css'/>">
<body>
	<jsp:include page="/WEB-INF/views/util/header.jsp" flush="false"/>
	<div style="min-height:700px">
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
	</div>
	<jsp:include page="/WEB-INF/views/util/footer.jsp" flush="false"/>
</body>
</html>