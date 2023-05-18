<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정</title>
<style>
label {
	display: inline-block;
	width: 80px;
}

textarea {
	width: 100%;
}
</style>
</head>
<body>
	<div class="container">
		<h1>글 수정</h1>
		<form method="post" action="modifyBoard" enctype="multipart/form-data">
			<input type="hidden" id="no" name="no" value="${board.no }" class="form-control">
			<div class="input-group mb-12">
				<span class="input-group-text">제목</span> 
				<input type="text" id="title" name="title" class="form-control" value="${board.title }" style="width:300px;">
			</div>
			<div class="input-group mb-12">
				<span class="input-group-text">글 작성</span> 
				<input type="text" id="content" name="content" class="form-control" value="${board.content }" style="width:300px; height:200px;">
			</div>
			<input type="submit" value="등록"> 
			<input type="reset" value="초기화">
		</form>
		<a href="${root }/board">돌아가기</a>
	</div>
</body>
</html>