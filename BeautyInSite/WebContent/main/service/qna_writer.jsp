<%@page import="com.cosmetic.member.account.vo.AccountVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../../layout/header.jsp"/>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Summernote CSS -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<!-- 부트스트랩 CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.2/css/bootstrap.min.css" rel="stylesheet">
<!-- 부트스트랩 JS 및 종속 라이브러리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.2/js/bootstrap.bundle.min.js"></script>
<!-- Summernote JS -->
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
</head>
<body>


<div id="container">

<!-- 퀵메뉴 우측날개 시작 { -->
<div id="qcr">
	<ul>
		<li class="tit">최근 본 상품</li>
		<li>
						<p class="dn c1">
				<a href="http://demofran.com/shop/view.php?index_no=16"><img src="http://demofran.com/data/goods/1483411597/thumb-l7xUjCx1dy5Tp6GlLAy2zMlRLHhxGx_60x60.jpg" width="60" height="60"></a>
			</p>
						<p class="dn c1">
				<a href="http://demofran.com/shop/view.php?index_no=12"><img src="http://demofran.com/data/goods/1483411284/thumb-NcEq6PgZABZ4yTEDMfbc7CMZjFb4w8_60x60.jpg" width="60" height="60"></a>
			</p>
						<p class="dn c1">
				<a href="http://demofran.com/shop/view.php?index_no=21"><img src="http://demofran.com/data/goods/1516934487/thumb-79666_Dqpxzw59F3Pzg9PrtDe9tSmaUCF7tu_60x60.jpg" width="60" height="60"></a>
			</p>
					</li>
				<li class="stv_wrap">
			<img src="http://demofran.com/img/bt_qcr_prev.gif" id="up">
			<span id="stv_pg"></span>
			<img src="http://demofran.com/img/bt_qcr_next.gif" id="down">
		</li>
			</ul>
</div>
<!-- } 퀵메뉴 우측날개 끝 -->

<div class="qbtn_bx">
	<button type="button" id="anc_up">TOP</button>
	<button type="button" id="anc_dw">DOWN</button>
</div>

<script>
$(function() {
	var itemQty = 3; // 총 아이템 수량
	var itemShow = 3; // 한번에 보여줄 아이템 수량
	var Flag = 1; // 페이지
	var EOFlag = parseInt(itemQty/itemShow); 
	// 전체 리스트를 나눠 페이지 최댓값을 구하고
	var itemRest = parseInt(itemQty%itemShow); // 나머지 값을 구한 후
	if(itemRest > 0) // 나머지 값이 있다면
	{
		EOFlag++; // 페이지 최댓값을 1 증가시킨다.
	}
	$('.c'+Flag).css('display','block');
	$('#stv_pg').text(Flag+'/'+EOFlag); // 페이지 초기 출력값
	$('#up').click(function() {
		if(Flag == 1)
		{
			alert('목록의 처음입니다.');
		} else {
			Flag--;
			$('.c'+Flag).css('display','block');
			$('.c'+(Flag+1)).css('display','none');
		}
		$('#stv_pg').text(Flag+'/'+EOFlag); // 페이지 값 재설정
	})
	$('#down').click(function() {
		if(Flag == EOFlag)
		{
			alert('더 이상 목록이 없습니다.');
		} else {
			Flag++;
			$('.c'+Flag).css('display','block');
			$('.c'+(Flag-1)).css('display','none');
		}
		$('#stv_pg').text(Flag+'/'+EOFlag); // 페이지 값 재설정
	});

	$(window).scroll(function () {
		var pos = $("#ft").offset().top - $(window).height();
		if($(this).scrollTop() > 0) {
			$(".qbtn_bx").fadeIn(300);
			if($(this).scrollTop() > pos) {
				$(".qbtn_bx").addClass('active');
			}else{
				$(".qbtn_bx").removeClass('active');
			}
		} else {
			$(".qbtn_bx").fadeOut(300);
		}
	});

	// 퀵메뉴 상위로이동
    $("#anc_up").click(function(){
        $("html, body").animate({ scrollTop: 0 }, 400);
    });

	// 하위로이동
    $("#anc_dw").click(function(){
		$("html, body").animate({ scrollTop: $(document).height() }, 400);
    });

	// 좌/우 퀵메뉴 높이 자동조절
		var Theight = $("#header").height() - $("#gnb").height();
	var ptop = 20;
		$("#qcr, #qcl").css({'top':ptop + 'px'});

	$(window).scroll(function () {
		if($(this).scrollTop() > Theight) {
			$("#qcr, #qcl").css({'position':'fixed','top':'67px','z-index':'999'});
		} else {
			$("#qcr, #qcl").css({'position':'absolute','top':ptop + 'px'});
		}
	});
});
</script>
<!-- } 우측 퀵메뉴 끝 -->
<div class="cont_inner">

