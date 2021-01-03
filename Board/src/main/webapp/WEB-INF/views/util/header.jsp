<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<nav class="navbar navbar-default" style="width:100%">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<a href="/" class="navbar-brand">Logo</a>
				<a href="/?pid=board&cmd=list&category=001" class="navbar-brand">공지사항</a>
				<a href="/?pid=board&cmd=list&category=002" class="navbar-brand">자유게시판</a>
				<a href="/?pid=board&cmd=list&category=003" class="navbar-brand">방명록</a>
			</div>


			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li>
						<form class="navbar-form navbar-left" role="search" action="/board/main_list.do">
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
								<c:otherwise>메뉴</c:otherwise>
							</c:choose>
							<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							
							<c:choose>
								<c:when test="${not empty id  and id ne ''}">
									<li><a href="/?pid=user&cmd=modify">정보수정</a></li>
									<li class="divider"></li>
									<li id="logout"><a href="/user/logout.do">로그아웃</a></li>
								</c:when>
								<c:otherwise>
									<li id="login"><a href="/?pid=user&cmd=login">로그인</a></li>
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