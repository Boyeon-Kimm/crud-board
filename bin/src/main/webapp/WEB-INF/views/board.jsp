<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%-- jstl의 core 라이브러리를 사용하기 위해 taglib를 이용한다. --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 목록</title>
</head>
<body>
	<div class="container">
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
		<h1>글 목록</h1>
		<%@ include file="/WEB-INF/views/include/searchBoard.jsp"%>
		<a href="${root }/write">글 작성하기</a>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>작성자</th>
					<th>제목</th>
					<th>작성 시각</th>
					<th>가장 최근 수정한 시각</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<!-- 공지사항 먼저 출력 -->
				<c:forEach items="${notice }" var="n" varStatus="vs">
					<tr>
						<td>
							<span>관리자</span>
						</td>
						<td>
							<form method="GET" action="boardDetail" enctype="multipart/form-data">
								<input id="no" name="no" value="${n.no }" class="form-control" type="hidden">
								<input type="submit" value="${n.title }">
							</form>
						</td>
						<td>${n.generatedDate }</td>
						<td>
						<span>${n.modifiedDate }</span>
							<c:if test="${n.generatedDate ne n.modifiedDate }">
								<span>(수정됨)</span>
							</c:if>
						</td>
						<c:if test="${loginUser.id eq 'administrator'}">
							<td>
								<form method="GET" action="deleteBoard" enctype="multipart/form-data">
									<input id="no" name="no" value="${n.no }" class="form-control" type="hidden">
									<input type="submit" value="삭제하기" style="board:none;">
								</form>
							</td>
						</c:if>
						<c:if test="${loginUser.id ne b.id }">
							<td></td>
						</c:if>
					</tr>
				</c:forEach>
				
				<!-- 공지사항 외 게시글 출력 -->
				<c:forEach items="${board }" var="b" varStatus="vs">
					<tr>
						<td>
							<c:if test="${b.id eq 'administrator' }">
								<span>관리자</span>
							</c:if>
							<c:if test="${b.id ne 'administrator' }">
								<span>${b.id }</span>
							</c:if>
						</td>
						<td>
							<form method="GET" action="boardDetail" enctype="multipart/form-data">
								<input id="no" name="no" value="${b.no }" class="form-control" type="hidden">
								<input type="submit" value="${b.title }" style="board:none;">
							</form>
						</td>
						<td>${b.generatedDate }</td>
						<td>
						<span>${b.modifiedDate }</span>
							<c:if test="${b.generatedDate ne b.modifiedDate }">
								<span>(수정됨)</span>
							</c:if>
						</td>
						<c:if test="${loginUser.id eq b.id || loginUser.id eq 'administrator'}">
							<td>
								<form method="GET" action="deleteBoard" enctype="multipart/form-data">
									<input id="no" name="no" value="${b.no }" class="form-control" type="hidden">
									<input type="submit" value="삭제하기" style="board:none;">
								</form>
							</td>
						</c:if>
						<c:if test="${loginUser.id ne b.id }">
							<td><div></div></td>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>