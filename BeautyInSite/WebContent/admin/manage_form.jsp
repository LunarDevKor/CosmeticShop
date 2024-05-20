<%@page import="com.cosmetic.member.account.vo.AccountVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<%
	AccountVO av = (AccountVO) request.getAttribute("av");
%>

<html lang="ko">
<head>
<meta charset="utf-8">
<title>회원정보수정</title>
<link rel="stylesheet" href="admin/css/admin.css">
<link rel="stylesheet" href="css/source/sweetalert2.min.css">
<link rel="stylesheet" href="css/source/animate.min.css">
<link rel="stylesheet" href="css/animated.css">
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
<script src="js/source/sweetalert2.all.min.js"></script>
</head>
<body>

<form name="fmemberform" id="fmemberform" action="manageUpdate.do" method="post">

<div id="memberform_pop" class="new_win">
	<h1>회원정보수정</h1>

	<section class="new_win_desc marb50">

	<h3 class="anc_tit">기본정보</h3>
	<div class="tbl_frm01">
		<table class="tablef">
		<colgroup>
			<col class="w130">
			<col>
			<col class="w130">
			<col>
		</colgroup>
		<tbody>
		<tr>
			<th scope="row">회원 이름</th>
		<% if(av != null) { %>
    <td><%=av.getName() %></td>
<% } else { %>
    <td>데이터 없음</td>
<% } %>
			<th scope="row">아이디</th>
				<% if(av != null) { %>
    <td><%=av.getId() %></td>
<% } else { %>
    <td>데이터 없음</td>
<% } %>
		</tr>
		<tr>
    <th scope="row">생년월일(6자)</th>
    <td><input type="text" name="ssn" value="<%= (av != null && av.getSsn() != null) ? av.getSsn() : "" %>" class="frm_input" readonly></td>
    <th scope="row">E-Mail</th>
    <td><input type="text" name="email" value="<%= (av != null && av.getEmail() != null) ? av.getEmail() : "" %>" email itemname="E-Mail" class="frm_input" size="30"></td>
</tr>
		<tr>
    <th scope="row">휴대폰 번호</th>
    <td><input type="text" name="tel" value="<%= av != null ? av.getTel() : "" %>" class="frm_input"></td>
    <td><input type="hidden" name="accNo" value="<%= av != null ? av.getAccNo() : "" %>" class="frm_input"></td>
</tr>
<tr>
    <th scope="row">주소</th>
    <td colspan="3">
        <input type="text" name="zip" value="02230" class="frm_input" size="8" maxlength="5">
        <a href="javascript:win_zip('fmemberform', 'zip', 'addr1', 'addr2', 'addr3', 'addr_jibeon');" class="btn_small grey">주소검색</a>
        <p class="mart5"><input type="text" name="addr1" value="<%= av != null ? av.getAddr1() : "" %>" class="frm_input" size="60"> 기본주소</p>
        <p class="mart5"><input type="text" name="addr2" value="<%= av != null ? av.getAddr2() : "" %>" class="frm_input" size="60"> 상세주소</p>
    </td>
</tr>
		<tr>
			
			<th scope="row">성별</th>
	<td>
    <input type="radio" name="gender" value="0" id="gender1" 
    <% if(av != null && "0".equals(av.getGender())) { %> checked <% } %> >
    <label for="gender1">남자</label>
    <input type="radio" name="gender" value="1" id="gender2" 
    <% if(av != null && "1".equals(av.getGender())) { %> checked <% } %> >
    <label for="gender2">여자</label>
</td>
		<tr>
			
			
		</tr>
	<tr>
	<th scope="row">회원 레벨</th>
	<td><%=(av != null) ? av.getGrdNo() : "" %></td>
</select>
	</td>
	<th scope="row">포인트</th>
	<td>
<%-- 		<b><%=(av != null) ? av.getPoint() : "" %></b> Point --%>
		<b><input type="text" name="point" value="<%=(av != null) ? av.getPoint() : "" %>" class="frm_input"></b>
<!-- 		<a href="http://demofran.com/admin/member/member_point_req.php?mb_id=tubeweb3" onclick="win_open(this,'pop_point_req','600','500','yes');return false;" class="btn_small grey marl10">강제적립</a> -->
	</td>
</tr>
   
					</table>
				</div>
			</td>
		</tr>
	

	<h3 class="anc_tit mart30">기타정보</h3>
	<div class="tbl_frm01">
		<table class="tablef">
		<colgroup>
			<col class="w130">
			<col>
			<col class="w130">
			<col>
		</colgroup>
		<tbody>
		
		<tr>
			<th scope="row">가입일자</th>
			<th scope="row"><%=(av != null) ? av.getRegDate() : "" %></th>
			<th scope="row">총구매금액</th>
			<td>31,560 원</td>
		</tr>
		
		<tr>
		</tbody>
		</table>
	</div>

	<div class="btn_confirm">
		<input type="button" value="저장" class="btn_medium" id="save" accesskey="s" >
		<button type="button" class="btn_medium bx-white" onclick="window.close();">닫기</button>
		
	</div>

	</section>
	
</div>
</form>

<script src="js/toast.js"></script>
<script>


$(function() {
	$('#save').on('click', function() {
		
		var formData = {};
		
		$.each($('#fmemberform').serializeArray(), function(index, field) {
		    formData[field.name] = field.value;
		});

		
		$.ajax({
			url: 'manageUpdate.do',
			type: 'POST',
			data: formData,
			success: function(resp){
				if(resp === 'SUCCESS'){
					Swal.fire({
						icon: 'success',
						title: '수정 성공!'
					}).then(() =>{
						window.close();
					});
				}else{
					Toast.fire({
						icon: 'error',
						title: '회원 정보 수정이 실패했습니다'
					})
				}
			},
			error: function(err){
				console.log(err);
			}
		})
	});
	
	
    $(".pt_pay_fld").hide();
	$(".mb_adm_fld").hide();
			$("#mb_grade").on("change", function() {
		$(".pt_pay_fld:visible").hide();
		$(".mb_adm_fld:visible").hide();
        var level = $(this).val();
		if(level >= 2 && level <= 6) {
			$(".pt_pay_fld").show();
		} else if(level == 1) {
			$(".mb_adm_fld").show();
		}
    });
});
</script>


<div id="ajax-loading"><img src="assets/img/ajax-loader.gif"></div>

<script src="admin/js/admin.js"></script>

<script src="assets/js/wrest.js"></script>
</body>

<jsp:include page="./layout/footer.jsp"></jsp:include>
</html>