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
	$(document).ready(function() {
		$("#loginbtn").click(function(event) {
			event.preventDefault();

			$.ajax({
				url:"<c:url value='/user/loginActionAjax.do' />",
				type:"POST",
				data:$('#loginform').serialize(),
				dataType:"json",
				success:function(response) {
					if(response.success==0) {
						if(response.error_code==0) {
							alert("아이디를 찾을 수 없습니다!");
						}
						else if(response.error_code==1) {
							alert("비밀번호가 틀렸습니다!");
						}
					}
					else {
						location.href="<c:url value='/'/>";
					}
				},
				error:function(response) {
					alert("에러");
				}
			});
		});
	});
	
</script>
</head>
<body>
	<div class="container" style="max-width:400px">
		<form id="loginform" action="" method="post" name="form">
			<div class="form-group">
				<label>ID</label>
				<input type="text" name="id" class="form-control" id="id" placeholder="아이디를 입력해주세요"/>
			</div>
			
			<div class="form-group">
				<label>PW</label>
				<input type="password" name="password" class="form-control" id="password" placeholder="비밀번호를 입력해주세요"/>
			</div>
			
			<div class="text-center">
				<a href="#" id="loginbtn" class="btn btn-default">로그인</a>
				<a href="/?pid=user&cmd=reg" class="btn btn-default">회원가입</a>
			</div>
		</form>
	</div>
</body>
</html>