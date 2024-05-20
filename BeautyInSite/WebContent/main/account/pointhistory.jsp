<%@page import="com.cosmetic.member.account.vo.AccountVO"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../../layout/header.jsp"/>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	AccountVO accVO = (AccountVO) session.getAttribute("LOGIN_USER");
%>
<style>
td {
	text-align: center;
}
</style>
</head>
<body>

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
		<span>포인트조회</span>
		<p class="pg_nav">HOME<i>&gt;</i>마이페이지<i>&gt;</i>포인트조회</p>
	</h2>
	<% 
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		pageContext.setAttribute("dtf", dtf);
	%>
	<c:choose>
	<c:when test="${pointList == null && pointList.size() == 0}">
	<p class="pg_cnt">
		<em>총 0건</em>의 포인트내역이 있습니다.
	</p>
	</c:when>
	<c:otherwise>
	<p class="pg_cnt">
		<em>총 ${pointList.size()}건</em>의 포인트내역이 있습니다.
	</p>
	<div class="tbl_head02 tbl_wrap">
		<table style="text-align: center">
		<colgroup>
			<col width="140">
			<col>
			<col width="90">
			<col width="90">
			<col width="90">
		</colgroup>
		<thead>
		<tr>
			<th scope="col">일시</th>
			<th scope="col" colspan="2">내용</th>
			<th scope="col">지급포인트</th>
			<th scope="col">사용포인트</th>
		</tr>
		</thead>
		<tbody>
			<c:set var="payment" value="0"/>
			<c:set var="used" value="0"/>
			
			<c:forEach var="point" items="${pointList}">
			<tr>
			<td>${point.updDate.format(dtf)}</td>
			<td colspan="2">${point.updContent}</td>
			<c:set var="paymentValue" value="${point.pointType eq 0 ? point.pointUsed : 0}"/>
            <c:set var="usedValue" value="${point.pointType eq 1 ? point.pointUsed : 0}"/>
			<c:set var="totalPayment" value="${payment + paymentValue}"/>
            <c:set var="totalUsed" value="${used + usedValue}"/>
			<td>${paymentValue}</td>
			<td>${usedValue}</td>
			</tr>
			</c:forEach>	
		</tbody>
		<tfoot>
			<c:set var="payment" value="0"/>
			<c:set var="used" value="0"/>
		<tr>
			<th scope="row" colspan="3">소계</th>
			<td class="td_num fc_red">${totalPayment}</td>
			<td class="td_num fc_red">${totalUsed}</td>
		</tr>
		<tr>
			<th scope="row" colspan="3">보유포인트</th>
			<td class="td_num fc_red" colspan="2">${LOGIN_USER.point}</td>
		</tr>
		</tfoot>
		</table>
	</div>
	</c:otherwise>
	</c:choose>

	</div>
		</div>
	</div>
<jsp:include page="../../layout/footer.jsp"/>