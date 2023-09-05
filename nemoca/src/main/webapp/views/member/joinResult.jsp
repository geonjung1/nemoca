<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="service.member.*, java.io.PrintWriter"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:if test="${result > 0}">
		<script type="text/javascript">
			alert("회원가입이 완료되었습니다.")
			location.href = "loginForm.pa"
		</script>
	</c:if>

	<c:if test="${result == 0}">
		<script type="text/javascript">
			alert("회원가입이 실패하였습니다. \n 다시 시도해주세요.")
			history.back();
		</script>
	</c:if>

	<c:if test="${result < 0}">
		<script type="text/javascript">
			alert("이미 있는 회원입니다.")
			history.back();
		</script>
	</c:if>

</body>
</html>