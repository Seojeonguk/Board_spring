<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<script>
	$(document).ready(function() {
		$("#submitbtn").click(function() {
			var url = "";
			if(<c:out value="${param.cmd eq 'reg'}"/>)
				url = "<c:url value='/board/writeAjax.do'/>";
			else
				url = "<c:url value='/board/modifyAjax.do'/>";
			$.ajax({
				url:url,
				type:"POST",
				data:$('#form').serialize(),
				dataType:"json",
				success:function(success) {
					location.href = "<c:url value='/?pid=board&cmd=view&category=${param.category}&board_number='/>"+success.board_number;
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
	<div class="container" style="max-width:700px">
		<form id="form" name="form" method=POST >
			<!-- input hidden start -->
			<input type="hidden" name="category" id="category" value="<c:out value='${BoardVO.category }'/>">
			<input type="hidden" name="board_number" id="board_nubmer" value="<c:out value='${BoardVO.board_number }'/>" />
			<!-- input hidden end -->
			<div class="form-group">
				<label>제목</label>
				<input type="text" name="title" class="form-control" id="title" value="<c:out value="${BoardVO.title }"/>" placeholder="제목을 입력해주세요">
			</div>
			
			<div class="form-group">
				<label>작성자</label>
				<%-- value="<c:out value="${BoardVO.writer }"/>" --%>
				<input type="text" name="writer" class="form-control" id="writer" value="${id }" placeholder="작성자를 입력해주세요" readonly>
			</div>
			
			<div class="form-group">
				<label>내용</label>
				<textarea rows="30" cols="20" class="form-control" name="content"  placeholder="내용을 입력해주세요." ><c:out value="${BoardVO.content }"/></textarea>
			</div>
			
			<div class="text-center">
				<a href="/?pid=board&cmd=list&page=1&category=${param.category }" class="btn btn-default">취소</a>
				<a href="#" id="submitbtn" class="btn btn-default">
					<c:if test="${param.cmd eq 'reg' }">등록</c:if>
					<c:if test="${param.cmd eq 'modify' }">수정</c:if>
				</a>
			</div>
		</form>
	</div>
</body>
</html>