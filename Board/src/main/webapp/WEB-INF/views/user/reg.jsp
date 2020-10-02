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
<title></title>
<script>
	function form_submit() {
		var form = document.form;
		form.submit();
	}
</script>
</head>
<body>
	<div class="container" style="max-width:350px">
		<form action="/user/regAction.do" method="POST" name="form">
			<div class="form-group">
				<label>아이디</label>
				<input type="text" name="id" id="id" class="form-control" placeholder="아이디" required>
			</div>
			
			<div class="form-group">
				<label>비밀번호</label>
				<input type="password" name="password" id="password" class="form-control" placeholder="비밀번호" required/>
				<input type="password" name="password_chk" id="password_chk" class="form-control" placeholder="비밀번호 재입력" required/>
			</div>
			
			
			<div class="form-group">
				<label>이름</label>
				<input type="text" name="name" id="name" class="form-control" placeholder="이름" required/>
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
				<div class="text-center">
					<label class="radio-inline">
						<input type="radio" name="gender" checked required/>선택없음
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
				<input type="Email" name="email" id="email" class="form-control" placeholder="이메일"/>
			</div>
			
			<div class="form-group">
				<label>Phone_number</label>
				<input type="tel" name="phone_num" id="phone_num" class="form-control" placeholder="핸드폰 번호" required/>
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
			
			<div class="form-group">
				<label>Level</label>
				<select name="level" class="form-control" required>
					<option value="1" label="운영자"/>
					<option value="3" label="관리자"/>
					<option value="5" label="사용자"/>
					<option label="선택" selected/>
				</select>
			</div>
			
			<div class="text-center">
				<a href="#" class="btn btn-default" onclick="form_submit(); return 0">등록</a>
				<a href="/user/login.do" class="btn btn-default">취소</a>
			</div>
		</form>
	</div>
</body>
</html>