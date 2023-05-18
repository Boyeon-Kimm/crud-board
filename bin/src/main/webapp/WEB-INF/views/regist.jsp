<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.ssafy.board.model.dto.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--절대경로를 쉽게 사용하기 위해 session에 root를 key로 컨텍스트 루트 경로를 저장해둔다. --%>
<c:set value="${pageContext.request.contextPath }" scope="session"
	var="root"></c:set>
<%-- bootstrap 관련 코드를 등록한다. --%>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
	crossorigin="anonymous"></script>
<%-- 프로젝트에서 정의한 CSS를 참조할 때 resources 경로를 참조한다. --%>
<link rel="stylesheet" href="${root }/resources/css/common.css">
<style>
#nav-header {
	display: flex;
	justify-content: space-between;
}

.nav-search {
	width: 50%;
}

.nav-search span {
	margin-left: 10px;
	border: solid black 1px;
	padding: 5px;
}
</style>
</head>
<body>
	<div class="container">
		<h1>회원 가입</h1>
		<!-- file upload를 위해 multipart/form-data를 추가한다. -->
		<form method="post" action="regist" enctype="multipart/form-data">
			<!-- front-controller pattern에서 요청을 구분하기 위한 parameter -->
			<div class="input-group mb-3">
				<span class="input-group-text">아이디</span> 
				<input type="text" id="id" name="id" class="form-control">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">비밀번호</span> 
				<input type="text" id="password" name="password" class="form-control">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">이름</span> 
				<input type="text" id="name" name="name" class="form-control">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">이메일</span> 
				<input type="email" id="email" name="email" class="form-control">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">나이</span> 
				<input type="number" id="age" name="age" class="form-control">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">프로필 사진</span> 
				<input type="file" id="img" name="file" class="form-control" accept="image/*">
			</div>
			<div>
				<input type="submit" value="등록"> 
				<input type="reset" value="취소">
			</div>
		</form>
		<br> 
		<a href="${root }/board">[게시판 둘러보기]</a>
	</div>
</body>
</html>