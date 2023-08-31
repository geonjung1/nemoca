<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
	integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ"
	crossorigin="anonymous">
<style type="text/css">
.search {
	height: 500px;
	display: flex;
	flex-direction: row;
	align-items: center;
	justify-content: center;
	background-color: cyan;
	background-image: url("/nemoca/images/mainC.jpg");
}

.mid {
	display: flex;
	justify-content: space-between;
}

.col {
	display: inline-block;
	text-align: justify;
	margin-top: 30px;
}

.card-body {
	position: absolute;
	color: white;
	text-align: center;
	top: 40%;
	left: 30%;
}

.list_the {
	margin-left: 20px;
}

.search_css {
	width: 30%;
	height: 55px;
}

input {
	margin: 0;
	border-radius: 10px;
}

input[type="text"] {
	width: 70%;
	height: 100%;
	border: none;
	font-size: 1em;
	padding-left: 5px;
	font-style: oblique;
	display: inline;
	outline: none;
	box-sizing: border-box;
	color: black;
	box-shadow: 30px;
}

button[type=submit] {
	width: 35%;
	height: 100%;
	background-color: lightgray;
	border: none;
	background-color: black;
	font-size: 1em;
	color: #042AaC;
	outline: none;
	display: inline;
	margin-left: -10px;
	box-sizing: border-box;
	right: -1px;
	top: 0;
	position: absolute;
	color: white;
	margin: 0;
	border-radius: 10px;
}

button[type=submit]:hover {
	background-color: lightgray;
}

.search_css {
	position: relative;
}
</style>
<script type="text/javascript">
	function chk() {
		if (!frm.srch.value) {
			alert("검색어를 입력하세요");
			frm.srch.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<form action="/nemoca/views/cafe/cafeSearch.le"
		onesubmit="return chk()" method="post" name="frm">
		<div class="search">
			<fieldset class="search_css">
				<input type="text" name="srch" placeholder="검색어를 입력해주세요">
				<button type="submit">검색</button>
			</fieldset>
		</div>
	</form>
	<section class="all">
		<div class="mid">
			<h2 class="list_the">카페리스트</h2>
		</div>
		<div class="mycard container-fluid">
			<div class="row row-cols-1 row-cols-md-3 g-4">
				<div class="col">
					<div class="card h-100">
						<img src="/nemoca/images/cum22.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">디저트가 맛있는 카페 10선</h5>
							<p class="card-text">내용</p>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card h-100">
						<img src="/nemoca/images/할아버지1.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">이색 카페 10선</h5>
							<p class="card-text">내용</p>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card h-100">
						<img src="/nemoca/images/p6.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">애견 카페 10선</h5>
							<p class="card-text">내용</p>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card h-100">
						<img src="/nemoca/images/p7.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">힙한 카페 10선</h5>
							<p class="card-text">내용</p>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card h-100">
						<img src="/nemoca/images/p8.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">비건 카페 10선</h5>
							<p class="card-text">내용</p>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card h-100">
						<img src="/nemoca/images/p9.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">LP 카페 10선</h5>
							<p class="card-text">내용</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>