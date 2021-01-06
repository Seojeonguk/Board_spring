<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


	<c:choose>
		<c:when test="${param.cmd eq 'login' }">
			<jsp:include page="/user/login.do"/>
		</c:when>
		
		<c:when test="${param.cmd eq 'reg' or param.cmd eq 'modify'}">
			<jsp:include page="/user/reg.do"/>
		</c:when>
		
		<c:when test="${param.cmd eq 'logout' }">
			<jsp:include page="/user/logout.do"/>
		</c:when>
	</c:choose>