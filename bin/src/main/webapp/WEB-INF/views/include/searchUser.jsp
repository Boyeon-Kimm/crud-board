<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.ssafy.board.model.dto.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#nav-header {
	display: flex;
	justify-content: space-between;
}
.nav-search{
	width:50%;	
}

.nav-search span {
	margin-left: 10px;
	border: solid black 1px;
	padding: 5px;
}


</style>
<div id="nav-header">
	<%-- session에서 loginUser를 가져와서 존재 여부에 따라 로그인 폼 또는 사용자 정보를 출력한다. --%>
	<div class="nav-search">
		<form action="searchUser" method="get">
			<!-- 검색 기능 목록 작성 -->
			<label>검색 기준: </label>
			<select name="key" class="form-select">
				<option value="none">없음</option>
				<option value="id">아아디</option>
				<option value="name">이름</option>
				<option value="email">이메일</option>
				<option value="age">나이</option>
			</select>
			
			<label>검색어: </label>
			<input type="text" name="word" class="form-control"/>
			
			<label>정렬 기준: </label>
			<select name="orderBy" class="form-select">
				<option value="none">없음</option>
				<option value="id">아아디</option>
				<option value="name">이름</option>
				<option value="email">이메일</option>
				<option value="age">나이</option>
			</select>
			
			<label>정렬 방향: </label>
			<select name="orderByDir" class="form-select">
				<option value="asc">오름차순</option>
				<option value="desc">내림차순</option>
			</select>
			
			<input type="submit" value="검색" class="btn btn-primary">
		</form>
	</div>
</div>
