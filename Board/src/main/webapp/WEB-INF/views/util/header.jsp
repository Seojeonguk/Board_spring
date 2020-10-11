<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1.0">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title></title>
<%
	
 %>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<a href="/board/main_list.do?page=1&category=001" class="navbar-brand">
					<c:out value="BoardHomePage"></c:out>
				</a>
				<a href="/board/main_list.do?page=1&category=002" class="navbar-brand">
					<c:out value="자유게시판"></c:out>
				</a>
				<a href="/board/main_list.do?page=1&category=003" class="navbar-brand">
					<c:out value="방명록"></c:out>
				</a>
			</div>


			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li>
						<form class="navbar-form navbar-left" role="search">
							<div>
								<input type="hidden" name="page" value="1"/>
								<input type="hidden" name="category" value="<c:out value="${BoardVO.category }"/>"/>
							</div>
							<div class="form-group">
								<input type="text" class="form-control" name="search_key" placeholder="Search">
							</div>
							<button type="submit" class="btn btn-default">검색</button>
							
						</form>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<c:choose>
								<c:when test="${not empty id  and id ne ''}"><c:out value="${id }"></c:out></c:when>
								<c:otherwise><c:out value="메뉴"></c:out></c:otherwise>
							</c:choose>
							<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							
							<c:choose>
								<c:when test="${not empty id  and id ne ''}">
									<li><a href="/user/modify.do">정보수정</a></li>
									<li class="divider"></li>
									<li id="logout"><a href="/user/logout.do">로그아웃</a></li>
								</c:when>
								<c:otherwise>
									<li id="login"><a href="/user/login.do">로그인</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	
	
</body>
</html>