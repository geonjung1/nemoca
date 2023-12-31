<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" 
	content="width=device-width, initial-scale=1">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


@import
	url('https://fonts.googleapis.com/css2?family=Diphylleia&display=swap')
	;

.btn btn-light {
	width: 3px;
}

.card-footer {
	text-align: right;
	font-family: 'Diphylleia', serif;
}

.card-title {
	font-family: 'Diphylleia', serif;
	text-align: left;
}

.boardtitle {
	font-family: 'Diphylleia', serif;
	font-size: 60px;
	margin: auto;
	text-align: center;
	align-items: center;
	padding: 2px 0;
	width: 90%;
}

.card-img-top {
	width: auto;
	height: 250px;
	object-fit: none;
}
.e {
	height: 33vh;
	margin-top: 180px; 
}
</style>
<script type="text/javascript">
//세션 확인
function sessionChk() {
	if (${empty user_id}) {
		var con = confirm("로그인 후 이용해 주시기 바랍니다.");
		if (con) {
			location.href = "/nemoca/views/member/loginForm.pa";
		}
	} else {
		location.href = "/nemoca/views/board/boardWriteForm.ha";
	}
}
function srchchk() {
	if(!frm.srch.value) {
		alert("검색어를 입력하세요");
		frm.srch.focus();
		return false;
	}
} 
</script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
</head>
<body>
	<div class="container-lg text-center">
		
		<span class="boardtitle">게 시 판</span>
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<button type="button" class="btn btn-dark "
				onclick="sessionChk()">글쓰기</button>
		</div><br>
		<form action="/nemoca/views/board/board_searchResult.ha" method="post" onsubmit="return srchchk()" name="frm">
		<div class="input-group mb-3">
		
  <input type="text" name="srch" class="form-control" placeholder="검색할 내용을 입력하세요." aria-label="Recipient's username" aria-describedby="button-addon2">
  <button class="btn btn-outline-secondary" type="submit" id="button-addon2">게시글 제목 검색</button>
</div></form>
	



	<c:if test="${bdList.size() == 0}">
		<div class="e">
		<tr>
			<th colspan="5">검색 결과가 없습니다.</th>
		</tr>
		</div>
	</c:if>
	<c:if test="${bdList.size() != 0 }">
		<div class="row row-cols-3 row-cols-md-3" >
			<c:forEach var="board" items="${bdList }">
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
								</small>
							</div>
						</c:if>
					</div>
				</div>
			</c:forEach>
		</div>
	</c:if>
	<p><p>
	<div align="center">
	
		
<%-- 			<nav aria-label="...">
  <ul class="pagination pagination-lg justify-content-center">
    <li class="page-item" aria-current="page" >
    <c:forEach var="i" begin="${startPage}" end="${endPage}">
      <span class="page-link" onclick="location.href='boardMain.ha?pageNum=${i}'"
      onmouseover="style='cursor:pointer'">${i }</span>
     
    </li> </c:forEach>
  </ul>
</nav>
	 --%>	

	</div>
	<br>
</div>

<!-- 	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script> -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
		crossorigin="anonymous"></script>
</body>
</html>