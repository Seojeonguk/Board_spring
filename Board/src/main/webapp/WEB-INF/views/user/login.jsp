<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1.0">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title></title>
<script>
	function submit() {
		var form = document.form;
		form.submit();
	}
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/util/header.jsp" flush="false"/>
	<div class="container" style="max-width:400px">
		<form action="<c:out value="/user/loginAction.do"/>" method="post" name="form">
			<div class="form-group">
				<label>ID</label>
				<input type="text" name="id" class="form-control" id="id" placeholder="아이디를 입력해주세요"/>
			</div>
			
			<div class="form-group">
				<label>PW</label>
				<input type="password" name="password" class="form-control" id="password" placeholder="비밀번호를 입력해주세요"/>
			</div>
			
			<div class="text-center">
				<a href="#" class="btn btn-default" onclick="submit(); return 0;">로그인</a>
				<a href="/user/reg.do" class="btn btn-default">회원가입</a>
			</div>
		</form>
	</div>
</body>
</html>