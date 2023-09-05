<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*, dao.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	MemberDao md = MemberDao.getInstance();
	
	for (int i = 1; i <= 100; i++) {
		Member member = new Member();
		
		member.setUser_id("naemoca"+i);
		member.setName("김"+i);
		member.setNickname("닉네임"+i);
		member.setEmail("a"+i);
		member.setTel("010-2222-"+(1000+i));
		member.setPass("12345678");
		member.setAddr("부천");
		member.setAge(10);
		member.setGender("M");
	
		md.insert(member);
	}
%>

</body>
</html>