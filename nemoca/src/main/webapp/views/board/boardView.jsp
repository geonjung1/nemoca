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

* {
	font-family: 'Diphylleia', serif;
}

.card-img-top {
	width: 850px;
	height: 350px;
	object-fit: none;
}

.re_reply {
	display: none;
}
</style>

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

<script type="text/javascript">

const myModal = new bootstrap.Modal(document.getElementById('myModal'), options)
//or
const myModalAlternative = new bootstrap.Modal('#myModal', options)

/* 	$(function() {
	    $(".btn-secondary").on("click", function() {
	        $(".re_reply").toggle();
	    })
	}) */


	function sessionChk() {
		if (${empty user_id}){
			var con = confirm("로그인하고 댓글 입력하세요.");
			return;
		}
	}

	function sessionChk(name) {
		if (${empty user_id}) {
			var con = confirm("로그인 후 이용해 주시기 바랍니다.");
			if (con) {
				location.href = "/nemoca/views/member/loginForm.pa";
			} 
		} else {
			// 게시글 좋아요 클릭
			if (name == 'like') {
					$.post("board_likeCnt.ha", "b_no=${board.b_no}", function(data) {
					var likes = data.split(",")[0];
					var imgSrc = data.split(",")[1];
					$(".likes_cnt").text(likes);
					$(".likes_cnt").siblings("img").attr("src", imgSrc);
					location.reload();
				});
			}
		}
	}
	function delBoard() {
		var con = confirm("삭제 하시겠습니까?");
		if (con) {
			location.href = "boardDelete.ha?b_no=${board.b_no}";
		}
	}

	// 댓글 삭제
	function delReply(br_re_no) {
		var con = confirm("삭제 하시겠습니까?");
		if(con) {
			location.href="board_reDelete.ha?b_no=${board.b_no}&br_re_no=" + br_re_no;
		}
	}  
	
	
</script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<div class="row">
			<!-- Blog entries-->
			<div class="col-lg-12">
				<!-- Featured blog post-->
				<div class="card mb-4">
					<img class="card-img-top" src="/nemoca/upload/${board.b_img1 }"
						alt="..." />
					<div class="card-body">
						<div class="small text-muted">${board.b_reg_date}</div>
						<h2 class="card-title">${board.b_subject }</h2>
						<p class="card-text">${board.b_content }</p>

						<div>
							조회수 : ${board.b_readcount }<br> 작성자 : ${board.user_id }<br>
							<a><img onclick="sessionChk('like')" style="width: 30px;"
								src="${imgSrc }"></a> ${board.likes }
						</div>
						<c:if test="${user_id == board.user_id }">
							<div class="d-grid gap-2 d-md-flex justify-content-md-end">

								<a href="boardUpdateForm.ha?b_no=${board.b_no }">
									<button class="btn btn-success me-md-2 update_frm_show"
										type="button">수 정</button>
								</a>
								<button class="btn btn-danger" type="button"
									onclick="delBoard()">삭 제</button>
							</div>
						</c:if>
					</div>
				</div>
				<!-- Nested row for non-featured blog posts-->

				<!-- Pagination-->

			</div>
			<!-- Side widgets-->


			<br>

			<c:if test="${empty list }">
				<p>댓글이 없습니다.</p>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="board_re" items="${list }">


					<c:if test="${board_re.br_ref_level == 0 }">
						<!-- 댓글일때  -->
						<div class="comment-widgets" style="width: 100%">
							<!-- Comment Row -->
							<div class="d-flex p-2 comment-row m-t-0">
								<div class="p-2">
									<img src="/nemoca/upload/${board_re.user_img }" alt="user"
										width="120" class="rounded-circle">
								</div>
								<div class="comment-text w-100">
									<h4 class="font-medium">${board_re.user_id }</h4>
									<span class="m-b-15 d-block">${board_re.br_content }<br>
									<br></span>
									<div class="comment-footer">
										<span class="text-muted float-right">${board_re.br_reg_date }</span>
										
										<c:if test="${not empty user_id }">
										<button type="button" class="btn btn-primary btn-sm">
											<a
												href="board_reUpdateForm.ha?br_re_no=${board_re.br_re_no }">수정</a>
										</button>
										<button type="button" class="btn btn-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal"
										>답글</button>
										<button type="button" class="btn btn-danger btn-sm"
											onclick="delReply(${board_re.br_re_no })">삭제</button>
											</c:if>
											
									</div>
								</div>
							</div>
							<!-- Comment Row -->
					</c:if>
					<c:if test="${board_re.br_ref_level != 0 }">
						<!-- 답글일때  -->
						<div class="d-flex p-2 comment-row m-t-0">

							<div class="p-2">
								<img src="/nemoca/images/reply.PNG" alt="user" width="120"
									class="rounded-circle">
							</div>
							<div class="p-2">
								<img src="/nemoca/upload/${board_re.user_img }" alt="user"
									width="120" class="rounded-circle">
							</div>
							<div class="comment-text w-100">
								<h4 class="font-medium">${board_re.user_id }</h4>
								<span class="m-b-15 d-block">${board_re.br_content }<br>
								<br></span>
								<div class="comment-footer">
									<span class="text-muted float-right">${board_re.br_reg_date }</span>
									
									<c:if test="${board.user_id == user_id }">
									<button type="button" class="btn btn-primary btn-sm">
										<a href="board_reUpdateForm.ha?br_re_no=${board_re.br_re_no }">수정</a>
									</button>
