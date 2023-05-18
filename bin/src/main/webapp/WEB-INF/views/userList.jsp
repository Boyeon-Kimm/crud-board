<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%-- jstl의 core 라이브러리를 사용하기 위해 taglib를 이용한다. --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div class="container">
		<%@ include file="/WEB-INF/views/include/searchUser.jsp"%>
		<h1>유저 목록</h1>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>프로필 사진</th>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>이름</th>
					<th>이메일</th>
					<th>나이</th>
					<th>유저 삭제하기</th>
				</tr>
			</thead>
			<tbody>
				<%-- request 영역에 books로 등록된 자료를 반복문을 이용해 출력한다. --%>
				<c:forEach items="${users }" var="user" varStatus="vs">
					<tr>
						<c:if test="${not empty user.img}">
							<td><img id="img"src="${root }/resources/upload/${user.img }" width="100" height="100"></td>
						</c:if>
						<c:if test="${empty user.img}">
							<td></td>
						</c:if>
						<td>${user.id }</td>
						<td>${user.password }</td>
						<td>${user.name }</td>
						<td>${user.email }</td>
						<td>${user.age }</td>
						<td>
							<c:if test="${user.id ne 'administrator' }">
								<form method="GET" action="deleteUser" enctype="multipart/form-data">
									<input id="id" name="id" value="${user.id }" class="form-control" type="hidden">
									<input type="submit" value="삭제하기" style="board:none;">
								</form>
							</c:if>
							<form method="GET" action="modifyUser" enctype="multipart/form-data">
								<input id="id" name="id" value="${user.id }" class="form-control" type="hidden">
								<input type="submit" value="수정하기" style="board:none;">
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<br> <a href="${root }/regist">추가 등록</a>
	</div>
</body>
</html>