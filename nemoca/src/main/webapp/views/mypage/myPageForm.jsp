<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.contener {
	display: flex;
	justify-content: center;
}

.poto {
	background-image: url("/nemoca/images/am.jpg");
	display: inline-block;
	border: 1px solid;
	color: white;
	margin: 0.5rem;
	padding: 0;
	width: 200px;
	height: 200px;
	border-radius: 50%
}

ul>li {
	margin-right: 10px;
}

.list {
	width: 100%;
	height: 313px;
	margin-top: 10px;
	table-layout: fixed;
	border: 1px solid;
	padding: 10px;
}

th {
	height: 30px;

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
  	
  
}
.content {
}
.content li {
	margin-left: 12px;
	margin-right: 12px;
	padding: 10px;
}
.f {
	margin-top: 50px;
	margin-bottom: 100px;
}

</style>
</head>
<body>
<section class="f">
	<div class="contener">
		<div class="in">
			<ul class="var">
				<li><div class="poto"></div></li>
				<li><h2>${member.nickname}님, 환영합니다.</h2>
				 <a href="/nemoca/views/member/updateForm.pa?user_id=${member.user_id}"> 
					<span>내 정보 수정</span>
				</a> 
				</li>
			</ul>
		</div>
	</div>
		<div class="content">
			<ul class="content_main">
				<li>
					<h3>카페 좋아요</h3>
					<p>좋아요한 카페가 없습니다.</p>
					<table>
						<tr>
							<th>전시명</th>
							<th>장소</th>
						</tr>
						<tr>
							<td><a ></a></td>
							<td><a></a></td>
						</tr>
					</table>
				</li>
				<li>
					<h3>작성한 게시글</h3>
					<c:if test="${bdlist.size() == 0}">
						<p>작성한 게시글이 없습니다</p>
					</c:if>
					<c:if test="${bdlist.size() != 0}"> 
					<table>
						<tr>
							<th>제목</th>
							<th>내용</th>
						</tr>
						<c:forEach items="${bdlist}" var="bd">
						<tbody>
						<tr>
							<td><a href="/nemoca/views/board/boaedView.ha?user_id=${member.user_id}"></a>${bd.b_subject}</td>
							<td><a href="/nemoca/views/board/boaedView.ha?user_id=${member.user_id}"></a>${bd.b_content}</td>
						</tr>
						</tbody>
						</c:forEach>
					</table>
				</c:if>
				</li>
				<li>
					<h3>좋아요한 글</h3>
					<p>좋아요한 글이 없습니다</p>
					<table>
						<tr>
							<th>전시명</th>
							<th>장소</th>
						</tr> 
						<tr>
							<td><a></a></td>
							<td><a></a></td>
						</tr>
					</table>
				</li>
				<li>
					<h3>댓글</h3>
					<c:if test="${brdlist.size() == 0}">
					<p>작성한 댓글이 없습니다</p>
					</c:if>
					<c:if test="${brdlist.size() != 0}">
					<table>
						<tr>
							<th>제목</th>
							<th>작성날짜</th>
						</tr>
						<c:forEach items="${brdlist}" var="brd">
						<tbody> 
						<tr>
							<td><a href="/nemoca/views/board/boaedView.ha?user_id=${member.user_id}"></a>${brd.br_content}</td>
							<td><a href="/nemoca/views/board/boaedView.ha?user_id=${member.user_id}"></a>${brd.br_reg_date}</td>
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