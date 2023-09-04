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
.reviewTable{
	display: flex;
	justify-content: center;
	margin-top: 250px;
	margin-bottom: 10px;
}
.cafeName {
	font-size: 30px;
	color: #FF792A;
}
.ex {
	color: #9B9B9B;
}

.reviewTable2{
	display: flex;
	justify-content: center;
	
}
textarea{
	width: 600px;
	height: 200px;
	box-sizing: content-box;
	border: solid 2px #9B9B9B;
	border-radius: 3px;
	font-size: 15px;
	resize: none;
	wrap: hard;
}
.buttonTable {
	display: flex;
	justify-content: center;
	padding-bottom: 200px;	
}

.cafeStarImg {
	width: 40px;
	height: 40px;
}
.reviewRegist{
	font-size:14px;
	background-color: #FFFFFF;
	color: #7F7F7F;
	border: 1px solid #7F7F7F;
	content:4;
	height: 50px;
	width: 140px;
	border-radius: 100px;
	cursor:pointer;
	
}
.reviewCancel{
	font-size:14px;
	background-color: #FFFFFF;
	color: #7F7F7F;
	border: 1px solid #7F7F7F;
	height: 50px;
	width: 140px;
	border-radius: 100px;
	cursor:pointer;
}

.cr_gradeText{
	color: #FF792A;
}
.cr_grade{
	color: #9B9B9B;
}
</style>

</head>
<body>
	<form name="inputForm" method="post" action="cafeDoReviewRegist.yo">
		<div class="reviewTable">
			<table border="0">
				<tr>
					<td width="520px"></td>
				</tr>
				<tr>
					<td>
						<span class="cafeName">${cafe.c_name}</span>
						<span class="ex">&nbsp;에 대한 솔직한 리뷰를 써주세요.</span>
					</td>
					<td>
					</td>
				</tr>
			</table>
		</div>
		<div class="reviewTable2">
			<table border="0">
				<tr>
					<td><textarea name="cr_content" required placeholder="(회원 닉네임) 주문하신 메뉴는 어떠셨나요? 카페 분위기와 서비스도 궁금해요!"></textarea></td>
				</tr>
				<tr>
					<td	height="30px">
					<span class="cr_gradeText">&nbsp;&nbsp;평점&nbsp;</span>
						<select class="cr_grade" name="cr_grade" required="required">
							<option value="5" selected>5점</option>
							<option value="4">4점</option>
							<option value="3">3점</option>
							<option value="2">2점</option>
							<option value="1">1점</option>
						</select>
					</td>
				</tr>
			</table>
		</div>
		<div class="buttonTable">
			<table border="0">
				<tr>
					<td width="300px"></td>
					<td width="300px"></td>
				<tr>
					<td></td>
					<td>
						<input type="text" name="c_no" value="${cafe.c_no}" style="display:none;">
						<input type="text" name="user_id" value="${id}" style="display:none;">
						<input class="reviewRegist" type="submit" value="리뷰 올리기">&nbsp;&nbsp;
						<input class="reviewCancel" type="button" value="취소" onclick="history.go(-1)"></button>
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>