<!-- 좌측메뉴 시작 { -->
<aside id="aside">
	<div class="aside_hd">
		<p class="eng">CS CENTER</p>
		<p class="kor">고객센터</p>
	</div>
	<dl class="aside_cs">	
		<dt><a href="notice.do">공지사항</a></dt>
		<dt><a href="qnaList.do">1:1 상담문의</a></dt>		
		<dt><a href="faq.do">자주묻는질문</a></dt>		
	</dl>
</aside>
<!-- } 좌측메뉴 끝 -->

<div id="con_lf">
	<h2 class="pg_tit">
		<span>1:1 상담문의</span>
		<p class="pg_nav">HOME<i>&gt;</i>고객센터<i>&gt;</i>1:1 상담문의</p>
	</h2>
	<% AccountVO accVO = (AccountVO)session.getAttribute("LOGIN_USER"); %>
	<form name="fqaform" id="fqaform" method="post" action="qnaWrite.do" onsubmit="return fqaform_submit(this);" autocomplete="off">
	<input type="hidden" name="accNo" value="<%=accVO.getAccNo() %>">

	<div class="tbl_frm02 tbl_wrap">
		<table>
		<colgroup>
			<col class="w100">
			<col>
		</colgroup>
		<tbody>
		<tr>
			<th scope="row">질문유형</th>
			<td>
				<select name="sbCate" required itemname="질문유형">
					<option value="">문의하실 유형을 선택하세요</option>
					<option value='2002'>주문결제</option>
					<option value='2003'>배송문의</option>
					<option value='2004'>반품문의</option>
					<option value='2005'>취소문의</option>
					<option value='2006'>교환문의</option>
					<option value='2007'>적립금</option>
					<option value='2008'>회원관련</option>
					<option value='2009'>기타문의</option>
				</select>
			</td>
		</tr>
		<tr>
			<th scope="row">제목</th>
			<td><input type="text" name="sbTitle" required itemname="제목" class="frm_input wfull required"></td>
		</tr>
		<tr>
			<th scope="row">내용</th>
			<td><textarea rows="" cols="" name="sbContent" class="summernote"></textarea></td>
		</tr>
		<tr>
			<th scope="row">이메일</th> 
			<td class="td_label">
				<input type="text" name="email" value="<%=accVO.getEmail() %>" class="frm_input">
				<p class="mart7">
					<span class="marr10">답변 내용을 메일로 받아보시겠습니까?</span>
					<label><input type="radio" name="email_send_yes" value="1"> 예</label>
					<label><input type="radio" name="email_send_yes" value="0" checked> 아니오</label>
				</p>
			</td>
		</tr>
		<tr>
			<th scope="row">휴대폰</th>
			<td class="td_label">
				<input type="text" name="cellphone" value="<%=accVO.getTel() %>" class="frm_input">
				<p class="mart7">
					<span class="marr10">답변 여부를 문자로 받아보시겠습니까?</span>
					<label><input type="radio" name="sms_send_yes" value="1"> 예</label>
					<label><input type="radio" name="sms_send_yes" value="0" checked> 아니오</label>
				</p>
			</td>
		</tr>
		</tbody>
		</table>
	</div>
	<div class="btn_confirm">
		<input type="submit" value="글쓰기" class="btn_lsmall">
		<a href="javascript:history.go(-1);" class="btn_lsmall bx-white">취소</a>
	</div>
	</form>
</div>

<script>
$('.summernote').summernote({
	height: 150
})
function fqaform_submit(f) {
	if(confirm("등록 하시겠습니까?") == false)
		return false;

	return true;
}
</script>
		</div>
	</div>

<jsp:include page="../../layout/footer.jsp"/>