<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

@import
	url('https://fonts.googleapis.com/css2?family=Diphylleia&display=swap')
	;
/* font-family: 'Diphylleia', serif; */
* {
	font-family: "Diphylleia";
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

.contener {
	display: flex;
	justify-content: center;
}

.poto {
	display: inline-block;
	border: 1px solid;
	color: white;
	margin: 0.5rem;
	padding: 0;
	width: 200px;
	height: 200px;
	border-radius: 50%;
}

.in {
	width: 1300px;
	margin: 0 auto;
}

.var {
	flex-direction: row;
	align-items: center;
	justify-content: center;
	display: flex;
}

.content_main {
	float: center;
	text-align: center;
	display: flex;
	justify-content: center;
	margin-top: 18px;
	border: 2px;
	width: 1200px;
	
}

.content {
	display: flex;
    justify-content: center;
}

.content li {
	margin-left: 12px;
	margin-right: 12px;
	padding: 10px;
	width:300px;
}

.f {
	margin-top: 50px;
	margin-bottom: 100px;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 5px;
	table-layout: fixed;
}

table th {
	font-size: 14px;
	font-weight: 600;
	border-bottom: 1px solid #999;
	padding: 3px 5px;
}

th:nth-child(1), td:nth-child(1) {
	width: 70%;
	border-right: 1px solid #e4e4e4;
}

table td {
	font-size: 14px;
	border-bottom: 1px solid #e4e4e4;
	padding: 3px 5px;
}

table td a {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}
table tr td {
	text-overflow:ellipsis;
	white-space:nowrap;
	max-width:140px;
	table-layout: fixed;
	overflow: hidden;
}

</style>

</head>
<body>
	<section class="f">
		<div class="contener">
			<div class="in">
				<ul class="var">
						<li><div><img class="poto" src="/nemoca/upload/${member.user_img }" alt="프로필사진"></div></li>
					<li><h2>${member.nickname}님,환영합니다.</h2>
						<c:if test="${member.user_id != 'master' }">
						<a href="/nemoca/views/member/updateForm.pa?user_id=${member.user_id}">
							<span>내 정보 수정</span>
						</c:if>
						<c:if test="${member.user_id == 'master' }">
						<a href="/nemoca/views/master/memberList.pa?user_id=${member.user_id}">
							<span>회원 목록 관리</span>
						</c:if>
					</a></li>
				</ul>
			</div>
		</div>
		<div class="content">
			<ul class="content_main">
				<li class="content_box">
					<h3>카페 좋아요</h3>
					 <c:if test="${cllist.size() == 0}">
						<p>좋아요한 카페가 없습니다</p>
					</c:if> <c:if test="${cllist.size() != 0}">
					<table>
						<tr>
							<th>카페이름</th>
							<th>주소</th>
						</tr>
						<c:forEach items="${cllist}" var="cl">
						<tr>
							<td><a href="/nemoca/views/cafe/cafeView.yo?user_id=${member.user_id}"></a>${cl.c_name}</td>
							<td><a href="/nemoca/views/cafe/cafeView.yo?user_id=${member.user_id}"></a>${cl.c_addr}</td>
						</tr>
						</c:forEach>
					</table>
					</c:if>
				</li>
				<li class="content_box">
					<h3>작성한 게시글</h3> <c:if test="${bdlist.size() == 0}">
						<p>작성한 게시글이 없습니다</p>
					</c:if> <c:if test="${bdlist.size() != 0}">
						<table>
							<tr>
								<th>제목</th>
								<th>내용</th>
							</tr>
							<c:forEach items="${bdlist}" var="bd">
								<tbody>
									<tr>
										<td><a
											href="/nemoca/views/board/boaedView.ha?user_id=${member.user_id}"></a>${bd.b_subject}</td>
										<td><a
											href="/nemoca/views/board/boaedView.ha?user_id=${member.user_id}"></a>${bd.b_content}</td>
									</tr>
								</tbody>
							</c:forEach>
						</table>
					</c:if>
				</li>
				<li class="content_box">
					<h3>좋아요한 글</h3>
					 <c:if test="${bllist.size() == 0}">
						<p>좋아요한 글이 없습니다</p>
					 </c:if>
					 <c:if test="${bllist.size() != 0}">
					 <table>
							<tr>
								<th>제목</th>
								<th>작성날짜</th>
							</tr>
					<c:forEach items="${bllist}" var="bl">
								<tbody>
									<tr>
										<td> 
										<a href="/nemoca/views/board/boaedView.ha?user_id=${member.user_id}"></a>${bl.b_subject}</td>
										<td><a href="/nemoca/views/board/boaedView.ha?user_id=${member.user_id}"></a>${bl.b_reg_date}</td>
									</tr>
								</tbody>
					</c:forEach>
					</table>
					</c:if>
				</li>
				
				<li class="content_box">
					<h3>댓글</h3> <c:if test="${brdlist.size() == 0}">
						<p>작성한 댓글이 없습니다</p>
					</c:if> <c:if test="${brdlist.size() != 0}">
						<table>
							<tr>
								<th>제목</th>
								<th>작성날짜</th>
							</tr>
							<c:forEach items="${brdlist}" var="brd">
								<tbody>
									<tr>
										<td><a
											href="/nemoca/views/board/boaedView.ha?user_id=${member.user_id}"></a>${brd.br_content}</td>
										<td><a
											href="/nemoca/views/board/boaedView.ha?user_id=${member.user_id}"></a>${brd.br_reg_date}</td>
									</tr>
								</tbody>
							</c:forEach>
						</table>
					</c:if>
				</li>
			</ul>
		</div>
	</section>
</body>
</html>