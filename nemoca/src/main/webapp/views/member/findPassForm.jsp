<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function pw_search() {
		if (!frm.nickname.value) {
			alert("닉네임을 입력해주세요.");
			return;
		}
		if (!frm.user_id.value) {
			alert("아이디를 입력해주세요");
			return;
		}
	}
</script>
</head>
<body>

	<form action="findPassResult.pa" method="post" name="frm">
		<div class="container">
			<div class="find find-id">
				<h1 class="title">아이디 찾기</h1>
				<div class="find-nickname">
					<label>닉네임</label> <input type="text" name="nickname"
						placeholder="등록한 닉네임" class="btn-nickname" required="required"
						autofocus="autofocus">
				</div>
				<div class="find-id">
					<label>아이디</label> <input type="text" name="user_id"
						placeholder="등록한 아이디" class="btn-id" required="required">
					<div class="btnSearch">
						<input type="submit" value="비밀번호 찾기" onClick="pw_search()">
						<input type="submit" name="cancle" value="취소"
							onClick="history.back()">
					</div>
				</div>
			</div>
		</div>
	</form>

</body>
</html>