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

.join {
	text-align: center;
	text-align: center;
	font-size: 28px;
	font-weight: inherit;
	margin-top: 30px;
	margin-bottom: 40px;
}

.grid {
	display: flex;
	justify-content: center;
	align-items: center;
}

.box {
	border: 1px solid #ddd;
	width: 650px;
	position: relative;
}

.mem {
	background: #fff;
	border-bottom: 1px solid #ddd;
	color: #777;
	font-size: 18px;
	line-height: 24px;
	text-align: center;
	padding: 30px 20px 30px;
}

.inf {
	background: #fff;
	border-bottom: 1px solid #ddd;
	padding: 20px 20px;
}

.inf2 {
	border: hidden;
	background: #fff;
	border-bottom: 1px solid #ddd;
	padding: 20px 20px;
}

input::placeholder {
	font-size: 0.1em;
}

input {
	border: 1px solid #ddd;
	border-radius: 3px;
	box-sizing: border-box;
	display: inline-block;
	/* margin-top:10px; */
	max-width: 530px;
	/*outline:none; */
	padding: 15px;
	width: 100%;
}

strong {
	color: #222;
	display: block;
	font-size: 18px;
	margin-bottom: 10px;
}

span {
	color: #ED4C00;
}

.joinb {
	margin-top: 10px;
	display: block;
	text-align: center;
}

section {
	margin-top: 40px;
	margin-bottom: 120px;
}

.btnGray60 {
	color: white;
	border: 1px solid #666666;
	min-width: 80px;
	height: 40px;
	border-radius: 5px;
	padding: 15px 28px;
	font-size: 14px;
	line-height: 16px;
	font-weight: 700;
	background-color: #222222;
}

.btnRegist {
	width: 92px;
	padding: 15px 0;
	padding-top: 12px;
	padding-right: 0px;
	padding-bottom: 15px;
	padding-left: 0px;
	margin-top: 3px;
}

.button_box {
	text-align: center;
}

.essen {
	text-align: center;
	margin-top: 50px;
	margin-bottom: 15px;
}

.chk-btn {
	background: black;
	color: white;
	display: inline-block;
	position: absolute;
	right: 14px;
	width: 90px;
	height: 48px;
	line-height: 48px;
	font-size: 14px;
	font-weight: 600;
	text-align: center;
	cursor: pointer;
}

p {
	color: #ED4C00;
}

#err_pass {
	color: #ED4C00;
}

/* reset */
ul {
	margin: 0;
	padding: 0;
}

/* design */
.selectbox {
	margin: 150px auto;
}

.pl {
	width: 200px;
	border: 1px solid #C4C4C4;
	box-sizing: border-box;
	border-radius: 10px;
	padding: 12px 13px;
	font-family: 'Roboto';
	font-style: normal;
	font-weight: 400;
	font-size: 14px;
	line-height: 16px;
	background: url(./img/Polygon_up.png) 93% no-repeat; /*화살표 이미지 삽입*/
	appearance: none;
	text-align: left;
}

.pl:focus {
	border: 1px solid #9B51E0;
	box-sizing: border-box;
	border-radius: 10px;
	outline: 3px solid #F8E4FF;
	border-radius: 10px;
}

.listbox {
	width: 200px;
	list-style: none;
	background: #FFFFFF;
	border: 1px solid #C4C4C4;
	box-sizing: border-box;
	box-shadow: 4px 4px 14px rgba(0, 0, 0, 0.15);
	border-radius: 10px;
	margin-top: 9px;
}

.list {
	border: none;
	background-color: #FFFFFF;
	font-family: 'Roboto';
	font-style: normal;
	font-weight: 400;
	font-size: 14px;
	line-height: 16px;
	padding: 7px 10px;
	margin: 5px 7px;
	box-sizing: border-box;
}

.list:focus {
	background: #F8E4FF;
	width: 184px;
	border-radius: 8px;
	box-sizing: border-box;
	text-align: left;
}

option {
	text-align: center;
}

optgroup {
	text-align: center;
}

.mem img {
	width: 250px;
	height: 250px;
}
</style>


