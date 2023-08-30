<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("로그인이 되었습니다.")
		location.href="/nemoca/views/display/main.ha";
	</script>
</c:if>

<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("비밀번호를 잘못 입력하셨습니다.")
		history.back();
	</script>
</c:if>

<c:if test="${result == -1 }">
	<script type="text/javascript">
		alert("아이디를 잘못 입력하셨거나 없는 아이디 입니다.")
		history.go(-1);
	</script>
</c:if>

</body>
</html>