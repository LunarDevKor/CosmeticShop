<%@page import="com.cosmetic.admin.vo.BrandVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../layout/header.jsp" />

<%
	List<BrandVO> list = (List<BrandVO>) request.getAttribute("list");
%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<div id="container">
		
<!-- 퀵메뉴 우측날개 시작 { -->
<div id="qcr" style="top: 20px; position: absolute;">
	<ul>
		<li class="tit">최근 본 상품</li>
		<li>
						<p class="dn c1" style="display: block;">
				<a href="http://demofran.com/shop/view.php?index_no=9"><img src="http://demofran.com/data/goods/1483411007/thumb-t7kcVYkeZQqHe4Thc3VU2Yf4VGzyHw_60x60.jpg" width="60" height="60"></a>
			</p>
						<p class="dn c1" style="display: block;">
				<a href="http://demofran.com/shop/view.php?index_no=16"><img src="http://demofran.com/data/goods/1483411597/thumb-l7xUjCx1dy5Tp6GlLAy2zMlRLHhxGx_60x60.jpg" width="60" height="60"></a>
			</p>
					</li>
				<li class="stv_wrap">
			<img src="http://demofran.com/img/bt_qcr_prev.gif" id="up">
			<span id="stv_pg">1/1</span>
			<img src="http://demofran.com/img/bt_qcr_next.gif" id="down">
		</li>
			</ul>
</div>
<!-- } 퀵메뉴 우측날개 끝 -->

<div class="qbtn_bx active">
	<button type="button" id="anc_up">TOP</button>
	<button type="button" id="anc_dw">DOWN</button>
</div>