<!-- 									<button type="button" class="btn btn-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal"
										>답글</button> -->
									<button type="button" class="btn btn-danger btn-sm"
										onclick="delReply(${board_re.br_re_no })">삭제</button>
										</c:if>
										
								</div>
							</div>

						</div>
						<!-- Comment Row -->
					</c:if>
					<div class="re_reply">
						<form
							action="board_reWrite.ha?b_no=${board.b_no }&br_re_no=${board_re.br_re_no }&br_ref=${board_re.br_ref}&br_ref_level=${board_re.br_ref_level}&br_ref_step=${board_re.br_ref_step}"
							method="post">
							<div class="input-group mb-3">

								<input type="text" class="form-control" name="br_content"
									placeholder="답글 내용을 쓰세요!" aria-label="Recipient's username"
									aria-describedby="button-addon2">

								<button class="btn btn-outline-secondary" type="submit"
									id="button-addon2">답글 입력하기!</button>
							</div>
						</form>
					</div>


					<hr>

<!-- Modal -->
<form action="board_reWrite.ha?b_no=${board.b_no }&br_re_no=${board_re.br_re_no }&br_ref=${board_re.br_ref}&br_ref_level=${board_re.br_ref_level}&br_ref_step=${board_re.br_ref_step}"
							method="post">
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">답글 입력 칸</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <input type="text" class="form-control" name="br_content"
									placeholder="답글 내용을 쓰세요!" aria-label="Recipient's username"
									aria-describedby="button-addon2">
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-secondary" data-bs-dismiss="modal">
        답글 입력하기!</button>
        
      </div>
    </div>
  </div>
</div>
</form>


				</c:forEach>
				



			</c:if>
			<p>
			<p>
		</div>
		<!-- Card -->


		<form
			action="board_reWrite.ha?b_no=${board.b_no}&br_re_no=0&br_ref=0&br_ref_level=0&br_ref_step=0"
			method="post">
			<div class="input-group mb-3">
				<input type="text" name="br_content" class="form-control"
					placeholder="댓글 내용을 쓰세요!" aria-label="Recipient's username"
					aria-describedby="button-addon2">
				<button class="btn btn-outline-secondary" type="submit"
					id="button-addon2">댓글 입력하기!</button>
			</div>
		</form>

		<!-- 복사한곳여기 -->


	</div>
</div>
	<!-- 	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script> -->

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
		
		
</body>
</html>