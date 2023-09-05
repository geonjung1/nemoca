<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

@import
	url('https://fonts.googleapis.com/css2?family=Diphylleia&display=swap')
	;
.boardtitle {
	font-family: 'Diphylleia', serif;
	font-size: 60px;
	margin: auto;
	text-align: center;
	align-items: center;
	padding: 2px 0;
	width: 90%;
}	
	
</style>


<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
</head>
<body>

<div class="container-lg text-center">
		<img src='/nemoca/images/coffee.PNG' width="80px">
		<span class="boardtitle">좋아요 많은 게시글 3개</span><img
			src='/nemoca/images/coffee.PNG' width="80px">
		<br>
		

			

	

<!-- board list 최신순  -->
	<c:if test="${empty list4 }">
		<tr>
			<th colspan="5">게시글이 없습니다</th>
		</tr>
	</c:if>
	<c:if test="${not empty list4 }">
		<div class="row row-cols-1 row-cols-md-3 " >
			<c:forEach var="board" items="${list4 }">
				<c:set var="b_no" value="${b_no -1 }"></c:set>
				<div class="col">
					<div class="card h-100 border-info w-70 mb-3">
						<c:if test="${board.b_del == 'y' }">
							<img src="/nemoca/images/coffee.PNG" class="card-img-top"
								onclick="location.href='boardView.ha?b_no=${board.b_no}&pageNum=${currentPage }'"
								style="cursor: pointer">
							<div class="card-body"
								onclick="location.href='boardView.ha?b_no=${board.b_no}&pageNum=${currentPage }'"
								style="cursor: pointer">
								<h3 class="card-title">난 삭제된 글이야</h3>
							</div>
							<div class="card-footer">
								<small class="text-body-secondary">
								<div>조회수 : ${board.b_readcount }</div>
								<div>작성자 : ${board.user_id }</div>
								<div>작성일 : ${board.b_reg_date }</div>
								<div>좋아요갯수 : ${board.likes }</div>
								</small>
							</div>
						</c:if>
						<c:if test="${board.b_del != 'y' }">
							<img src="/nemoca/upload/${board.b_img1 }" class="card-img-top"
								onclick="location.href='boardView.ha?b_no=${board.b_no}&pageNum=${currentPage }'"
								style="cursor: pointer">
							<div class="card-body"
								onclick="location.href='boardView.ha?b_no=${board.b_no}&pageNum=${currentPage }'"
								style="cursor: pointer">
								<h3 class="card-title">${board.b_subject }</h3>
							</div>
							<div class="card-footer">
								<small class="text-body-secondary"> 
								<div>조회수 : ${board.b_readcount }</div>
								<div>작성자 : ${board.user_id }</div>
								<div>작성일 : ${board.b_reg_date }</div>
								<div>좋아요갯수 : ${board.likes }</div>
								</small>
							</div>
					</c:if>
					</div>
				</div>
			</c:forEach>
		</div>
	</c:if>
	<p><p>


		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>