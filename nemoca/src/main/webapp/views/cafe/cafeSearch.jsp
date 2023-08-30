<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<c:set var="id" value='${sessionScope.user_id}'></c:set>
<head>
<meta charset="UTF-8">
<title>nemoca</title>
<script type="text/javascript" src="/nemoca/js/jquery.js"></script>
<style>
.body {
	background: #F7F7F7;
	/* 	font-family: 'Diphylleia', serif; */
}

.rankingList {
	/* 	text-align: center; */
	
}

.rankingTitle1 {
	text-align: center;
	font-size: 50px;
	font-weight: 900;
	padding-top: 80px;
}

.rankingTitle2 {
	text-align: center;
	font-size: 18px;
	padding-bottom: 50px;
	color: #9B9B9B;
	font-weight: 650;
}

.rankingBox {
	margin-top: 40px;
	display: flex;
	justify-content: center;
	margin-bottom: 40px;
}

.cafeImage {
	height: 300px;
	width: 300px;
	cursor: pointer;
}

.cafeName {
	font-size: 30px;
	font-weight: bold;
	color: #555555;
	cursor: pointer;
}

.cafeStar {
	font-size: 30px;
	color: #FF792A;
}

.cafeAddress {
	font-size: 18px;
	color: #9B9B9B;
}

.cafeLike {
	
}

.cafeLikeImg {
	width: 40px;
	height: 40px;
	cursor: pointer;
}

.cafeUrl {
	color: #888888;
	cursor: pointer;
}

.tableEop {
	height: 40px;
}

.tableEnd {
	height: 40px;
}
</style>

<script>
	$(document).ready(function() {

		$('.cafeImage').on('click', function(e) {
			var c_no = $(this).attr("id").replace("_image", "");
			location.href = "/nemoca/views/cafe/cafeView.yo?c_no=" + c_no;
		});

		$('.cafeName').on('click', function(e) {
			var c_no = $(this).attr("id").replace("_cafename", "");
			location.href = "/nemoca/views/cafe/cafeView.yo?c_no=" + c_no;
		});

		$('.cafeUrl').on('click', function(e) {
			var c_no = $(this).attr("id").replace("_url", "");
			location.href = "/nemoca/views/cafe/cafeView.yo?c_no=" + c_no;
		});
	});
</script>
</head>
<body>
	<div class="body">
		<div class="rankingTitle">
			<div class="rankingTitle1">네모카 카페 랭킹</div>
			<div class="rankingTitle2">"nemoca 회원이 직접뽑은 순위 TOP 10!!"</div>
		</div>
		<hr>
	</div>
	<div class="rankingList">
		<c:if test="${cflist.size() == 0}">
			<p class="search_text">
				검색 결과가 없습니다.<br>다른 검색어를 입력하시거나 철자와 띄어쓰기를 확인해보세요.
			</p>
		</c:if>
		<c:if test="${cflist.size() != 0}">
			<c:forEach var="cafe" items="${cflist}">
				<div class="rankingBox">
					<table border="0" style="border-bottom: 1px solid #dbdbdb;">
						<tr>
							<td width="300px"></td>
							<td width="20px"></td>
							<td width="20px"></td>
							<td width="600px"></td>
							<td width="200px"></td>
						</tr>
						<tr height="50px">
							<td rowspan="4"><img id="${cafe.c_no}_image"
								class="cafeImage" src="/nemoca/images/${cafe.c_img1}"></td>
							<td>&nbsp;</td>
							<td colspan="2"><span id="${cafe.c_no}_cafename"
								class="cafeName">${cafe.cafe_like_rank}. ${cafe.c_name}</span> <span
								class="cafeStar"> ${cafe.star}</span></td>
							<td></td>
						</tr>
						<tr height="50px">
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td vertical-align="top"><span class="cafeAddress">${cafe.c_addr}</span>
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr height="150">
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr height="50px">
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td><span id="${cafe.c_no}_url" class="cafeUrl">${cafe.c_name}></span>
							</td>
						</tr>
						<tr height="30px">
							<td colspan="5">&nbsp;</td>
						</tr>
					</table>
				</div>
	</div>
	</c:forEach>
	</c:if>
	</div>
</body>
</html>