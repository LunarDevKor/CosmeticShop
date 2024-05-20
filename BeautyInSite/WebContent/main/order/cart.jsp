<%@page import="java.util.ArrayList"%>
<%@page import="com.cosmetic.member.cart.vo.CartVO"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="com.cosmetic.member.account.vo.AccountVO"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="java.sql.Clob"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.Reader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../layout/header.jsp"/>
<%
AccountVO accVO = (AccountVO) request.getSession(false).getAttribute("LOGIN_USER");
List<CartVO> list = (List<CartVO>) request.getAttribute("list");
%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<p><img src="http://demofran.com/img/tit_cart.gif"></p>

<p class="pg_cnt mart30">
	<em>총 <%=list.size()%>개</em>의 상품이 장바구니에 있습니다.
</p>


<div class="tbl_head02 tbl_wrap">
	<table>
	<colgroup>
		<col class="w50">
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
		<th scope="col">
			<label for="ct_all" class="sound_only">상품전체</label>
			<input type="checkbox" name="ct_all" value="0" id="ct_all">
		</th>
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
<%
	long totalPrice = 0;
	long totalQty = 0;
	long totalPoint = 0;
	List<Long> numList = new ArrayList<>();
	if(list != null && list.size() != 0){
		
		for(CartVO cartVO : list){
			
			numList.add(cartVO.getProdNo());
		
		pageContext.setAttribute
				("totalPrice",
				totalPrice +=
				(cartVO.getProdVO().getProdPrice() * cartVO.getCartQty())
				);
				
		pageContext.setAttribute("totalQty", totalQty+=cartVO.getCartQty());
%>		
	<tr>
    <td style="text-align: center"><input type="checkbox" name="ct_check" value="<%=cartVO.getProdNo()%>"></td>
    <td style="text-align: center"><a href="<%=request.getContextPath()%>/prodDetail.do?prodNo=<%=cartVO.getProdNo()%>"><img src="<%=cartVO.getProdVO().getProdImg()%>" alt="Product Image" width=100% height=70%></a></td>
    <td style="text-align: center"><a href="<%=request.getContextPath()%>/prodDetail.do?prodNo=<%=cartVO.getProdNo()%>"><%=cartVO.getProdVO().getProdName()%></a></td>
    <td>
        <form action="cartUpdate.do" method="post">
            <input type="hidden" name="prodNo" value="<%=cartVO.getProdNo()%>">
            <input type="hidden" name="cartNo" value="<%=cartVO.getCartNo()%>">
           
            <input type="number" name="cartQty" value="<%=cartVO.getCartQty()%>" min="1" max="999">
            <input type="submit" value="수정" class="btn_lsmall bx-white">
        </form>
    </td>
    <td style="text-align: center"><%=cartVO.getProdVO().getProdPrice()%></td>
    <td style="text-align: center"><%= cartVO.getProdVO().getProdPrice() * cartVO.getCartQty() %></td>
       <td style="text-align: center"><%= (int) (cartVO.getGrdAccr() * (cartVO.getProdVO().getProdPrice()/100.0) *cartVO.getCartQty()) %></td>
		<%
			pageContext.setAttribute("totalPoint", totalPoint += (int)(cartVO.getGrdAccr() * (cartVO.getProdVO().getProdPrice()/100.0) *cartVO.getCartQty()));
		%>
    <td style="text-align: center">
        <a href="cartDelete.do?PROD_NO=<%=cartVO.getProdNo()%>&ACC_NO=<%=cartVO.getAccNo()%>" class="btn_lsmall bx-white">삭제</a>
    </td>
</tr>
<%
		}
	}else{
%>
	<tr><td colspan="8" class="empty_table">장바구니에 담긴 상품이 없습니다.</td></tr>	
<%
	}
%>
	</tbody>
	</table>
</div>
<div id="sod_bsk_btn">
	<div class="palt"><button type="button" id="sel_delete" class="btn_lsmall bx-red">선택상품 삭제</button></div>
	<div class="part"><button type="button" id="cartClear" class="btn_lsmall bx-white">장바구니 비우기</button></div>
