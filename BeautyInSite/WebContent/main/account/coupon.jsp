<%@page import="com.cosmetic.member.account.vo.AccountVO"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% 
	DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
	pageContext.setAttribute("dtf", dtf);
	AccountVO accVO = (AccountVO) session.getAttribute("LOGIN_USER");
%>
<jsp:include page="../../layout/header.jsp"/>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			<!-- } 상단부 영역 끝 -->
			<script>
			$(function(){
				// 상단메뉴 따라다니기
				var elem1 = $("#hd_banner").height() + $("#tnb").height() + $("#hd_inner").height();
				var elem2 = $("#hd_banner").height() + $("#tnb").height() + $("#hd").height();
				var elem3 = $("#gnb").height();
				$(window).scroll(function () {
					if($(this).scrollTop() > elem1) {
						$("#gnb").addClass('gnd_fixed');
						$("#hd").css({'padding-bottom':elem3})
					} else if($(this).scrollTop() < elem2) {
						$("#gnb").removeClass('gnd_fixed');
						$("#hd").css({'padding-bottom':'0'})
					}
				});
			});
			</script>
		</div>

			</div>

	<div id="container">

<!-- 퀵메뉴 우측날개 시작 { -->
<div id="qcr">
	<ul>
		<li class="tit">최근 본 상품</li>
		<li>
						<p class="dn c1">
				<a href="http://demofran.com/shop/view.php?index_no=11"><img src="http://demofran.com/data/goods/1483411200/thumb-mUTbYFV6RKVvmYLLdFAjpB7zQp5DHR_60x60.jpg" width="60" height="60"></a>
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
	var itemQty = 1; // 총 아이템 수량
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
					<p class="eng">MY PAGE</p>
					<p class="kor">마이페이지</p>
				</div>
				<div class="aside_name" style="text-align: center; padding-right: 6px">
				<img id="preview" style="border-radius: 25%; overflow: hidden; width: 100px; height: 100px;" src="data:image/jpg;base64,<%=accVO.getImgProfile()%>" alt="프로필 이미지">
				</div>
				<div class="aside_name" style="text-align: center">
				<%=accVO.getName() %>
				</div>
				<ul class="aside_bx">
					<li>포인트 <span><a href="<%=request.getContextPath()%>/pointhistory.do"><%=accVO.getPoint()%></a>P</span></li>
				</ul>
				<dl class="aside_my">
					<dt>주문현황</dt>
					<dd>
						<a href="<%=request.getContextPath()%>/orderhistory.do">주문/배송조회</a>
					</dd>
					<dt>쇼핑통장</dt>
					<dd>
						<a href="<%=request.getContextPath()%>/pointhistory.do">포인트조회</a>
					</dd>
					<dd>
						<a href="<%=request.getContextPath()%>/mycoupon.do">쿠폰관리</a>
					</dd>
					<dt>관심상품</dt>
					<dd>
						<a href="<%=request.getContextPath()%>/cartList.do">장바구니</a>
					</dd>
					<dd>
						<a href="<%=request.getContextPath()%>/wishList.do">찜한상품</a>
					</dd>
					<dt>회원정보</dt>
					<dd>
						<a href="<%=request.getContextPath()%>/edit.do">회원정보수정</a>
					</dd>
					<dd class="marb5">
						<a href="<%=request.getContextPath()%>/leave.do" id="deleteAcc">회원탈퇴</a>
					</dd>
				</dl>
			</aside>
			<!-- } 좌측메뉴 끝 -->

<div id="con_lf">
	<h2 class="pg_tit">
		<span>쿠폰관리</span>
		<p class="pg_nav">HOME<i>&gt;</i>마이페이지<i>&gt;</i>쿠폰관리</p>
	</h2>

	<nav id="tab_cate">
		<ul id="tab_cate_ul">
			<li class="active"><a href="http://demofran.com/shop/coupon.php">사용가능한 쿠폰</a></li>
		</ul>
	</nav>

	<p class="pg_cnt">
		<em>총 ${couponList.size()}건</em>의 쿠폰내역이 있습니다.
	</p>

	<div class="tbl_head02 tbl_wrap">
		<table>
		<colgroup>
			<col class="w50">
			<col>
			<col>
			<col>
			<col class="w140">
		</colgroup>
		<thead>
		<tr>
			<th scope="col">번호</th>
			<th scope="col">할인쿠폰</th>
			<th scope="col">할인금액(율)</th>
			<th scope="col">사용기한</th>
			<th scope="col">취득일자</th>
		</tr>
		</thead>
		<tbody>
		
		<c:choose>
		
		<c:when test="${couponList == null && couponList.size() == 0}">
			<tr><td colspan="6" class="empty_list">자료가 없습니다.</td></tr>		
		</c:when>
		
		<c:otherwise>
			<c:forEach var="coupon" items="${couponList}">
				<tr>
					<td>${coupon.cpNo}</td>
					<td>${coupon.cpName}</td>
					<td>${coupon.cpDiscount}</td>
					<td>${coupon.cpExpdate.format(dtf)}</td>
					<td>${coupon.cpPmtdate.format(dtf)}</td>
				</tr>
			</c:forEach>
		</c:otherwise>
		
		</c:choose>
		
		</tbody>
		</table>
	</div>

	</div>
		</div>
	</div>
<jsp:include page="../../layout/footer.jsp"/>