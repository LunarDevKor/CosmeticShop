<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>관리자 페이지</title>
<link rel="stylesheet" href="admin/css/admin.css">
<link rel="shortcut icon" href="http://demofran.com/data/banner/JnLfWUSUyR6sXJP5n3Re4Fvdc93k93.ico" type="image/x-icon">
<script>
// 자바스크립트에서 사용하는 전역변수 선언
var tb_url		 = "http://demofran.com";
var tb_bbs_url	 = "http://demofran.com/bbs";
var tb_shop_url  = "http://demofran.com/shop";
var tb_admin_url = "http://demofran.com/admin";
</script>
<script src="assets/js/jquery-3.5.1.min.js"></script>
<script src="assets/js/jquery-ui-1.10.3.custom.js"></script>
<script src="assets/js/common.js"></script>
<script src="assets/js/categorylist.js"></script>
</head>
<body>
<form name="fcgyform" method="post" action="">
<input type="hidden" name="parentCode" value="${parentCode}">
<div class="tbl_frm02 mart10">
	<table>
	<colgroup>
		<col class="w140">
		<col>
	</colgroup>
	<tbody>
	<tr>
		<th scope="row">카테고리 소속</th>
			<c:choose>
				<c:when test="${not empty commCode && not empty commCodeName}">
					<td class="bold">${commCodeName} > ${codeName}</td>
				</c:when>
				<c:otherwise>
					<td class="bold">${codeName}</td>
				</c:otherwise>			
			</c:choose>
	</tr>
	<tr>
		<th scope="row">카테고리명</th>
		<td>
			<c:choose>
			<c:when test="${not empty commCode && not empty commCodeName}">
			<input type="text" name="commCodeName" id="commCodeName" value="${commCodeName}" required itemname="카테고리명" class="frm_input required" size="50">
			</c:when>
			<c:otherwise>
			<input type="text" name="codeName" id="codeName" value="${codeName}" required itemname="카테고리명" class="frm_input required" size="50">
			</c:otherwise>			
			</c:choose>
		</td>
	</tr>
			</tbody>
	</table>
</div>

<div class="btn_confirm">
	<input type="button" id="submitBtn" value="확인" class="btn_lsmall">
	<c:choose>
			<c:when test="${not empty commCode && not empty commCodeName}">
			<button type="button" onClick="cancel('${commCode}')" class="btn_lsmall bx-white">닫기</button>
			</c:when>
			<c:otherwise>
			<button type="button" onClick="cancel('${parentCode}')" class="btn_lsmall bx-white">닫기</button>
			</c:otherwise>			
			</c:choose>
</div>
</form>

<script>
function cancel(code) {
	parent.document.all['co'+code].style.display='none';
}

let btn = $('#submitBtn');

btn.on('click', function() {
	$.ajax({
		url: '<%=request.getContextPath()%>/admin/categoryMod.do',
		type: 'POST',
		headers: {
			'X-Requested-With' : 'XMLHttpRequest'
		},
		data: {
			parentCode : '${parentCode}',
			codeName : $('#codeName').val(),
			commCode : '${commCode}' || null,
			commCodeName : $('#commCodeName').val() || null
		},
		success : function(rst) {
			if(rst === 'SUCCESS'){
				parent.window.location.reload();
			}
				
		},
		error : function(xhr) {
			console.log(xhr.status);
		}
	});
});
</script>


<div id="ajax-loading"><img src="assets/img/ajax-loader.gif"></div>
<div id="anc_header"><a href="#anc_hd"><span></span>TOP</a></div>

<script src="assets/js/wrest.js"></script>
</body>
</html>
