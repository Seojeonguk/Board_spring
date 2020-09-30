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
	<div class="container">
		<form name="form" action ="<c:out value="/board/modifyAction.do"/>" method=POST >
			<div class="form-group">
				<label>제목</label>
				<input type="text" name="title" class="form-control" id="title" value="<c:out value="${BoardVO.title }"/>">
			</div>
			
			<div class="form-group">
				<label>작성자</label>
				<input type="text" name="writer" class="form-control" id="writer" value="<c:out value="${BoardVO.writer }"/>" readonly/>
			</div>
			
			<div class="form-group">
				<label>내용</label>
				<input type="text" name="content" class="form-control" id="content" value="<c:out value="${BoardVO.content }"/>">
			</div>
			
			
			
			<!-- hidden div 모음  -->
			<div class="form-group">
				<input type="hidden" name="board_number" id="board_nubmer" value="<c:out value="${BoardVO.board_number }"/>" />
				<input type="hidden" name="write_date" id="write_date" value="<c:out value="${BoardVO.write_date }"/> "/>
			</div>
			
			<div class="text-center">
				<a href="/board/list.do" class="btn btn-default">취소</a>
				<a href="#" onclick="form_submit(); return 0" class="btn btn-default">수정</a>
			</div>
		</form>
	</div>
</body>
</html>