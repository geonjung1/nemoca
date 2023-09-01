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
/* 사진 테이블 */
.viewsTable1 {
	display: flex;
	justify-content: center;
	margin-top: 50px;
	margin-bottom: 30px;
}	
.img1 {
	height:250px;
	width: 250px;
	}
.img2 {
	height:250px;
	width: 250px;
	}
.img3 {
	height:250px;
	width: 250px;
	}
.img4 {
	height:250px;
	width: 250px;
	}
.img5 {
	height:250px;
	width: 250px;
	}
	
/* 카페이름 테이블 */
.viewsTable2{
	display: flex;
	justify-content: center;
	margin-bottom: 30px;
}
.cafeNo{
	font-size: 30px;
	display: none;
}
.cafeName{
	font-size: 30px;
}
.cafeScore{
	font-size: 30px;
	color: #FF792A;
}
.cafeReview{
	font-size: 15px;
	color: #9B9B9B;
}
.cafeGrade{
	font-size: 15px;
	color: #9B9B9B;
}
.Readcount{
	font-size: 15px;
	color: #9B9B9B;
}
.Reviewthat{
	font-size: 15px;
	color: #9B9B9B;
}

.cafeModify{
	font-size: 15px;
	color: #9B9B9B;
	cursor:pointer;
}
.cafeDelete{
	font-size: 15px;
	color: #9B9B9B;
	cursor:pointer;
}

/* 상세설명 테이블 */
.viewsTable3{
	display: flex;
	justify-content: center;
	margin-bottom: 30px;
}


.viewstitle1{ 
	font-size: 15px;
	color: #9B9B9B;
}
.cafeAddress{
	font-size: 15px;
	color: #4F4F4F;
}
.cafeAddress1{
	font-size: 15px;
	color: #4F4F4F;
}


.viewstitle2{
	font-size: 15px;
	color: #9B9B9B;
}
.cafeTell{
	font-size: 15px;
	color: #4F4F4F;
}


.Space{
	padding-bottom: 30px;
	width: 1040px;
	border-top: 1px solid #dbdbdb;
}


.viewstitle3{
	font-size: 15px;
	color: #9B9B9B;
}
.cafePrice{
	font-size: 15px;
	color: #4F4F4F;
}


.viewstitle4{
	font-size: 15px;
	color: #9B9B9B;
}
.cafeTime{
	font-size: 15px;
	color: #4F4F4F;
}

.Space1 {
	padding-bottom: 50px;
	width: 1040px;
	border-top: 1px solid #dbdbdb;
}


/* 리뷰(댓글) 테이블 */
.viewsTable4 {
	display: flex;
	justify-content: center;
	padding-bottom: 30px;
	
}
.Reviewthat1 {
	font-size: 25px;
	color: #9B9B9B;
}
.cafeReview {
	cursor:pointer;
}



.viewsTable5{
	display: flex;
	justify-content: center;
}
.reviewImageDiv{
	width: 130px;
	height: 130px;
	justify-content: center;
}
.reviewImage{
	width: 130px;
	height: 130px;
	border-radius: 70%;
	overflow: hidden;
}
.reviewNick{
	width: 130px;
}
.reviewDateTime{
	width: 790px;
	height: 30px;
	padding-left: 20px;
}
.reviewModify{
	width: 40px;
	height: 30px;
	font-size: 15px;
	color: #9B9B9B;
	cursor:pointer;
}
.reviewDelete{
	width: 40px;
	height: 30px;
	font-size: 15px;
	color: #9B9B9B;
	cursor:pointer;
}
.reviewText{
	width: 100%;
	height: 100%;
	text-align: left;
	vertical-align: top;
	padding-left: 20px;
	white-space: pre-wrap;
}
</style>

<script>
$(document).ready(function () {
	$('.cafeModify').on('click', function(e) {
		var user_id = "${id}";
		if(user_id == null || user_id.length == 0 || user_id.trim() == ""){
			alert("로그인 후 이용해 주세요.");
			return;
		}
		
		var cafeNo = $("#cafeNo").text();
		location.href = "/nemoca/views/cafe/cafeModify.yo?c_no=" + cafeNo;
	});
	
	$('.cafeDelete').on('click', function(e) {
		var user_id = "${id}";
		if(user_id == null || user_id.length == 0 || user_id.trim() == ""){
			alert("로그인 후 이용해 주세요.");
			return;
		}
		
		var cafeNo = $("#cafeNo").text();
		var cafeName = $("#cafeName").text();
		if(confirm("카페 [" + cafeName + "]를 삭제 하시겠습니까?")){
			location.href = "/nemoca/views/cafe/cafeDoDelete.yo?c_no=" + cafeNo;
		}
	});
	
	$('.cafeReview').on('click', function(e) {
		var user_id = "${id}";
		if(user_id == null || user_id.length == 0 || user_id.trim() == ""){
			alert("로그인 후 이용해 주세요.");
			return;
		}
		
		var cafeNo = $("#cafeNo").text();
		var cafeName = $("#cafeName").text();
		location.href = "/nemoca/views/cafe/cafeReview.yo?c_no=" + cafeNo + "&c_name=" + cafeName;
	});
	
	$('.reviewModify').on('click', function(e) {
		var user_id = "${id}";
		if(user_id == null || user_id.length == 0 || user_id.trim() == ""){
			alert("로그인 후 이용해 주세요.");
			return;
		}
		
		var name = this.getAttribute("name").split("-");
		$("[name=cr_no]").val(name[0]);
		$("[name=c_no]").val(name[1]);
		reviewModifyForm.submit();
		
	});
	
	$('.reviewDelete').on('click', function(e) {
		var user_id = "${id}";
		if(user_id == null || user_id.length == 0 || user_id.trim() == ""){
			alert("로그인 후 이용해 주세요.");
			return;
		}
		
		if(confirm("리뷰를 삭제 하시겠습니까?")){
			var name = this.getAttribute("name").split("-");
			$("[name=cr_no]").val(name[0]);
			$("[name=c_no]").val(name[1]);
			reviewDeleteForm.submit();
		}
	});
});
</script>
</head>
<body>
<div class="viewsTable1">
	<table border="0">
		<tr>
			<th><img class="img1" src="/nemoca/images/${cafe.c_img1}"></th>
			<th>					&nbsp;</th>
			<th><img class="img2" src="/nemoca/images/${cafe.c_img2}"></th>
			<th>					&nbsp;</th>
			<th><img class="img3" src="/nemoca/images/${cafe.c_img3}"></th>
			<th>					&nbsp;</th>
			<th><img class="img4" src="/nemoca/images/${cafe.c_menu1}"></th>
			<th>					&nbsp;</th>
			<th><img class="img5" src="/nemoca/images/${cafe.c_menu2}"></th>
			<th>					&nbsp;</th>
		<tr>
	</table>
