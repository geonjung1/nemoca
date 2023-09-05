<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.btnGray60 {
	color: white;
	border: 1px solid #666666;
	min-width: 80px;
	height: 40px;
	border-radius: 5px;
	padding: 15px 28px;
	font-size: 12px;
	line-height: 16px;
	font-weight: 700;
	background-color: #222222;
}

.btnRegist {
	width: 86px;
	padding: 15px 0;
	padding-top: 12px;
	padding-right: 0px;
	padding-bottom: 15px;
	padding-left: 0px;
	margin-top: 3px;
}

.find-re {
	text-align: center;
}

div {
	text-align: center;
}
</style>

</head>
<body>
	<form action="loginForm.pa" method="post">
		<div class="find-re">
			<h1 class="title">아이디 찾기 결과</h1>
			<c:if test="${member != null }">
		아이디는 ${member.user_id } 입니다.
	</c:if>

			<c:if test="${member == null }">
		존재하지 않는 회원 정보 입니다.
	</c:if>
		</div>

		<div>
			<input type="submit" value="로그인 하러 가기" class="btnGray60 btnRegist">
		</div>
	</form>
</body>
</html>