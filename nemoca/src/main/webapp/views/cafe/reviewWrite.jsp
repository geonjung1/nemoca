<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

.writeTable2 { /* 주소 */
	padding-top: 10px;
}

.writeTable3 { /* 지역 */
	padding-top: 10px;
}

.writeTable4 { /* 전화번호 */
	padding-top: 10px;
}

.writeTable5 { /* 가격 */
	padding-top: 10px;
}

.writeTable6 { /* 운영시간 */
	padding-top: 10px;
}
.writeTable7 {
	padding-top: 10px;
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
</head>
<body>
<div class="writeAll">
	<p class="title">카페글 수정하기</p>
	 <form name="inputForm" action="reviewRegist.yo" method="post"> 
		<input type="hidden" name="c_no" value="${cafe.c_no}">
		<div class="writeTable1">
			<input id="input1" type="text" name="c_name" placeholder=" 카페명 * " required="required" 
			autofocus="autofocus" value="${cafe.c_name}">
		</div>
		<div class="writeTable2">
			<input id="input1" type="text" name="c_addr" placeholder=" 주소 * " required="required" value="${cafe.c_addr}">
				<div class="writeTable3">
					<input id="input1" type="text" name="c_addr_new" value="${cafe.c_addr_new}" placeholder=" 지번 * ( 예시 : ㅇㅇ동 123-45 )" required="required">
				</div>
				<div class="writeTable4">
				<select id="input1" name="c_loc" required="required">
					<optgroup label="지역">
					<option>${cafe.c_loc}</option>
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
					<option>강북구</option></optgroup>
				</select>
				</div>
		</div>
		<div class="writeTable5">
			<input id="input1" type="tel" name="c_tel" value="${cafe.c_tel}" placeholder="전화번호 * (-있이 입력해주세요.)" required="required">
		</div>
		<div class="writeTable6">
			<input id="input1" type="text" name="c_price" value="${cafe.c_price}" placeholder=" 가격 * (예시 : 0원 ~ 0원)" required="required">
		</div>
		<div class="writeTable7">
			<input id="input1" type="text" name="c_optime" value="${cafe.c_optime}" placeholder=" 운영시간 * ( 예시 : 00~24:00 )" required="required">
		</div>
		<div class="writeButton">
			<input id="regist" type="submit" value="수정하기">&nbsp;&nbsp;
			<input id="cancel" type="button" value="취소" onclick="history.go(-1)">
		</div>
	</form>
</div>
</body>
</html>