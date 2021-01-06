<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<script>
	$(document).ready(function() {
		$("#modifybtn").click(function() {
			$("#hidden_form").attr("action","<c:url value='/?pid=board&cmd=modify&category=${param.category}'/>");
			$("#hidden_form").submit();
		});

		$("#deletebtn").click(function() {
			$.ajax({
				url:"<c:url value='/board/deleteAjax.do'/>",
				type:"POST",
				data:$('#hidden_form').serialize(),
				dataType:"json",
				success:function(success) {
					alert('삭제가 완료되었습니다.');
					location.href='/?pid=<c:out value="${param.pid}"/>&cmd=list&category=<c:out value="${param.category}"/>/>';
				},
				error:function(data) {
					console.log(data);
				}
			});
		});

		$("#commentbtn").click(function() {
			$.ajax({
				url:"<c:url value='/board/comment_reg.do'/>",
				type:"POST",
				data:$('#comment_form').serialize(),
				dataType:"json",
				success:function(success) {
					location.reload();
				},
				error:function(data) {
					console.log(data);
				}
			});
		});

		$("#comment_div_btn").click(function() {
			var comment = document.getElementById("comment_div");
			if(comment.style.display=="none") 
				comment.style.display="block";
			else 
				comment.style.display="none";
		});

		$(".comment_delete").click(function() {
			if(confirm('댓글을 삭제하시겠습니까?')) {
				$("#comment_number").val($(this).attr("comment_number"));
				$.ajax({
					url: "<c:url value='/board/comment_delete.do'/>",
					type:"POST",
					data:$('#comment_form').serialize(),
					dataType:"json",
					success:function(success) {
						location.reload();
					},
					error:function(data) {
						console.log('삭제 실패하였습니다.');
					}
				});
			}
		});
	});
</script>
</head>
<body>
	<div class="container" style="max-width:700px">
		<form name="hidden_form" id="hidden_form" action="/board/main_modify.do" method="post">
			<input type="hidden" id="board_number" name="board_number" value="${resultVO.board_number }"/>
		</form>
		<table class="table">
			<tr>
				<td>게시판 제목</td>
				<td><c:out value="${resultVO.title}"/></td>
			</tr>
			
			<tr>
				<td>작성자</td>
				<td><c:out value="${resultVO.writer}"/></td>
			</tr>
			
			<tr>
				<td>작성 시간</td>
				<td><c:out value="${resultVO.write_date }"/></td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td><c:out value="${resultVO.content}"/></td>
			</tr>
		</table>
		
		<div class="content_btn">
			<div class="content_btn_left">
				<a href="#" id="comment_div_btn" class="btn btn-default">댓글  <c:out value='${comment_count }'/></a>
			</div>
			<div class="content_btn_right">
				<a href="/?pid=<c:out value='${param.pid }'/>&cmd=list&category=<c:out value='${param.category }'/>" class="btn btn-default" >목록</a>
				<c:if test="${id eq resultVO.writer }">
					<a href="#" id="modifybtn" class="btn btn-default">수정</a>
					<a href="#" id="deletebtn" class="btn btn-default">삭제</a>
				</c:if>
			</div>
		</div>
		
		<!-- 댓글 영역 시작 -->
		<div id="comment_div" class="comment_div" style="display:none">
			<div class="comment_div_div" >
				<c:forEach items="${comment_list}" var="list" varStatus="status">
					<div class="comment_writer_div">
						<div class="comment_writer_span">
							<span><c:out value="${list.comment_writer }"/></span>
						</div>
						<div class="comment_writer_icon dropdown">
							<a href="#" data-toggle="dropdown" aria-haspopup="true" role="button" aria-expanded="false" >
								<span class="glyphicon glyphicon-option-horizontal" aria-hidden="true"></span>
							</a>
							<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
								<li><a href="#">수정</a></li>
								<li><a href="#" class="comment_delete" comment_number="<c:out value='${list.comment_number}'/>">삭제</a></li>
							</ul>
						</div>
					</div>
					<div class="comment_content">
						<span><c:out value="${list.comment_content }"/></span>
					</div>
					<div class="comment_info">
						<span><c:out value="${list.comment_date }"/></span>
					</div>
				</c:forEach>
			</div>
			<form name="comment_form" id="comment_form">
				<input type="hidden" name="comment_writer" value="${id }"/>
				<input type="hidden" name="board_number" value="${resultVO.board_number }"/>
				<input type="hidden" id="comment_number" name="comment_number" value="0"/>
				<div class="form-group">
					<label><c:out value="${id }"></c:out></label>
					<textarea class="form-control" id="comment_content" name="comment_content" cols="20"></textarea>
				</div>
				<div class="text-right">
					<a href="#" id="commentbtn" class="btn btn-default">등록</a>
				</div>
				
			</form>
		</div>
		<!-- 댓글 영역 종료 -->
	</div>
</body>
</html>