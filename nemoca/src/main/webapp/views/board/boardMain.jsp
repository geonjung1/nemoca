<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
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

.pl {
	width: 97px;
	border: 1px solid #C4C4C4;
	box-sizing: border-box;
	border-radius: 10px;
	padding: 12px 13px;
	font-family: 'Diphylleia', serif;
	font-style: normal;
	font-weight: bold;
	font-size: 16px;
	line-height: 16px;
	background: url(/nemoca/images/underArrow.PNG) 93% no-repeat; /*화살표 이미지 삽입*/
	background-size: 20px;
	appearance: none;
	text-align: left;
}

.pl:focus {
	border: 1px solid #9B51E0;
	box-sizing: border-box;
	border-radius: 10px;
	outline: 3px solid #F8E4FF;
	border-radius: 10px;
}

.listbox {
	width: 200px;
	list-style: none;
	background: #FFFFFF;
	border: 1px solid #C4C4C4;
	box-sizing: border-box;
	box-shadow: 4px 4px 14px rgba(0, 0, 0, 0.15);
	border-radius: 10px;
	margin-top: 9px;
}
/* reset */
ul {
	margin: 0;
	padding: 0;
}

.filter{text-align:right}

</style>
<script type="text/javascript">

	$(document).ready(function(){
		$('.board_list').css("display", "none");
		$('#board_list1').css("display", "block");
	});
	
//필터 변경
function filterChange() {
	var filter = document.getElementById("filter");
	var value = filter.options[filter.selectedIndex].value;
	$('.board_list').css("display", "none");
	$('#board_list' + value).css("display", "block");
}

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
		<form action="/nemoca/views/board/board_searchResult.ha" method="post">
		<div class="input-group mb-3">
		
  <input type="text" name="srch" class="form-control" placeholder="검색할 내용을 입력하세요." aria-label="Recipient's username" aria-describedby="button-addon2">
  <button class="btn btn-outline-secondary" type="submit" id="button-addon2">게시글 제목이나 내용 검색</button>
</div></form>
<div class="filter">
				<select class="pl on" id="filter" onchange="filterChange()" onclick="select()">
				 <ul class="listbox" id="listbox">
					<li><option value="1">최신순</option></li>
					<li><option value="2">조회순</option></li>
					<li><option value="3">인기순</option></li>
				</ul>
				</select>
			</div><p>
			

	


<!-- board list 최신순  -->
<div class="board_list" id="board_list1">
	<c:if test="${empty list }">
		<tr>
			<th colspan="5">게시글이 없습니다</th>
		</tr>
	</c:if>
	<c:if test="${not empty list }">
		<div class="row row-cols-1 row-cols-md-3 g-4" >
			<c:forEach var="board" items="${list }">
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
	</div>
	
	<!-- board list 조회순  -->
<div class="board_list" id="board_list2">
	<c:if test="${empty list2 }">
		<tr>
			<th colspan="5">게시글이 없습니다</th>
		</tr>
	</c:if>
	<c:if test="${not empty list2 }">
		<div class="row row-cols-3 row-cols-md-3" >
			<c:forEach var="board" items="${list2 }">
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
	</div>
	
	<!-- board list 인기순  -->
<div class="board_list" id="board_list3">
	<c:if test="${empty list3 }">
		<tr>
			<th colspan="5">게시글이 없습니다</th>
		</tr>
	</c:if>
	<c:if test="${not empty list3 }">
		<div class="row row-cols-3 row-cols-md-3" >
			<c:forEach var="board" items="${list3 }">
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
	</div>
	
	
	<div align="center">
	
		<nav aria-label="...">	
  <ul class="pagination pagination-lg justify-content-center">
   <c:if test="${pageNum > 1}">
  <li class="page-item">
      <a class="page-link" href="boardMain.ha?pageNum=${currentPage - 1}">Previous</a>
    </li>   </c:if>
    <li class="page-item" aria-current="page" >
    <c:forEach var="i" begin="${startPage}" end="${endPage}">
      <span class="page-link" onclick="location.href='boardMain.ha?pageNum=${i}'"
      onmouseover="style='cursor:pointer'">${i }</span>
     
    </li> </c:forEach>
    
<li class="page-item">
<c:if test="${currentPage < totalPage}">
      <a class="page-link" href="boardMain.ha?pageNum=${currentPage + 1}">Next</a>
      	</c:if>
    </li>	
  </ul>
</nav>
		

	</div>
	<br>
</div>

<!-- 	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script> -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
	
</body>
</html>