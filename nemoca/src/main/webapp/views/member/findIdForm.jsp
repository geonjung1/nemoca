<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function id_search() {
		if (frm.nickname.value.length < 1) {
			alert("닉네임을 입력해주세요.");
			return;
		}
		
		if (frm.tel.value.length != 13) {
			alert("휴대폰번호를 정확하게 입력해주세요.")
			return;
		}
	}
</script>

</head>
<body>

<form action="findIdResult.pa" method="post" name="frm">
<div class="container">
<div class="find find-id">
	<h1 class="title">아이디 찾기</h1>
	<div class="find-nickname">
		<label>닉네임</label>
		<input type="text" name="nickname" placeholder="등록한 닉네임" class="btn-nickname" 
			required="required" autofocus="autofocus">
	</div>
	<div class="find-tel">	
		<label>휴대폰</label>
		<input type="text" class="btn-tel" name="tel" onKeyup="addHypen(this);" required="required">
	<div class="btnSearch">
		<input type="submit" value="아이디 찾기" onClick="id_search()">
		<input type="button" name="cancle" value="취소" onClick="history.back()">
	</div>
</div>
</div>
</form>

</body>
</html>