<script>
$(function() {
	var itemQty = 2; // 총 아이템 수량
	var itemShow = 3; // 한번에 보여줄 아이템 수량
	var Flag = 1; // 페이지
	var EOFlag = parseInt(itemQty/itemShow); // 전체 리스트를 나눠 페이지 최댓값을 구하고
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

<h2 class="pg_title">
	<div class="inner">
		<dl class="txt_bx">
			<dt>브랜드샵</dt>
			<dd>각 브랜드샵의 상품들을 모아모아서 쇼핑하기!</dd>
		</dl>
	</div>
</h2>

<!-- 브랜드 검색 { -->
<div class="br_search">
	<form name="frmbrandsearch">
	<input type="hidden" name="qsort" id="qsort" value="br_name">
	<input type="hidden" name="qorder" id="qorder" value="asc">
	<input type="hidden" name="qword" id="qword" value="">
	<dl class="sch_inner">
		<dt><label for="ssch_q">SEARCH</label></dt>
		<dd><input type="text" name="search" value="" id="ssch_q" placeholder="브랜드샵명을 입력해주세요." maxlength="30"><button type="submit" class="btn_submit fa fa-search"></button></dd>
	</dl>
	<div id="br_sch">
		<div class="sch_tab_con">
		</div>
	</div>
	</form>
</div>

<script>
function set_sort(qsort, qorder)
{
    var f = document.frmbrandsearch;
    f.qsort.value = qsort;
    f.qorder.value = qorder;
	f.qword.value = '';
    f.submit();
}

function set_word(qword)
{
    var f = document.frmbrandsearch;
    f.qword.value = qword;
    f.submit();
}
</script>
<!-- } 브랜드 검색 -->

<!-- 브랜드 로고 { -->
<div class="br_list">
<ul>
<%
	if(list == null || list.size()==0){
%>	
	<tr>
		<td colspan="5">게시판이 존재하지 않습니다.</td>
	</tr>
<%
	}else{
		for(BrandVO bv : list){
%>	
<li>
    <form action="brandDetailList.do" method="get">
        <input type="hidden" name="brNo" value="<%=bv.getBrNo()%>"/>
        <input type="hidden" name="brName" value="<%=bv.getBrName()%>"/>
<%--         <input type="hidden" name="brImg" value="<%=brImg%>"/> --%>
        <a href="javascript:;" onclick="this.parentNode.submit();">
            <img src="<%=bv.getBrImg() %>" title="PREMIUM">
            <p class="mart8" ><%=bv.getBrName() %></p>
        </a>
    </form>
</li>
<%
		}
	}
%>
<!-- <li> -->
<!-- <a href="http://demofran.com/shop/brandlist.php?br_id=32"> -->
<!-- <img src="http://demofran.com/data/brand/M4jxUJXNy7qYwq9APwRGmkdgBRbc6B.jpg" title="SK매직"> -->
<!-- <p class="mart8">SK매직</p> -->
<!-- </a> -->
<!-- </li> -->
<!-- <li> -->
<!-- <a href="http://demofran.com/shop/brandlist.php?br_id=25"> -->
<!-- <img src="http://demofran.com/data/brand/httzV5vvHb8AeYXQUWnV7TQm3AmN6t.jpg" title="WMF"> -->
<!-- <p class="mart8">WMF</p> -->
<!-- </a> -->
<!-- </li> -->
<!-- <li> -->
<!-- <a href="http://demofran.com/shop/brandlist.php?br_id=36"> -->
<!-- <img src="http://demofran.com/data/brand/Kqw7CdsY6ZLNtH86w8rEHQjy36xnb9.jpg" title="로얄네이쳐"> -->
<!-- <p class="mart8">로얄네이쳐</p> -->
<!-- </a> -->
<!-- </li> -->
<!-- <li> -->
<!-- <a href="http://demofran.com/shop/brandlist.php?br_id=34"> -->
<!-- <img src="http://demofran.com/data/brand/nPqN7NJtlvmr8Kx3D1W4eyAdaEFKfc.jpg" title="삼성"> -->
<!-- <p class="mart8">삼성</p> -->
<!-- </a> -->
<!-- </li> -->
<!-- <li> -->
<!-- <a href="http://demofran.com/shop/brandlist.php?br_id=7"> -->
<!-- <img src="http://demofran.com/data/brand/deaDsl4Tz3XlfCzv6QncE31F1wlZFz.jpg" title="스위스밀리터리"> -->
<!-- <p class="mart8">스위스밀리터리</p> -->
<!-- </a> -->
<!-- </li> -->
<!-- <li> -->
<!-- <a href="http://demofran.com/shop/brandlist.php?br_id=6"> -->
<!-- <img src="http://demofran.com/data/brand/SJxTrJDuB8jrjbyNAHwcqEWqD6cWQK.jpg" title="스위스알파인클럽"> -->
<!-- <p class="mart8">스위스알파인클럽</p> -->
<!-- </a> -->
<!-- </li> -->
<!-- <li> -->
<!-- <a href="http://demofran.com/shop/brandlist.php?br_id=33"> -->
<!-- <img src="http://demofran.com/data/brand/WTDHkATwDAM5SsHvWbbyeWxCUaCQEa.jpg" title="신일"> -->
<!-- <p class="mart8">신일</p> -->
<!-- </a> -->
<!-- </li> -->
<!-- <li> -->
<!-- <a href="http://demofran.com/shop/brandlist.php?br_id=35"> -->
<!-- <img src="http://demofran.com/data/brand/vXmPpGwh5k7xTpZelWDqsWDQrBNT5Q.jpg" title="쌤소나이트"> -->
<!-- <p class="mart8">쌤소나이트</p> -->
<!-- </a> -->
<!-- </li> -->
<!-- <li> -->
<!-- <a href="http://demofran.com/shop/brandlist.php?br_id=8"> -->
<!-- <img src="http://demofran.com/data/brand/RyZdPKwjcwY7rby5pyNB2vd4XpNb9T.jpg" title="탠디"> -->
<!-- <p class="mart8">탠디</p> -->
<!-- </a> -->
<!-- </li> -->
<!-- <li> -->
<!-- <a href="http://demofran.com/shop/brandlist.php?br_id=9"> -->
<!-- <img src="http://demofran.com/data/brand/nXpqL61sFTpJTkZA9gS22w8PvQkvq4.jpg" title="테팔"> -->
<!-- <p class="mart8">테팔</p> -->
<!-- </a> -->
<!-- </li> -->
<!-- <li> -->
<!-- <a href="http://demofran.com/shop/brandlist.php?br_id=38"> -->
<!-- <img src="http://demofran.com/data/brand/ezDeDSTM2mFDlew6sfLbClflgPTHSy.jpg" title="필립스"> -->
<!-- <p class="mart8">필립스</p> -->
<!-- </a> -->
<!-- </li> -->
</ul>
</div>
<!-- } 브랜드 로고 -->
		</div>
	</div>
<jsp:include page="../layout/footer.jsp" />