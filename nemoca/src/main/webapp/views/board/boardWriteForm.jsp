<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.board_title {
	font-family: 'Diphylleia', serif;
	font-size: 60px;
	margin: auto;
	text-align: center;
	align-items: center;
	padding: 100px 0;
}

.board_body {
	font-family: 'Diphylleia', serif;
	font-size: 20px;
	display: flex;
	justify-content: center;
}
</style>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
</head>
<body class="p-3 m-0 border-0 bd-example m-0 border-0">
	<div class="board_title">
		<img src='/nemoca/images/coffee.PNG' width="80px">게시글 작성하기<img
			src='/nemoca/images/coffee.PNG' width="80px">
		<div onclick="location.href='/nemoca/views/board/boardWriteForm.ha'">
			<button type="button" class="btn btn-dark">글쓰기</button>
		</div>
	</div>

	<form action="/nemoca/views/board/boardWrite.ha" method="post" enctype="multipart/form-data">
		<div class="board_body">
			<div class="card mb-3" style="max-width: 1000px;">
				<div class="row g-0">
					<div class="col-md-8">
						<div class="card-body">
						
							<div class="input-group flex-nowrap">
								<span class="input-group-text" >제목</span> <input name="b_subject" 
									type="text" class="form-control" placeholder="subject" required="required">
							</div>
							<p>
							
							<div class="input-group mb-3">
								<input type="file" class="form-control" name="b_img1" required="required">
							</div>
							<p>
							<div class="input-group flex-nowrap">
								<span class="input-group-text">내용</span>
								<textarea rows="5" cols="40" name="b_content" required="required"></textarea>
							</div>
							<p>
							<div style="text-align: center">
								<h4><input type="submit" value="게시글 작성"></h4>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</form>

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