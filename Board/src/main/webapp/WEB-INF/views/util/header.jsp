<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<c:url value='resources/CSS/util/header.css'/>">
<script type="text/javascript" src="<c:url value='resources/JS/util/header.js'/>"></script>

	<header>
		<div class="logo"><a href="/">Logo</a></div>
		<nav>
			<ul>
				<li><a href="/?pid=board&cmd=list&category=001">공지사항</a></li>
				<li><a href="/?pid=board&cmd=list&category=002">자유게시판</a></li>
				<li><a href="/?pid=board&cmd=list&category=003">방명록</a></li>
				<li class="sub-menu"><a href="#">ETC</a>
					<ul>
						<li><a href="#">SEC1</a></li>
						<li><a href="#">SEC2</a></li>
					</ul>
				</li>
				<li class="sub-menu"><a href="/?pid=user&cmd=login">Login</a>
					<ul>
						<li><a href="/?pid=user&cmd=modify">modify</a></li>
						<li><a href="/?pid=user&cmd=logout">logout</a></li>
					</ul>
				</li>
			</ul>
		</nav>
		
		<div class="menu-toggle">
			<i class="fa fa-bars" aria-hidden="true"></i>
		</div>
	</header>