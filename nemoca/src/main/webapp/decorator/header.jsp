<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="deco"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<c:set var="id" value='${sessionScope.user_id}'></c:set>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Diphylleia&display=swap')
	;
/* font-family: 'Diphylleia', serif; */
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

body {
	font-family: "굴림 보통";
	background: #fff;
	color: #000;
	font-size: 15px;
	line-height: 1.5;
}

a {
	color: #262626;	
	text-decoration: none; 
}

ul {
	list-style: none; 
}

/* Nav */
.main-nav {
	display: flex;
	align-items: center;
	justify-content: space-between;
	height: 60px;
	padding: 20px 0;
	font-size: 13px;
}

.main-nav ul { /* 메인 메뉴 이거 있어야 오른쪾으로 나란히 됨 */
	display: flex;
}

.main-nav ul li { /* 지우지 말자  */
	padding: 0 10px;
}

.main-nav ul.main-menu { /* 여기에 넣으면 메인 글자 바뀜 */
	font-family: 'Diphylleia', serif;
	font-weight: bold;
	flex: 1;
	margin-left: 30px;
	font-size: 20px;
}

@media ( max-width : 700px) {
	.main-nav ul.main-menu {
		display: block;
		position: absolute;
		top: 0;
		left: 0;
		background: #f2f2f2;
		width: 50%;
		height: 100%;
		border-right: #ccc 1px solid;
		opacity: 0.9;
		padding: 30px;
		transform: translateX(-500px);
		transition: transform 0.5s ease-in-out;
	}
}

.my {
	
}
 .my li {
 	display:block;
	padding-top: 10px;
	width:100px;
	height:40px;
	line-height: 40px;
 }
  .my li a{
  	text-align: cetner;
  	display: block;
  }
  #noneDiv {
  	background-color: white;
  	position: fixed;
  	top: 72px;
    right: 10px;
    border-radius: 0 0 3px 3px;
  }	
</style>
<script>
	$(function(){
	    $('#list').click(function(){
		    if($("#noneDiv").css("display") == "none"){
	            $('#noneDiv').slideDown().show();
	    	}
		    else{
	            $('#noneDiv').slideUp().hide();
	    	}
	    });
	});
	
</script>
</head>
<body>
	<header>
		<br>
		<nav class="main-nav">
			<a class="main-nav" href="/nemoca/views/display/main.ha"> <img
				src='/nemoca/images/home_logo.png'>
			</a>
			<ul class="main-menu">
				<li><a class="head" href="/nemoca/views/cafe/cafeList.ha">
						<img src='/nemoca/images/coffee.PNG' width="40px">카페 구경하기
				</a>
				
				<c:if test="${id eq 'master'}">
				<li><a class="head" href="/nemoca/views/cafe/cafeRegist.yo">
						<img src='/nemoca/images/coffee.PNG' width="40px">카페 등록하기
				</a></li>
				</c:if>
				
				<li><a class="head" href="/nemoca/views/board/boardMain.ha">
						<img src='/nemoca/images/coffee.PNG' width="40px">게시판
				</a></li>
			</ul>
			<ul class="right-menu">
				<li><a id="list">
					 <i class="fas fa-shopping-cart"> 
					현재 로그인한 id는 "${user_id }"입니다.<img src='/nemoca/images/login2.PNG' width="40px">
				</i></li>
			</ul>
		</nav>
		<div id="noneDiv" style="display: none;">
			<a>
				<ul class="my">
					<c:if test="${empty id}">
					<li><a href="/nemoca/views/member/loginForm.pa?user_id=${id}">로그인</a></li>
					<li><a href="/nemoca/views/member/joinForm.pa">회원가입</a></li>
					</c:if>
					<c:if test="${not empty id}">
					<li><a href="/nemoca/views/member/logout.pa?user_id=${id}">로그아웃</a></li>
					<li><a href="/nemoca/views/mypage/myPageForm.le?user_id=${id}">마이페이지</a></li>
					</c:if>
				</ul>
			</a>
		</div>
	</header>
	<hr>
	<hr>
	
</body>
</html>