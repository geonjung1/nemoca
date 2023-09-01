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

.search {
	height: 250px;
	display: flex;
	flex-direction: row;
	align-items: center;
	justify-content: center;
	background: #F7F7F7;
	
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

.search_css {
	width: 40%;
	height: 55px;
}

.rankingBox {
	margin-top: 40px;
	display: flex;
	justify-content: center;
	margin-bottom: 40px;
}

button[type=submit] {
	width: 30%;
	height: 100%;
	background-color: black;
	font-size: 1em;
	color: white;
	border-radius: 10px;
	margin: 0;
	box-sizing: border-box;
	outline: none;
	display: inline;
	top: 0;
	float: right;
}

button[type=submit]:hover {
	background-color: lightgray;
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

fieldset {
	border-radius: 10px;
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
.search_text {
	text-align: center;
	font-size: 20px;
	
}
.no_search {
	
}
</style>

<script>
	 function srchchk() {
		if(!frm.srch.value) {
			alert("검색어를 입력하세요");
			frm.srch.focus();
			return false;
		}
	} 
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
	<form action="/nemoca/views/cafe/cafeSearch.le"
		onesubmit="return chk()" name="frm" method="post">
		<div class="search">
			<fieldset class="search_css">
				<input type="text" name="srch" placeholder="검색어를 입력해주세요">
				<button type="submit" onclick="srchchk()">검색</button>
			</fieldset>
		</div>
	</form>
	<div class="rankingList">
		<c:if test="${cflist.size() == 0}">
		<div class="no_search">
			<p class="search_text">
				검색 결과가 없습니다.<br>다른 검색어를 입력하시거나 철자와 띄어쓰기를 확인해보세요.
			</p>
		</div>
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
								class="cafeName">${cafe.c_name}</span> <span class="cafeStar">
									${cafe.star}</span></td>
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
</body>
</html>