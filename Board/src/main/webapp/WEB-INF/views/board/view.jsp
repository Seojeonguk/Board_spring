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
	function modify_btn() {
		var form = document.form;
		form.submit();
	}
</script>
</head>
<body>
	<div class="container">
		<div>
			<label>게시판 제목</label>
			<label><c:out value="${resultVO.title }"></c:out></label>
		</div>
		
		<div>
			<label>작성자</label>
			<label><c:out value="${resultVO.writer }"></c:out></label>
		</div>
		
		<div>
			<label>작성 시간</label>
			<label><c:out value="${resultVO.write_date }"></c:out></label>
		</div>
		
		<div>
			<label>게시글 내용</label>
			<label><c:out value="${resultVO.content }"></c:out></label>
		</div>
		
		<div>
			<a href="/board/list.do" class="btn btn-default" >목록</a>
			<a href="#" onclick="modify_btn();" class="btn btn-default">수정</a>
		</div>
		
		<form name="form" action="/board/modify.do" method="post">
			<input type="hidden" id="board_number" name="board_number" value="${resultVO.board_number }"/>
			<input type="hidden" id="title" name="title" value="${resultVO.title }"/>
			<input type="hidden" id="writer" name="writer" value="${resultVO.writer }"/>
			<input type="hidden" id="write_date" name="write_date" value="${resultVO.write_date }"/>
			<input type="hidden" id="content" name="content" value="${resultVO.content }"/>
		</form>
	</div>
</body>
</html>