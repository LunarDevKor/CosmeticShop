<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="com.cosmetic.admin.vo.OrderVO"%>
<%@page import="java.util.List"%>
<%@page import="com.cosmetic.member.account.vo.AccountVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	AccountVO accVO = (AccountVO) session.getAttribute("LOGIN_USER");
	List<OrderVO> orderList = (List<OrderVO>) request.getAttribute("orderList"); 
%>
<jsp:include page="../../layout/header.jsp"/>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<div id="container">
		

<!-- 퀵메뉴 우측날개 시작 { -->
<div id="qcr">
	<ul>
		<li class="tit">최근 본 상품</li>
		<li>
			<p class="no_item">없음</p>		</li>
			</ul>
</div>
<!-- } 퀵메뉴 우측날개 끝 -->

<div class="qbtn_bx">
	<button type="button" id="anc_up">TOP</button>
	<button type="button" id="anc_dw">DOWN</button>
</div>

<script>
$(function() {
	var itemQty = 0; // 총 아이템 수량
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
		<span>주문/배송조회</span>
		<p class="pg_nav">HOME<i>&gt;</i>마이페이지<i>&gt;</i>주문/배송조회</p>
	</h2>

	<h2 class="anc_tit">상세보기 버튼을 클릭하시면 주문상세내역을 조회하실 수 있습니다.</h2>
	<div class="tbl_head02 tbl_wrap">
		<table>
		<colgroup>
			<col class="w100">
			<col>
			<col class="w100">
			<col class="w140">
		</colgroup>
		<thead>
		<tr>
			<th scope="col">주문일자</th>
			<th scope="col">상품정보</th>
			<th scope="col">결제금액</th>
			<th scope="col">상태</th>
		</tr>
		</thead>
		<tbody>
		<%	
			if(orderList != null){
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			for(OrderVO ov : orderList) { %>
				<tr>
			<td class="tac" rowspan="2">
				<p class="bold"><%=ov.getOrdDate().format(dtf)%></p>
				<p class="padt5"><a href="<%=request.getContextPath()%>/orderDetailHistory.do" class="btn_small detailshow">상세보기</a></p>
			</td>
		</tr>
				<tr class="rows">
			<td>
				<div class="ini_wrap">
					<table class="wfull">
					<colgroup>
						<col class="w70">
						<col>
					</colgroup>
					<tr>
						<td class="vat tal"><a href="<%=request.getContextPath()%>/prodDetail.do?prodNo=<%=ov.getProdNo()%>"><img src="<%=ov.getProdImg()%>" width="60" height="60"></a></td>
						<td class="vat tal">
							<a href="<%=request.getContextPath()%>/prodDetail.do?prodNo=<%=ov.getProdNo()%>"><%=ov.getProductName()%></a>
							<p class="padt3 fc_999">주문번호 : <%=ov.getOrdNo()%> / 수량 : <%=ov.getQuantity()%>개 / 배송비 : 0원</p>
													</td>
					</tr>
					</table>
				</div>
			</td>
			<td class="tar"><%=ov.getOrdTotalamt()%>원</td>
			<td class="tac">
				<%if(ov.getOrdStatus().equals("0")) {%>
				<p>주문처리중</p>
				<%} else {%>
				<p>배송중</p>
				<%} %>
											</td>
		</tr>
		<% } 
		}else{
		%>
										 <tr>
									<td colspan="4" class="empty_table">주문 내역이 없습니다.</td>
								</tr>
		<%
			}
		%>
				</tbody>
		</table>
	</div>

	</div>
		</div>
	</div>
	
	<jsp:include page="../../layout/footer.jsp"/>