</div>
<div class="viewsTable2">
	<table border="0">
		<tr>
			<td width="200px"></td>
			<td width="200px"></td>
			<td width="200px"></td>
			<td width="200px"></td>
			<td width="200px"></td>
		</tr>
		<tr height="50px">
			<td colspan="3">
				<span id="cafeNo" class="cafeNo">${cafe.c_no}</span>
				<span id="cafeName" class="cafeName">${cafe.c_name}</span>&nbsp;
				<span class="cafeScore">${cafe.star}</span></td>
			<td></td>
			<td></td>
		</tr>
		<tr height="5px">
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<tr height="50px">
			<td><span class="Readcount">조회수 ${cafe.c_readcount}</span></td>
			<td><span class="Reviewthat">댓글 ${cafe.c_replycount}</span></td>
			<td></td>
			<td>
				<span class="cafeReview">리뷰쓰기</span>
			</td>
			<td>
				<c:if test="${id eq 'master'}">
				<span class="cafeModify">수정</span>&nbsp;&nbsp;&nbsp;&nbsp;
				<span class="cafeDelete">삭제</span>
				</c:if>
			</td>
		</tr>
	</table>
</div>
<center><div class="Space"></div></center>
<div class="viewsTable3">
	<table border="0">
		<tr>
			<td width="100px"></td>
			<td width="500px"></td>
			<td width="400px"></td>
		</tr>
		<tr height="30px">
			<td><span class="viewstitle1">주소</span></td>
			<td><span class="cafeAddress">${cafe.c_addr}</span>
				<p><span class="cafeAddress1">${cafe.c_addr_new}</span></p></td>
			<td>&nbsp;</td>
		</tr>
		<tr height="30px">
			<td><span class="viewstitle2">전화번호</span></td>
			<td><span class="cafeTell">${cafe.c_tel}</span></td>
			<td></td>
		</tr>
		<tr height="30px">
			<td><span class="viewstitle3">가격대</span></td>
			<td><span class="cafePrice">${cafe.c_price}</span></td>
			<td></td>
		</tr>
		<tr height="30px">
			<td><span class="viewstitle4">영업시간</span></td>
			<td><span class="cafeTime">${cafe.c_optime}</span></td>
			<td></td>
		</tr>		
	</table>
</div>
<center><div class="Space1"></div></center>
<div class="viewsTable4">
	<table border="0">
		<tr>
			<td width="130px"></td>
			<td width="870px"></td>
		</tr> 
		<tr height="30px" >
			<td colspan="2"><span class="Reviewthat1">리뷰&nbsp;(${cafe.c_replycount})</span></td>
		</tr>
	</table>
</div>
<c:forEach var="cafeReview" items="${cafeReviewList}">
<div class="viewsTable5">
	<table border="0" style="border-top: 1px solid #dbdbdb;">
		<tr height="10px"><td>&nbsp;</td></tr>
		<tr>
			<td rowspan="2">
				<div class="reviewImageDiv"><img class="reviewImage" src="/nemoca/images/${cafeReview.user_img}"></div>
			</td>
			<td>
				<div class="reviewDateTime">${cafeReview.cr_reg_date}</div>
			</td>
			<td>
				<c:if test="${id eq cafeReview.user_id}">
				<div class="reviewModify" name="${cafeReview.cr_no}-${cafeReview.c_no}">수정</div>
				</c:if>
			</td>
			<td>
				<c:if test="${id eq cafeReview.user_id}">
				<div class="reviewDelete" name="${cafeReview.cr_no}-${cafeReview.c_no}">삭제</div>
				</c:if>
			</td>
		</tr>
		<tr>
			<td valign=top rowspan="2" colspan="3">
				<div class="reviewText"><span>${cafeReview.cr_content}</span></div>
			</td>
		</tr>
		<tr>
			<td align=center>
				<div class="reviewNick">${cafeReview.nickname}</div>
			</td>
		</tr>
		<tr height="10px"><td>&nbsp;</td></tr>
	</table>
</div>
</c:forEach>
<form id="reviewModifyForm" method="post" action="cafeReviewModify.yo" style="display:none;">
	<input type="text" name="cr_no" style="display:none;">
	<input type="text" name="c_no" style="display:none;">
</form>
<form id="reviewDeleteForm" method="post" action="cafeDoReviewDelete.yo" style="display:none;">
	<input type="text" name="cr_no" style="display:none;">
	<input type="text" name="c_no" style="display:none;">
</form>
</body>
</html>

 