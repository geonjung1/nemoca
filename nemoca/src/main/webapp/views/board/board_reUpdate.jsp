<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result>0 }">
		<script type="text/javascript">
			alert("댓글 수정 성공!!")
			history.go(-2);
		//	window.location = document.referrer; 뒤로한칸가고새로고침
		</script>
	</c:if>

	<c:if test="${result==0} ">
		<script type="text/javascript">
			alert("수정 실패\n다시 시도해주세요")
			history.back();
		</script>
	</c:if>
</body>
</html>