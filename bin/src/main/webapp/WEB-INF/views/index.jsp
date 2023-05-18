<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SSAFY 사용자 관리</title>
</head>
<body>
	<div class="container">
		<h1>게시판에 오신 것을 환영합니다.</h1>
		<hr>
		<ul>
			<%@ include file="include/header.jsp"%>
			<c:if test="${loginUser eq null }">
				<li><a href="./regist">회원 가입</a></li>
				<li><a href="./board">게시판 둘러보기</a></li>
			</c:if>
			<c:if test="${loginUser ne null }">
				<li><a href="./board">게시판 가기</a></li>
			</c:if>
			<c:if test="${loginUser.id eq 'administrator' }">
				<li><a href="./userList">사용자 목록</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>