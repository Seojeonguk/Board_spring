<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
		<%
			SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
			String write_date = format1.format(new Date());
		%>
		form.write_date.value="<%=write_date%>";
		form.submit();
	}
</script>
</head>
<body>
	<div class="container">
		<form name="form" action ="<c:out value="/board/writeAction.do"/>" method=POST >
			<div class="form-group">
				<label>제목</label>
				<input type="text" name="title" class="form-control" id="title" placeholder="제목을 입력해주세요">
			</div>
			<div class="form-group">
				<label>내용</label>
				<input type="text" name="content" class="form-control" id="content" placeholder="제목을 입력해주세요">
			</div>
			
			<div class="form-group">
				<label>분류 코드</label>
				<input type="text" name="code" class="form-control" id="code" placeholder="분류코드를 입력해주세요">
			</div>
			
			<div class="form-group">
				<label>작성자</label>
				<input type="text" name="writer" class="form-control" id="writer" placeholder="작성자를 입력해주세요">
			</div>
			
			<!-- hidden div 모음  -->
			<div class="form-group">
				<input type="hidden" name="write_date" class="form-control" id="write_date" readonly/>
			</div>
			
			<div class="text-center">
				<a href="/board/list.do" class="btn btn-default">취소</a>
				<a href="#" onclick="form_submit(); return 0" class="btn btn-default">등록</a>
			</div>
		</form>
	</div>
</body>
</html>