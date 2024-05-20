<%@page import="com.cosmetic.member.account.vo.AccountVO"%>
<%@page import="com.cosmetic.product.vo.ProdVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../../layout/header.jsp"/>
<%
	Map<String,Object> parmaMap = (Map<String,Object>) request.getAttribute("paramMap"); 
	Map<String,List<ProdVO>> detailMap = (Map<String,List<ProdVO>>) request.getAttribute("detailMap"); 
%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="container">

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
				<a href="http://demofran.com/shop/view.php?index_no=20"><img src="http://demofran.com/data/goods/1516934486/thumb-30323_NcEq6PgZABZ4yTEDMfbc7CMZjFb4w8_60x60.jpg" width="60" height="60"></a>
			</p>
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
	var itemQty = 2; // 총 아이템 수량
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

<!-- 이니시스 결제 시작 { -->
<p><img src="http://demofran.com/img/orderform.gif"></p>

<p class="pg_cnt mart20">
	※ 주문하신 상품 내역 입니다 <em>수량 및 주문금액</em>이 맞는지 반드시 확인하시기 바랍니다.
</p>

<div class="tbl_head02 tbl_wrap">
	<table>
	<colgroup>
		<col class="w120">
		<col>
		<col class="w60">
		<col class="w90">
		<col class="w90">
		<col class="w90">
		<col class="w90">
	</colgroup>
	<thead>
	<tr>
		<th scope="col">이미지</th>
		<th scope="col">상품/옵션정보</th>
		<th scope="col">수량</th>
		<th scope="col">상품금액</th>
		<th scope="col">소계</th>
		<th scope="col">포인트</th>
		<th scope="col">배송비</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach var="prod" items="${detailMap.products}">
		<tr>
		<td class="tac"><img src="${prod.prodImg}" width="80" height="80"></td>
		<td class="td_name">${prod.prodName}<div class="sod_opt"><ul>
		</ul></div></td>
		<td class="tac">${prod.cartQty}</td>
		<td class="tar">${prod.prodPrice}</td>
		<td class="tar">${prod.prodPrice * prod.cartQty}</td>
		<td class="tar">${(prod.grdAccr * (prod.prodPrice/100.0) * prod.cartQty)+0} </td>
		<td class="tar">0</td>
	</tr>
	</c:forEach>
		</tbody>
	<tfoot>
	<tr>
		<td class="tar" colspan="7">
			(상품금액 : <strong>${paramMap.totalPrice}원</strong> +
			배송비 : <strong>0원</strong>) -
			(쿠폰할인 : <strong>0원</strong> +
			포인트결제 : <strong>${paramMap.usePoint}원</strong>) =
			총계 : <strong class="fc_red">${paramMap.totalPrice}원</strong>
		</td>
	</tr>
	</tfoot>
	</table>
</div>
<% AccountVO accVO = (AccountVO) request.getSession(false).getAttribute("LOGIN_USER"); %>
<section id="sod_fin_orderer">
	<h2 class="anc_tit">주문하시는 분</h2>
	<div class="tbl_frm01 tbl_wrap">
		<table>
		<colgroup>
			<col width="140">
			<col>
		</colgroup>
		<tr>
			<th scope="row">이름</th>
			<td><%=accVO.getName() %></td>
		</tr>
		<tr>
			<th scope="row">핸드폰</th>
			<td><%=accVO.getTel() %></td>
		</tr>
		<tr>
			<th scope="row">주소</th>
			<td>[<%=accVO.getZipCode()%>] <%=accVO.getAddr1()%> <%=accVO.getAddr2()%></td>
		</tr>
		<tr>
			<th scope="row">E-mail</th>
			<td><%=accVO.getEmail() %></td>
		</tr>
		</table>
	</div>
</section>

<section id="sod_fin_receiver">
	<h2 class="anc_tit">받으시는 분</h2>
	<div class="tbl_frm01 tbl_wrap">
		<table>
		<colgroup>
			<col class="w140">
			<col>
		</colgroup>
		<tr>
			<th scope="row">이름</th>
			<td>${paramMap.ordRecpName}</td>
		</tr>
		<tr>
			<th scope="row">핸드폰</th>
			<td>${paramMap.ordRecptel}</td>
		</tr>
		<tr>
			<th scope="row">주소</th>
			<td>${paramMap.addr}</td>
		</tr>
				<tr>
			<th scope="row">전하실 말씀</th>
			<td>${paramMap.ordShipnotice}</td>
		</tr>
				</table>
	</div>
</section>

<section id="sod_fin_pay">
	<h2 class="anc_tit">결제정보</h2>
	<div class="tbl_frm01 tbl_wrap">
		<table>
		<colgroup>
			<col class="w140">
			<col>
		</colgroup>
		<tr>
			<th scope="row">결제번호</th>
			<td>${paramMap.uid}</td>
			<th scope="row">결제방법</th>
			<c:if test="${paramMap.paymethod == '1'}">
			<td>카카오페이</td>
			</c:if>
			<c:if test="${paramMap.paymethod == '0'}">
			<td>신용카드</td>
			</c:if>
		</tr>
		<tr>
			<th scope="row">결제금액</th>
			<td class="fs14 bold">${paramMap.totalPrice}원</td>
		</tr>
		</table>
	</div>
</section>

<div id="display_pay_button" class="btn_confirm">
	<input type="button" value="주문내역보기" id="myOrderList" class="btn_large wset">
    <a href="<%=request.getContextPath()%>/index.do" class="btn_large bx-white">홈으로</a>
</div>
<% 
	String result = request.getAttribute("ORDERSUCCESS") == null ? "" : (String)request.getAttribute("ORDERSUCCESS");
	
	if(result.equals("SUCCESS")){
%>
	<script>
	Toast.fire({
		icon: 'success',
		title: '주문이 성공적으로 처리되었습니다!'
	})
	</script>
<%
	}
%>
<script src="js/toast.js"></script>
<script>
$(function(){
	$('#myOrderList').on('click', function() {
		location.href="orderhistory.do";		
	})
});
</script>
		</div>
	</div>
	
<jsp:include page="../../layout/footer.jsp"/>

