<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="<c:url value='resources/CSS/user/login.css'/>">

<script>
	$(document).ready(function() {
		$("#loginbtn").click(function(event) {
			event.preventDefault();

			$.ajax({
				url : "<c:url value='/user/loginActionAjax.do' />",
				type : "POST",
				data : $('#loginform').serialize(),
				dataType : "json",
				success : function(response) {
					if (response.success == 0) {
						if (response.error_code == 0) {
							alert("아이디를 찾을 수 없습니다!");
						} else if (response.error_code == 1) {
							alert("비밀번호가 틀렸습니다!");
						}
					} else {
						location.href = "<c:url value='/'/>";
					}
				},
				error : function(response) {
					alert("에러");
				}
			});
		});
	});
</script>


<div class="login_container">
		<form id="loginform" class="login" action="" method="post" name="form">
			<h2>Login</h2>
			<div class="group">
				<input type="text" name="id" placeholder="아이디를 입력해주세요"/>
				<i class="fa fa-user"></i>
			</div>
			
			<div class="group">
				<input type="password" name="password" placeholder="비밀번호를 입력해주세요"/>
				<i class="fa fa-lock"></i>
			</div>
			
			<button id="loginbtn"><i class="fa fa-send"></i>Login</button>
			
			<p class="fs">Forgot <a href="#">Password</a> ? </p>
			
			<p class="ss">Don't have an account ? <a href="/?pid=user&cmd=reg">Signup</a></p>
		</form>
	</div>
