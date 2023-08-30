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
게시글작성이안돼
<c:if test="${result>0 }">
		<script type="text/javascript">
		alert("게시글 작성 성공");
		location.href="/nemoca/views/board/boardMain.ha?pageNum=${pageNum}";
		</script>
	</c:if>
		<c:if test="${result==0 }">	
		<script type="text/javascript">
		alert("으이그 답답이 게시글 작성 실패");
		history.back();
		</script>
	</c:if>

</body>
</html>