<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

.update {
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

.inf {
	background: #fff;
	border-bottom: 1px solid #ddd;
	padding: 20px 20px;
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

section {
	margin-top: 40px;
	margin-bottom: 120px;
}

.button {
	width: 120px;
	padding: 15px 0;
	padding-top: 15px;
	padding-right: 0px;
	padding-bottom: 15px;
	padding-left: 0px;
	margin-bottom: 10px;
}

.btnGray60 {
	color: white;
	border: 1px solid #666666;
	min-width: 80px;
	height: 60px;
	border-radius: 5px;
	padding: 15px 28px;
	font-size: 16px;
	line-height: 18px;
	font-weight: 700;
	background-color: #222222;
}

.essen {
	text-align: center;
	margin-top: 50px;
	margin-bottom: 15px;
}

.button_box {
	text-align: center;
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

#del-btn {
	text-align: center;
	color: blue;
	font-size: 13px;
	cursor: pointer;
}

option {
	text-align: center;
}

optgroup {
	text-align: center;
}

/* 프로필 */
.mem {
	background: #fff;
	border-bottom: 1px solid #ddd;
	color: black;
	font-size: 18px;
	line-height: 24px;
	text-align: center;
	padding: 30px 20px 30px;
}

.mem img {
	width: 250px;
	height: 250px;
}

/* 파일 업로드 디자인 */
.pro-btn {
	position: relative;
	overflow: hidden;
}

.pro-btn input[type=file] {
	position: absolute;
	top: 0;
	right: 0;
	min-width: 100%;
	min-height: 100%;
	font-size: 100px;
	text-align: center;
	filter: alpha(opacity = 0);
	opacity: 0;
	outline: none;
	background: white;
	cursor: inherit;
	display: block;
}
</style>


<script type="text/javascript">

	/* 닉네임 중복체크 */
	function chkNick() {
		if(!frm.nickname.value) {
			alert("닉네임을 입력해주세요.")
			frm.nickname.focus();
			return false;
		}else {
			$.post("confirmNick.pa", "nickname="+frm.nickname.value, function(data) {
				$('#err').html(data);
				var substring = "사용중인";
				if(data.includes(substring)) {
					frm.nickname.value="";
					frm.nickname.focus();
					return false;
				}
			});
		}
	}
	
	/* 비밀번호 일치여부 확인 */
	function chkpassword() {
		if (frm.pass.value!=frm.pass2.value) {
			alert("비밀번호가 일치하지 않습니다")
			frm.pass.focus();
			frm.pass.value="";
			frm.pass2.value="";
			return false;
		}
	}
	
	/* 회원탈퇴 */
	function del() {
		var con = confirm("탈퇴 하시겠습니까?");
		if(con) 
			location.href="delete.pa";
		else
			alert("탈퇴가 취소되었습니다.");
	}
	
	/* 핸드폰번호 자동 하이픈 추가 */
	const autoHyphen = (target) => {
		 target.value = target.value
		   .replace(/[^0-9]/g, '')
		   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
		}	
	
</script>

</head>
<body>
	<form action="update.pa?prevUrl=${prevUrl }" method="post" name="frm"
		onsubmit="chk()" enctype="multipart/form-data">
		<div class="update">회원정보 수정</div>
		<div class="grid">
			<div class="box">
				<div class="inf">

					<!-- 프로필 사진 -->
					<div class="mem">
						<img src="/nemoca/images/basic_profile.png" alt=""> <br>
						<span class="pro-btn"> 이미지를 업로드 하려면 클릭하세요. <input
							type="file" name="user_img">
						</span>
					</div>

					<!-- 아이디 -->
					<input type="text" name="user_id" placeholder="${member.user_id }"
						readonly="readonly" value="${member.user_id }"
						placeholder="${member.user_id }">
				</div>

				<!-- 닉네임 -->
				<div class="inf">
					<input type="text" name="nickname" value="${member.nickname }"
						placeholder="${member.nickname }" onChange="chkNick()"> <input
						type="hidden" name="checked_nick" value="">
					<div class="chk-msg" id="err"></div>
				</div>

				<!-- 휴대폰 번호 -->
				<div class="inf">
					<input type="text" oninput="autoHyphen(this)" name="tel"
						maxlength="13" placeholder="${member.tel }" value="${member.tel }">
				</div>

				<!-- 비밀번호 -->
				<div class="inf">
					<input type="password" name="pass" placeholder="비밀번호"
						required="required">
				</div>

				<!-- 비밀번호 확인 -->
				<div class="inf">
					<input type="password" name="pass2" placeholder="비밀번호 확인"
						required="required" onChange="chkPassword()">
				</div>

				<!-- 연령대 선택 -->
				<div class="inf">
					<select class="pl on" onclick="select()" name="age">
						<ul class="listbox" id="listbox">
							<li><optgroup label="연령대선택"></optgroup>
							<li><option class="list" value="10">10대</option></li>
							<li><option class="list" value="20">20대</option></li>
							<li><option class="list" value="30">30대</option></li>
							<li><option class="list" value="40">40대</option></li>
							<li><option class="list" value="50">50대</option></li>
							<li><option class="list" value="60">60대 이상</option></li>
						</ul>
					</select>
				</div>
			</div>
		</div>
		<div class="essen">
			<b>입력란을 꼭 입력해주셔야 수정이 가능합니다.</b>
		</div>
		<div class="button_box">
			<input type="submit" value="정보수정" class="button btnGray60"> <input
				type="submit" value="회원탈퇴" class="button btnGray60" onclick="del()">
		</div>
		</section>
	</form>
</body>
</html>