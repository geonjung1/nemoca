<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Diphylleia&display=swap')
	;
/* font-family: 'Diphylleia', serif; */
* {
	font-family: "Diphylleia";
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

div {
	background-color: rgb(255, 255, 255);
}

#grid {
	background-color: rgb(195, 195, 195);
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.box1 {
	width: 600px;
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
}

.find-id {
	text-align: center;
	font-size: 28px;
	font-weight: bold;
}

.id {
	margin-top: 10px;
	padding-top: 5px;
	zoom: 1.8;
	font-size: 0.3em;
}

.find-id-btn {
	margin-top: 10px;
	display: block;
	text-align: center;
}

input::submit {
	width: 190px;
	height: 35px;
	background-color: black;
	color: white;
	font-weight: bold;
	margin: 0 auto;
}

input::placeholder {
	font-size: 0.1em;
}

.btnGray60 {
	color: white;
	border: 1px solid #666666;
	min-width: 80px;
	height: 40px;
	border-radius: 5px;
	padding: 15px 28px;
	font-size: 12px;
	line-height: 16px;
	font-weight: 700;
	background-color: #222222;
}

.btnRegist {
	width: 86px;
	padding: 15px 0;
	padding-top: 12px;
	padding-right: 0px;
	padding-bottom: 15px;
	padding-left: 0px;
	margin-top: 3px;
}
</style>


<script type="text/javascript">
	function id_search() {
		if (frm.nickname.value.length < 1) {
			alert("닉네임을 입력해주세요.");
			return;
		}

		if (frm.tel.value.length != 11) {
			alert("휴대폰번호를 정확하게 입력해주세요.")
			return;
		}
	}
</script>

</head>
<body>

	<form action="findIdResult.pa" method="post" name="frm">
		<div id="grid">
			<div class="box1">
				<div class="box2">
					<div class="find-id">아이디 찾기</div>
					<div class="id">
						닉네임 <input type="text" name="nickname" placeholder="등록한 닉네임"
							class="btn-nickname" required="required" autofocus="autofocus">
					</div>
					<div class="id">
						휴대폰 <input type="text" class="btn-tel" name="tel"
							placeholder="'-'빼고 입력해주세요" required="required">
					</div>
					<div class="find-id-btn">
						<input type="submit" value="아이디 찾기" class="btnGray60 btnRegist"
							onClick="id_search()"> <input type="button" name="cancle"
							class="btnGray60 btnRegist" value="취소" onClick="history.back()">
					</div>
				</div>
			</div>
		</div>
	</form>

</body>
</html>