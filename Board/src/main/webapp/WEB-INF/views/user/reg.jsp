<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1.0">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
<script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<title></title>
<script>
	// form 제출 시 실행
	function chk() {
		var form=document.form;
		var pw = form.password.value;
		var pw_c = form.password_chk.value;
		if(pw ==null || pw == "" || pw_c == null || pw_c == "" || pw!=pw_c) {
			document.form.password_chk.style.border = "1px solid red";
			$("#password_chk").effect("shake");
			document.form.password.focus();
			return false;
		}
		if(form.gender.value=="N") {
			$("#gender-div").effect("shake");
			return false;
		}
		if(form.level.value==7) {
			$("#level-div").effect("shake");
			return false;
		}
		
		return true;
	}

	function pw_focus_out() {
		var pw = document.form.password.value;
		var regex = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[\{\}\/?.,;:|\)*~`!^\-_+@\#$%&\\\=\(]).{8,20}$/;
		var error = document.getElementById("pw_error");
		if(!regex.test(pw)) {
			document.form.password.style.border="1px solid red";
			error.style.visibility="visible";
			$("#password").effect("shake");
		}
		else {
			error.style.visibility="hidden";
			document.form.password.style.border="1px solid #ccc";
		}
	}

	// 비밀번호 확인 처리
	function pw_chk_focus_out(c) {
		var pw = document.form.password.value;
		var pw_c = document.form.password_chk.value;
		var error = document.getElementById("pw_chk_error");
		
		if(pw ==null || pw == "" || pw_c == null || pw_c == "" || pw!=pw_c) {
			error.style.display = "block";
			document.form.password_chk.style.border = "1px solid red";
			$("#password_chk").effect("shake");
		}
		else {
			error.style.display = "none";
			document.form.password_chk.style.border = "1px solid green";
		}
	}

	function key_down(c) {
		var error=document.getElementById("pw_chk_error");
		error.style.display="none";
	}
	
	function id_focus_out(c) {
		var regex = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
		if(!regex.test(c.value)) {
			$("#id").effect("shake");
			document.getElementById("id_error").style.display="block";
		}
		else {
			document.getElementById("id_error").style.display="none";
		}
		
	}
</script>
</head>
<body>
	<div class="container" style="max-width:350px">
		<form action="/user/regAction.do" method="POST" name="form" onsubmit="return chk();">
			<div class="form-group">
				<label>아이디</label>
				<input type="text" name="id" id="id" class="form-control" pattern="^[a-z0-9][a-z0-9_\-]{4,19}$" placeholder="아이디" minlength="5" onfocusout="id_focus_out(this);"  maxlength="20" required>
				<span id="id_error" style="color:red; display:none;">5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.</span>
			</div>
			<div class="form-group" style="border:1px red">
				<label>비밀번호</label>
				<input type="password" pattern="^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+-=.,;:|~`?=./\*{}]).{8,20}$" name="password" id="password" class="form-control" minlength="4" maxlength="20" placeholder="비밀번호" onfocusout="pw_focus_out();" required/>
				<span id="pw_error" style="color:red; visibility:hidden;">8~20자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</span>
				<input type="password" name="password_chk" id="password_chk" class="form-control" minlength="4" maxlength="20" placeholder="비밀번호 재입력" onfocusout="pw_chk_focus_out(this);" onkeydown="key_down(this);" required/>
				<span id="pw_chk_error" style="color:red; display:none;">비밀번호가 일치하지 않습니다.</span>
			</div>
			
			
			<div class="form-group">
				<label>이름</label>
				<input type="text" name="name" id="name" class="form-control" maxlength="20" placeholder="이름" required/>
			</div>
			
			<div class="form-group">
				<label>생일/성별</label>
				<div class="row">
					<div class="col-xs-4 col-md-4">
						<select name="birth_year" class="form-control" required>
								<option label="년도"/>
							<%for(int i=Calendar.getInstance().get(Calendar.YEAR);i>1906;i--) {%>
								<option value="<%=i %>" label="<%=i%>"/>
							<%}%>
						</select>
					</div>
					
					<div class="col-xs-4 col-md-4">
						<select name="birth_month" class="form-control" required>
								<option label="월"/>
							<%for(int i=1;i<=12;i++) {%>
									<option value="<% if(i<10) { %>0<%} %><%=i %>" label="<%=i%>"/>
							<%}%>
						</select>
					</div>
					
					<div class="col-xs-4 col-md-4">
						<select name="birth_day" class="form-control" required>
								<option label="일"/>
							<%for(int i=1;i<=31;i++) {%>
									<option value="<% if(i<10) { %>0<%} %><%=i %>" label="<%=i%>"/>
							<%}%>
						</select>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<div class="text-center" id="gender-div">
					<label class="radio-inline">
						<input type="radio" name="gender" value="N" checked required/>선택안함
					</label>
					<label class="radio-inline">
						<input type="radio" name="gender" id="gender_M" value="M"/>남자
					</label>
					<label class="radio-inline">
						<input type="radio" name="gender" id="gender_F" value="F"/>여자
					</label>
				</div>
			</div>
			
			<div class="form-group">
				<label>이메일</label>
				<input type="Email" name="email" pattern="^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$" id="email" class="form-control" maxlength="30" placeholder="이메일"/>
			</div>
			
			<div class="form-group">
				<label>Phone_number</label>
				<input type="tel" name="phone_num" pattern="^01[0|1|6|7|8|9][0-9]{7,8}$" id="phone_num" class="form-control" maxlength="13" placeholder="핸드폰 번호" required/>
			</div>
			
			<div class="form-group">
				<label>AD</label>
				<div class="text-center">
					<label class="radio-inline">
						<input type="radio" class="btn btn-default" name="ad_chk" id="ad_chk_Y" value="Y" checked/>예
					</label>
					<label class="radio-inline">
						<input type="radio" name="ad_chk" id="ad_chk_N" value="N"/>아니오
					</label>
				</div>
			</div>
			
			<div class="form-group" id="level-div">
				<label>Level</label>
				<select name="level" class="form-control" required>
					<option value="1" label="운영자"/>
					<option value="3" label="관리자"/>
					<option value="5" label="사용자"/>
					<option value="7" label="선택"  selected/>
				</select>
			</div>
			
			<div class="text-center">
				<input type="submit" value="등록" class="btn btn-default">
				<a href="/user/login.do" class="btn btn-default">취소</a>
			</div>
		</form>
	</div>
</body>
</html>