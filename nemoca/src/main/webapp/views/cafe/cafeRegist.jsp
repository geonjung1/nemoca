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
.writeAll { /* 전체 */
	/* display: flex; */
	text-align: center;
	margin-top: 200px;
	margin-bottom: 100px; 
}
.title{
	font-size: 30px;
	padding-bottom: 30px;
	
}

.writeTable1 { /* 카페명 */
	padding-top: 10px;
}
.writeTable2 { /* 카페 유형 */
	padding-top: 10px;
}

.writeTable3 { /* 주소 */
	padding-top: 10px;
}

.writeTable4 { /* 지역 */
	padding-top: 10px;
}

.writeTable5 { /* 전화번호 */
	padding-top: 10px;
}

.writeTable6 { /* 가격 */
	padding-top: 10px;
}

.writeTable7 { /* 운영시간 */
	padding-top: 10px;
}
.writeTable8 {
	padding-top: 10px;
}
.writeTable8 {
	padding-top: 40px;
	display: flex;
	justify-content: center;
}
.imgUploadBox {
	width: 200px;
	height: 50px;
}

#input1 {
	width: 600px;
	height: 50px;
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: 1px solid black;
	outline: none;
	padding-bottom: 10px;
}
#regist {
	width: 200px;;
	height: 55px;
	border-top: none;
	border-left: none;
	border-right: none;
	border: 1px solid #FF792A;
	background-color: #FF792A;
	color: white;
	outline: none;
}
#cancel {
	width: 200px;;
	height: 55px;
	border-top: none;
	border-left: none;
	border-right: none;
	border: 1px solid #FF792A;
	background-color: white;
	color: #FF792A;
	outline: none;	
}
.writeButton {
	padding: 30px;
}
</style>

<script>
$(document).ready(function () {
	var user_id = "${id}";
	if(user_id == null || user_id.length == 0 || user_id.trim() == ""){
		alert("로그인 후 이용해 주세요.");
		history.go(-1);
		return;
	}
});
</script>
</head>
<body>
<div class="writeAll">
	<p class="title">카페 등록하기</p>
	<form name="inputForm" method="post" action="cafeDoRegist.yo" enctype="multipart/form-data">
		<div class="writeTable1">
			<input id="input1" type="text" name="c_name" placeholder=" 카페명 * " required="required" autofocus="autofocus">
		</div>
		<div class="writeTable2">
			<input id="input1" type="text" name="c_type" placeholder=" 카페 타입 (예시 : dessert )" required="required" value="${cafe.c_type}">
		</div>
		<div class="writeTable3">
			<input id="input1" type="text" name="c_addr" placeholder=" 주소 * " required="required">
				<div class="writeTable3">
					<input id="input1" type="text" name="c_addr_new" placeholder=" 지번 * ( 예시 : ㅇㅇ동 123-45 )" required="required">
				</div>
				<div class="writeTable4">
				<select id="input1" name="c_loc" required="required">
					<option>지역</option>
					<option>강서구</option>
					<option>양천구</option>
					<option>구로구</option>
					<option>영등포구</option>
					<option>금천구</option>
					<option>관악구</option>
					<option>동작구</option>
					<option>서초구</option>
					<option>강남구</option>
					<option>송파구</option>
					<option>강동구</option>
					<option>광진구</option>
					<option>성동구</option>
					<option>동대문구</option>
					<option>중랑구</option>
					<option>마포구</option>
					<option>서대문구</option>
					<option>용산구</option>
					<option>중구</option>
					<option>종로구</option>
					<option>은평구</option>
					<option>도봉구</option>
					<option>강북구</option>
				</select>
				</div>
		</div>
		<div class="writeTable5">
			<input id="input1" type="tel" name="c_tel" placeholder="전화번호 * (-있이 입력해주세요.)" required="required">
		</div>
		<div class="writeTable6">
			<input id="input1" type="text" name="c_price" placeholder=" 가격 * (예시 : 0원 ~ 0원)" required="required">
		</div>
		<div class="writeTable7">
			<input id="input1" type="text" name="c_optime" placeholder=" 운영시간 * ( 예시 : 00~24:00 )" required="required">
		</div>
		<div class="writeTable8">
			<div class="imgUploadBox">
				<input type="file" id="f1" name="thumbnail_1">
			</div>
			<div class="imgUploadBox">
				<input type="file" id="f2" name="thumbnail_2">
			</div>
			<div class="imgUploadBox">
				<input type="file" id="f3" name="thumbnail_3">
			</div>
			<div class="imgUploadBox">
				<input type="file" id="f4" name="thumbnail_4">
			</div>
			<div class="imgUploadBox">
				<input type="file" id="f5" name="thumbnail_5">
			</div>
		</div>
		<div class="writeButton">
			<input id="input1" type="text" name="user_id" value="${id}" style="display:none;">
			<input id="regist" type="submit" value="등록하기">&nbsp;&nbsp;
			<input id="cancel" type="button" value="취소" onclick="history.go(-1)">
		</div>
	</form>
</div>
</body>
</html>