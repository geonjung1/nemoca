<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
table {
	border-collapse: collapse;
	table-layout: fixed;
}

table th {
	border-bottom: solid 1px;
	font-size: 16px;
	height: 48px;
	min-width: 130px;
	text-align: center;
}

table td {
	height: 48px;
	font-size: 14px;
	font-weight: 500;
	text-align: center;
	width: 15%;
	border-bottom: 1px solid #e6e6e6;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
}

.btn_small {
	display: contents;
	width: initial;
	height: initial;
	font-size: 14px;
	text-align: right;
	padding: 0;
	margin: 0;
	border: 0;
	color: #aaa;
	font-weight: 500;
	text-decoration: underline;
}
</style>

<script type="text/javascript">
	
</script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">

</head>
<body>

	<div class="container-table">
		<table>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>닉네임</th>
				<th>이메일</th>
				<th>핸드폰</th>
				<th>비밀번호</th>
				<th>지역</th>
				<th>연령대</th>
				<th>성별</th>
				<th>가입일</th>
				<th>탈퇴여부</th>
			</tr>
			<c:if test="${empty list} ">
				<tr>
					<th colspan="13">회원 데이터가 존재하지 않습니다</th>
				</tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="member" items="${list }">
					<tr>
						<td>${member.user_id}</td>
						<td>${member.name}</td>
						<td>${member.nickname}</td>
						<td>${member.email}</td>
						<td>${member.tel}</td>
						<td>${member.pass}</td>
						<td>${member.addr}</td>
						<td>${member.age}</td>
						<td>${member.gender}</td>
						<td>${member.join_date}</td>
						<td>${member.del}</td>
						<td><a
							href="../member/updateForm.pa?user_id=${member.user_id}"
							class="btn btn_small">수정 및 탈퇴</a></td>
					</tr>
				</c:forEach>
			</c:if>

		</table>
	</div>

	<nav aria-label="...">

		<ul class="pagination pagination-lg justify-content-center">
			<c:if test="${pageNum > 1}">
				<li class="page-item"><a class="page-link"
					href="memberList.pa?pageNum=${currentPage - 1}">Previous</a></li>
			</c:if>

			<li class="page-item active" aria-current="page"><c:forEach
					var="i" begin="${startPage}" end="${endPage}">
					<span class="page-link"
						onclick="location.href='memberList.pa?pageNum=${i}'"
						onmouseover="style='cursor:pointer'">${i }</span></li>
			</c:forEach>

			<li class="page-item"><c:if test="${currentPage < totalPage}">
					<a class="page-link"
						href="memberList.pa?pageNum=${currentPage + 1}">Next</a>
				</c:if></li>

		</ul>
	</nav>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
		crossorigin="anonymous"></script>

</body>
</html>