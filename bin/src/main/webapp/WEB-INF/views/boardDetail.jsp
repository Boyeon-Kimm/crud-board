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
		<h1>제목</h1>
		<div>${board.title }</div>
		<h2>작성자</h2>
		<div>${board.id }</div>
		<h2>내용</h2>
		<div>${board.content }</div>
		<c:if test="${board.id eq loginUser.id}">
			<form method="GET" action="modifyBoard" enctype="multipart/form-data">
				<input type="hidden" id="title" name="title" value="${board.title }" class="form-control">
				<input type="hidden" id="no" name="no" value="${board.no }" class="form-control">
				<input type="hidden" id="content" name="content" value="${board.content }" class="form-control">
				<input type="submit" value="수정하기" class="btn btn-warning">
			</form>
		</c:if>
		<br><a href="${root }/board" class="btn btn-primary">게시판으로 돌아가기</a>
		<div>
			<form method="POST" action="writeComment">
				<input type="hidden" id="boardNo" name="boardNo" value="${board.no }">
				<input type="hidden" id="id" name="id" value="${loginUser.id }">
				<input type="text" id="content" name="content" placeholder="댓글 입력" class="form-control">
				<input type="submit" value="댓글 달기" class="btn btn-primary">
			</form>
		</div>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>작성자</th>
					<th>내용</th>
					<th>작성 날짜</th>
					<th>수정 날짜</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${comments }" var="comment" varStatus="vs">
					<tr>
						<td>${comment.id }</td>						
						<td>${comment.content }</td>						
						<td>${comment.generatedDate }</td>						
						<td>
							${comment.modifiedDate }
							<c:if test="${comment.generatedDate ne comment.modifiedDate}">
								<span>(수정됨)</span>
							</c:if>
						</td>
						<td>
							<c:if test="${comment.id eq loginUser.id || loginUser.id eq 'administrator'}">
								<form method="GET" action="deleteComment" enctype="multipart/form-data">
									<input id="boardNo" name="boardNo" value="${board.no }" class="form-control" type="hidden">
									<input id="commentNo" name="commentNo" value="${comment.commentNo }" class="form-control" type="hidden">
									<input type="submit" value="삭제하기" style="board:none;">
								</form>
								<form method="GET" action="modifyComment" enctype="multipart/form-data">
									<input id="boardNo" name="boardNo" value="${board.no }" class="form-control" type="hidden">
									<input id="commentNo" name="commentNo" value="${comment.commentNo }" class="form-control" type="hidden">
								<input type="submit" value="수정하기" style="board:none;">
							</form>
							</c:if>
						</td>						
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>