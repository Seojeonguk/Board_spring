<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<c:url value='resources/CSS/util/header.css'/>">

<script>
	$(document).ready(function() {
		$('.menu-toggle').click(function() {
			$('nav').toggleClass('active');
			$('.content').toggleClass('menu-toggle-active');
		});

		$('ul li').click(function() {
			$(this).siblings().removeClass('active');
			$(this).toggleClass('active');
		});
	});
</script>

<header>
		<div class="logo"><a href="/">Logo</a></div>
		<nav>
			<ul>
				
				<li><a href="/?pid=board&cmd=list&category=001">공지사항</a></li>
				<li class="sub-menu"><a href="#">커뮤니티</a>
					<ul>
						<li><a href="/?pid=board&cmd=list&category=002">자유게시판</a></li>
						<li><a href="/?pid=board&cmd=list&category=003">방명록</a></li>
					</ul>
				</li>
				<li class="sub-menu"><a href="#">로그인</a>
					<ul>
						<c:if test="${empty(id) }">
							<a href="/?pid=user&cmd=login">Login</a>
						</c:if>
						<c:if test="${!empty(id) }">
							<li><a href="/?pid=user&cmd=modify">modify</a></li>
							<li><a href="<c:url value='/user/logout.do' />">logout</a></li>
						</c:if>
					</ul>
				</li>
			</ul>
		</nav>
		
		<div class="menu-toggle">
			<i class="fa fa-bars" aria-hidden="true"></i>
		</div>
	</header>