<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1.0">
<title></title>
</head>

<link rel="stylesheet" href="<c:url value='resources/CSS/index.css'/>">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/4102b1c1c1.js" crossorigin="anonymous"></script>

<script>
	$(window).resize(function() {
		var width_size = window.innerWidth;
		// 800 이하인지 if문으로 확인
		if (width_size >= 991) {
			$('.content').removeClass('menu-toggle-active');
			$('nav').removeClass('active');
		}
	})
</script>
<body>
	<jsp:include page="/WEB-INF/views/util/header.jsp" flush="false"/>
	<div class="content">
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