</div>
<div id="sod_bsk_tot">
<div class="tbl_frm01 tbl_wrap">
				<table>
				<colgroup>
					<col class="w140">
					<col class="w140">
					<col>
				</colgroup>
				<tbody><tr>
					<th scope="row">포인트</th>
					<td class="tar">적립 포인트</td>
					<td class="tar bl"><%=totalPoint%>P</td>
				</tr>
				<tr>
					<th scope="row">상품</th>
					<td class="tar">주문수량 합계</td>
					<td class="tar bl"><%=totalQty%>개</td>
				</tr>
				<tr>
					<td class="list2 tac bold" colspan="2">현재 포인트 보유잔액</td>
					<td class="list2 tar bold"><%=accVO.getPoint()%>P</td>
				</tr>
				<tr>
					<td class="list2 tac bold" colspan="2">결제예정금액</td>
					<td class="list2 tar bold fc_red"><span class="spr"><%=totalPrice%><span>원</span></span></td>
				</tr>
				</tbody>
				</table>
			</div>
</div>
<div class="btn_confirm">
		<button type="button" id="cartOrder" class="btn_large wset">선택상품주문</button>
		<a href="<%=request.getContextPath()%>/index.do" class="btn_large">쇼핑계속하기</a>
</div>
<script>
$(function(){
	
	let cartOrder = $('#cartOrder');
	
	cartOrder.on('click', function() {
		
		var numListData = <%=numList%>;
		
		var xhr = new XMLHttpRequest();
        xhr.open("POST", "orderCartSave.do", true);
        xhr.setRequestHeader("Content-Type", "application/json");
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                location.href='orderProd.do';
            }
        };
        xhr.send(JSON.stringify({ numList: numListData }));
	});
	
	let ct_all = $('#ct_all');
	ct_all.on('click', function(){
		ct_check = $('input[name="ct_check"]');
		
		ct_check.each(function(){
			if(this.checked){
				this.checked = false;
			}else{
				this.checked = true;
			}
		});
	});
	
	$('#sel_delete').on('click', function() {

		let checkArr = new Array();
		
		let checkedValues = $('input[name="ct_check"]:checked').each(function() {
			checkArr.push($(this).val());
		});
		
		console.log(checkArr);
		
		$.ajax({
	 	url: 'cartDelete.do',
	 	type: 'POST',
	 	headers: {'Content-Type':'application/json'},
	 	data: JSON.stringify({ "values" : checkArr }),
	 	success: function(rst) {
			if(rst === 'SUCCESS'){
				Toast.fire({
					icon: 'success',
					title: '장바구니 품목이 성공적으로 삭제되었습니다'
				})
				
				setTimeout(function(){
					location.href="cartList.do";
				},1000);
			}else {
				Toast.fire({
					icon: 'error',
					title: '삭제에 실패하였습니다.'
				})
			}
	 	},
	 	error: function(err) {
			console.log(err);
	 	}
		});
	});
	
	
	$('#cartClear').on('click', function() {
		$.ajax({
			url: 'cartClear.do',
			type: 'GET',
			data: {
				accNo : '<%=accVO.getAccNo()%>'
			},
			success: function(rst){
				if(rst === 'SUCCESS'){
					Toast.fire({
						icon: 'success',
						title: '장바구니를 성공적으로 비웠습니다!'
					})
				}else{
					Toast.fire({
						icon: 'warning',
						title: '비울 상품이 존재하지 않습니다!'
					})
				}
			},
			error: function(err){
				console.log(err);
			}
		});
	});
})
</script>
	
<script src="js/toast.js"></script>	
<c:if test='${cartUpdateSuccess eq "SUCCESS"}'>
	<script>
	Toast.fire({
		icon : 'success',
		title : '성공적으로 수정되었습니다'
		<%session.removeAttribute("cartUpdateSuccess");%>
	});
	</script>
</c:if>

<c:if test='${cartUpdateFailure eq "FAILURE"}'>
	<script>
	Toast.fire({
		icon : 'error',
		title : '정상적으로 반영되지 않았습니다 다시 시도해주세요'
		<%session.removeAttribute("cartUpdateFailure");%>
	});
	</script>
</c:if>

<jsp:include page="../../layout/footer.jsp"/>