<script type="text/javascript">


	/* 아이디 중복체크 */
	function chkId() {
		if (!frm.user_id.value) {
			alert("아이디를 입력하고 체크하세요.")
			frm.user_id.focus();
			return false;
		}
		$.post("confirmId.pa", "user_id="+frm.user_id.value, function(data) {
			$('#err_id').html(data);
		});
	}
	
	function chkPass() {
		var pw = $('#pass').val();
		if(pw.length < 8) {
			$('#err_pass').html("8자리 이상 입력해주세요");
			frm.pass.focus();
			frm.pass.value="";
			return false;
		}else {
			$('#err_pass').html("사용가능한 비밀번호입니다");
		}
	}
	/* 비밀번호 일치 체크 */
	function chkPassword() {
		if(frm.pass.value!=frm.confirmPass.value) {
			alert("비밀번호가 일치하지 않습니다.")
			frm.pass.focus();
			frm.pass.value="";
			frm.confirmPass.value="";
			return false;
		}
	}
	/* 닉네임 중복체크 */
	function chkNick() {
		if(!frm.nickname.value) {
			alert("닉네임을 입력하고 체크하세요.")
			frm.nickname.focus();
			return false;
		}else {
			frm.checked_nick.value="y";
		}
		$.post("confirmNick.pa", "nickname="+frm.nickname.value, function (data) {
			$('#err_nick').text(data);
		});
	
	function chk() {
		if (!frm.checked_id.value) {
			alert("아이디 중복체크 버튼을 눌러주세요.")
			return false;
		}
		if (!frm.checked_nick.value) {
			alert("닉네임 중복체크 버튼을 눌러주세요.")
			return false;
			}
		}
	}
	
	const autoHyphen = (target) => {
		 target.value = target.value
		   .replace(/[^0-9]/g, '')
		   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
		}
	
</script>
</head>
<body>
	<form action="joinResult.pa" method="post" name="frm"
		onsubmit="return chk()">
		<section>
			<div class="join">회원가입</div>
			<div class="grid">
				<div class="box">
					<div class="mem">
						<img src="/nemoca/images/basic_profile.png">
						<p>*회원정보를 꼭 입력해주세요.
					</div>
					<div class="inf">
						<strong>아이디<span>(필수)</span></strong><input type="text"
							name="user_id" placeholder="아이디" required="required">
						<button class="chk-btn" onclick="chkId()">중복체크</button>
						<input type="hidden" name="checked_id" value="">
						<div class="chk-msg" id="err_id"></div>

						<strong>닉네임<span>(필수)</span></strong><input type="text"
							name="nickname" placeholder="닉네임" required="required">
						<button class="chk-btn" onclick="chkNick()">중복체크</button>
						<input type="hidden" name="checked_nick" value="">
						<div class="chk-msg" id="err_nick"></div>
					</div>

					<div class="inf">
						<strong>비밀번호<span>(필수)</span></strong><input type="password"
							name="pass" id="pass" placeholder="비밀번호" required="required"
							onchange="chkPass()">
						<div class="chk-msg" id="err_pass"></div>
					</div>
					<div class="inf">
						<strong>비밀번호 확인<span>(필수)</span></strong><input type="password"
							name="confirmPass" placeholder="비밀번호 확인" required="required"
							onchange="chkPassword()">
					</div>

					<div class="inf">
						<strong>이름<span>(필수)</span></strong><input type="text" name="name"
							placeholder="이름" required="required"> <strong>지역<span>(필수)</span></strong><input
							type="text" name="addr" placeholder="지역" required="required">

						<strong>성별<span>(필수)</span></strong> <select class="pl on"
							onclick="select()" name="gender">
							<ul class="listbox" id="listbox">
								<li><optgroup label="성별 선택"></optgroup>
								<li><option class="list" value="M">남자</option></li>
								<li><option class="list" value="W">여자</option></li>
							</ul>
						</select> <strong>나이<span>(필수)</span></strong> <select class="pl on"
							onclick="select()" name="age">
							<ul class="listbox" id="listbox">
								<li><optgroup label="연령대 선택"></optgroup>
								<li><option class="list" value="10">10대</option></li>
								<li><option class="list" value="20">20대</option></li>
								<li><option class="list" value="30">30대</option></li>
								<li><option class="list" value="40">40대</option></li>
								<li><option class="list" value="50">50대</option></li>
								<li><option class="list" value="60">60대 이상</option></li>
							</ul>
						</select>
					</div>

					<div class="inf">
						<strong>휴대폰('-'없이 번호만 입력)<span class="type_coffe">(필수)</span></strong>
						<input type="text" oninput="autoHyphen(this)" name="tel"
							required="required" placeholder="01012345678" maxlength="13">
					</div>

					<div class="inf">
						<strong>e-mail<span class="type_coffe">(필수)</span></strong><input
							type="text" name="email" placeholder="이메일" maxlength="30"
							required="required">
					</div>
				</div>
			</div>
			<div class="essen">
				<b>필수입력란을 꼭 입력해주셔야 가입이 가능합니다.</b>
			</div>
			<div class="button_box">
				<input type="submit" class="btnGray60 btnRegist" value="회원가입">
			</div>
		</section>
	</form>
</body>
</html>