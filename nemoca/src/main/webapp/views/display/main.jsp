<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/nemoca/js/jquery.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
	integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ"
	crossorigin="anonymous">
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Diphylleia&display=swap')
	;

* {
	font-family: 'Diphylleia', serif;
}

.search {
	height: 500px;
	display: flex;
	flex-direction: row;
	align-items: center;
	justify-content: center;
	background-color: cyan;
	background-image: url("/nemoca/images/mainPic.jpg");
	background-position: 50% 63%;
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
	text-align: center;
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

.mid {
	display: flex;
	justify-content: space-between;
	margin-top: 23px
}

span {
	font-size: 23px;
}
</style>
<script>
$(document).ready(function () {
	$('.card-title').on('click', function(e) {
		requestRankingTypeList($(this).attr("name"));
	});
	
	$('.card-img-top').on('click', function(e) {
		requestRankingTypeList($(this).attr("name"));
	});
});

function requestRankingTypeList(type){
	location.href = "/nemoca/views/cafe/cafeRankingList.yo?rankingType=" + type;
}
function srchchk() {
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
		method="post" name="frm" onsubmit="return srchchk()">
		<div class="search">
			<fieldset class="search_css">
				<input type="text" name="srch" placeholder="검색어를 입력해주세요">
				<button type="submit">검색</button>
			</fieldset>
		</div>
	</form>
	<section class="all">
		<div class="mid">
			<span class="list_the"><h2>카페리스트</h2></span><br>
			<br>
		</div>
		<div class="mycard container-fluid">
			<div class="row row-cols-1 row-cols-md-3 g-4">
				<div class="col">
					<div class="card h-100" style="cursor: pointer">
						<img src="/nemoca/images/main_dessert.jpg" class="card-img-top"
							name="dessert" alt="...">
						<div class="card-body">
							<span class="card-title" name="dessert">디저트가 맛있는 카페 5선</span>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card h-100" style="cursor: pointer">
						<img src="/nemoca/images/oceanview.jpg" class="card-img-top"
							name="isek" alt="...">
						<div class="card-body">
							<span class="card-title" name="isek">이색 카페 5선</span>
						</div>
					</div>
				</div>

				<div class="col">
					<div class="card h-100" style="cursor: pointer">

						<img src="/nemoca/images/main-pet.jpg" class="card-img-top"
							name="pet" alt="...">
						<div class="card-body">
							<span class="card-title" name="pet">애견 카페 5선</span>
						</div>

					</div>
				</div>

				<!-- 				<div class="col"><a href="/nemoca/views/board/board_good_top3.ha">
					<div class="card h-100">
					
						<img src="/nemoca/images/p6.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">좋아요 많은 게시글 3개!</h5>
						</div>
					
					</div></a>
				</div> -->
				<div class="col">
					<div class="card h-100" style="cursor: pointer">
						<img src="/nemoca/images/main_hip.jpg" class="card-img-top"
							name="hip" alt="...">
						<div class="card-body">
							<span class="card-title" name="hip">힙한 카페 5선</span>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card h-100" style="cursor: pointer">
						<img src="/nemoca/images/main_vegan.jpg" class="card-img-top"
							name="vegan" alt="...">
						<div class="card-body">
							<span class="card-title" name="vegan">비건 카페 5선</span>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card h-100" style="cursor: pointer">
						<img src="/nemoca/images/main_lp.jpg" class="card-img-top"
							name="lp" alt="...">
						<div class="card-body">
							<span class="card-title" name="lp">LP 카페 5선</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>