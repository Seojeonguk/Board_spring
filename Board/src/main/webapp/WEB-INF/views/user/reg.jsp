<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<script>
	$(document).ready(function() {
		$("#submitbtn").click(function() {
			event.preventDefault();

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

			var url = "";
			if(<c:out value="${param.cmd eq 'reg'}"/>) {
				url = "<c:url value='/user/regActionAjax.do'/>";
			}
			else if(<c:out value="${param.cmd eq 'modify'}"/>) { 
				url = "<c:url value='/user/modifyActionAjax.do'/>";
			}
			
			$.ajax({
				url:url,
				type:"POST",
				data:$('#form').serialize(),
				dataType:"json",
				success:function(success) {
					location.href="<c:url value='/'/>";
				},
				error:function(data) {
					alert("등록실패!");
				}
			});
		});

		/* ID입력시 규칙 확인 후 입력 칸 벗어날 경우 ID존재여부 확인 */
		$("#id").focusout(function() {
			var regex = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
			if(!regex.test(this.value)) {
				$("#id").effect("shake");
				document.getElementById("id_error").style.display="block";
				document.getElementById("id_error").innerHTML="5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";
			}
			else {
				$.ajax({
					url:"/user/reg_id_check.do",
					type:"POST",
					data:$('#form').serialize(),
					dataType:"json",
					success:function(success) {
						if(success.dupl == 1) {
							<!--span값 변경-->
							document.getElementById("id_error").innerHTML="이미 존재하는 아이디입니다.";
							document.getElementById("id_error").style.display="block";
						}
						else {
							document.getElementById("id_error").style.display="none";
						}
					},
					error:function(data) {
						console.log(data);
					}
				});
			}
		});

		/* 비밀번호 입력 후 규칙 확인 */
		$("#password").focusout(function() {
			var regex = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[\{\}\/?.,;:|\)*~`!^\-_+@\#$%&\\\=\(]).{8,20}$/;
			var error = document.getElementById("pw_error");
			if(!regex.test(this.value)) {
				document.form.password.style.border="1px solid red";
				error.style.display="block";
				$("#password").effect("shake");
			}
			else {
				error.style.display="none";
				document.form.password.style.border="1px solid #ccc";
			}
		});

		/* 비밀번호 확인 입력 후 일치여부 확인 */
		$("#password_chk").focusout(function(){
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
		});

		/* 비밀번호 입력 중에는 에러 문구 가리기 */
		$("#password_chk").keydown(function() {
			var error=document.getElementById("pw_chk_error");
			error.style.display="none";
		});

		/* 회원 탈퇴 하기 버튼 */
		$("#secessionbtn").click(function() {
			$.ajax({
				url:"/user/deleteAjax.do",
				type:"POST",
				data:$('#form').serialize(),
				dataType:"json",
				success:function(success) {
					location.href="<c:url value='/'/>";
				},
				error:function(data) {
					console.log(data);
				}
			});
		});
	});
</script>
</head>
<body>
	<div class="container" style="max-width:380px">
		<form action="#" name="form" id="form">
			<div class="form-group">
				<label>아이디</label>
				<input type="text" name="id" id="id" class="form-control" pattern="^[a-z0-9][a-z0-9_\-]{4,19}$" placeholder="아이디" minlength="5" value="<c:out value='${UserVO.id }'/>"  maxlength="20" required <c:if test="${!empty(UserVO) }">readonly</c:if>>
				<span id="id_error" style="color:red; display:none;">5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.</span>
			</div>
			<div class="form-group">
				<label>비밀번호</label>
				<input type="password" pattern="^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+-=.,;:|~`?=./\*{}]).{8,20}$" name="password" id="password" class="form-control" minlength="4" maxlength="20" placeholder="비밀번호" value="<c:out value='${UserVO.password }'/>" required/>
				<span id="pw_error" style="color:red; display:none;">8~20자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</span>
				<label>비밀번호 확인</label>
				<input type="password" name="password_chk" id="password_chk" class="form-control" minlength="4" maxlength="20" placeholder="비밀번호 재입력" onkeydown="key_down(this);" value="<c:out value='${UserVO.password }'/>" required/>
				<span id="pw_chk_error" style="color:red; display:none;">비밀번호가 일치하지 않습니다.</span>
			</div>
			
			
			<div class="form-group">
				<label>이름</label>
				<input type="text" name="name" id="name" class="form-control" maxlength="20" placeholder="이름" value="<c:out value='${UserVO.name }'/>" required/>
			</div>
			
			<div class="form-group">
				<label>생일/성별</label>
				<div class="row">
					<div class="col-xs-4 col-md-4">
						<select name="birth_year" class="form-control" required>
								<option label="년도"/>
							<c:forEach var="year" items="${yearList }">
								<option value=<c:out value="${year}"/> label="<c:out value='${year}'/>" <c:if test="${year eq UserVO.birth_year }">selected</c:if>/>
							</c:forEach>
						</select>
					</div>
					
					<div class="col-xs-4 col-md-4">
						<select name="birth_month" class="form-control" required>
								<option label="월"/>
							<c:forEach var="month" items="${monthList }" varStatus="status">
								<option value=<c:out value="${month }"/> label="<c:out value='${status.index+1 }'/>" <c:if test="${status.index+1 eq UserVO.birth_month }">selected</c:if>/>
							</c:forEach>
						</select>
					</div>
					
					<div class="col-xs-4 col-md-4">
						<select name="birth_day" class="form-control" required>
								<option label="일"/>
							<c:forEach var="day" items="${dayList }" varStatus="status">
								<option value=<c:out value="${day }"/> label="<c:out value='${status.index+1 }'/>" <c:if test="${status.index+1 eq UserVO.birth_day }">selected</c:if>/>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<div class="text-center" id="gender-div">
					<label class="radio-inline">
						<input type="radio" name="gender" value="N" <c:if test="${UserVO.gender eq 'N' or param.cmd eq 'reg'}"> checked </c:if> required/>선택안함
					</label>
					<label class="radio-inline">
						<input type="radio" name="gender" id="gender_M" value="M" <c:if test="${UserVO.gender eq 'M'}"> checked </c:if>/>남자
					</label>
					<label class="radio-inline">
						<input type="radio" name="gender" id="gender_F" value="F" <c:if test="${UserVO.gender eq 'F'}"> checked </c:if>/>여자
					</label>
				</div>
			</div>
			
			<div class="form-group">
				<label>이메일</label>
				<input type="Email" name="email" pattern="^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$" id="email" class="form-control" maxlength="30" value="<c:out value='${UserVO.email }'/>" placeholder="이메일"/>
			</div>
			
			<div class="form-group">
				<label>Phone_number</label>
				<input type="tel" name="phone_num" pattern="^01[0|1|6|7|8|9][0-9]{7,8}$" id="phone_num" class="form-control" maxlength="13" value="<c:out value='${UserVO.phone_num }'/>" placeholder="핸드폰 번호" required/>
			</div>
			
			<div class="form-group">
				<label>AD</label>
				<div class="text-center">
					<label class="radio-inline">
						<input type="radio" class="btn btn-default" name="ad_chk" id="ad_chk_Y" value="Y" <c:if test="${UserVO.ad_chk eq 'Y' or param.cmd eq 'reg'}"> checked </c:if>/>예
					</label>
					<label class="radio-inline">
						<input type="radio" name="ad_chk" id="ad_chk_N" value="N" <c:if test="${UserVO.ad_chk eq 'N'}"> checked </c:if>/>아니오
					</label>
				</div>
			</div>
			
			<div class="form-group" id="level-div">
				<label>Level</label>
				<select name="level" class="form-control" required>
					<option value="1" label="운영자" <c:if test="${UserVO.level eq 1}"> selected </c:if> />
					<option value="3" label="관리자" <c:if test="${UserVO.level eq 3}"> selected </c:if>/>
					<option value="5" label="사용자" <c:if test="${UserVO.level eq 5}"> selected </c:if>/>
					<option value="7" label="선택"  <c:if test="${UserVO.level eq 7 or param.cmd eq 'reg'}"> selected </c:if>/>
				</select>
			</div>
			
			<div class="text-center">
				<a href="#" id="submitbtn" class="btn btn-default">
					<c:if test="${param.cmd eq 'reg' }">등록</c:if>
					<c:if test="${param.cmd eq 'modify' }">수정</c:if>
				</a>
				<c:if test="${param.cmd eq 'modify' }">
					<a href="#" id="secessionbtn" class="btn btn-default">탈퇴</a>
				</c:if>
				<a href="/?pid=user&cmd=login" class="btn btn-default">취소</a>
			</div>
		</form>
	</div>
</body>
</html>