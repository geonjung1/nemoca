<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result>0 }">
	<script type="text/javascript">
		alert("댓글 삭제 성공!!")
		location.href="boardView.ha?b_no=${b_no}"
	</script>
</c:if>

<c:if test="${result==0 }">
	<script type="text/javascript">
		alert("삭제 실패\n다시 시도해주세요");
		history.go(-1);
	</script>
</c:if>
</body>
</html>