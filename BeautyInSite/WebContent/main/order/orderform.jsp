<%@page import="com.cosmetic.member.account.vo.AccountVO"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.cosmetic.product.vo.ProdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../../layout/header.jsp"/>
<% 
	List<ProdVO> prodList = (List<ProdVO>) request.getAttribute("prodList");
	int qty = (String)request.getAttribute("qty") == null ? 0 : (Integer.parseInt((String)request.getAttribute("qty")));
	AccountVO accVO = (AccountVO) request.getSession(false).getAttribute("LOGIN_USER");
%>
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

<!-- 주문서작성 시작 { -->
<p><img src="http://demofran.com/img/orderform.gif"></p>

<p class="pg_cnt mart20">
	※ 주문하실 상품 내역에 <em>수량 및 주문금액</em>이 틀리지 않는지 반드시 확인하시기 바랍니다.
</p>

<form name="buyform" id="buyform" method="post" action="<%=request.getContextPath()%>/orderDetail.do" autocomplete="off">

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
		<%
			int total_accr = 0;
			int total_price = 0;
			int total_qty = 0;
			
			for(ProdVO pv : prodList){
				
			if(qty == 0) qty = (int)pv.getCartQty();
			if(prodList.size() >= 2) qty = (int)pv.getCartQty();
		%>
		<tr>
		<td class="tac">
		<img src="<%=pv.getProdImg()%>" width="80" height="80">		</td>
		<td class="td_name"><%=pv.getProdName()%><div class="sod_opt"><ul>
</ul></div></td>
		<td class="tac"><%=qty%>
		<input type="hidden" name="qty" value="<%=qty%>">
		<input type="hidden" name="prodNo" value="<%=pv.getProdNo()%>">
		<input type="hidden" name="prodName" value="<%=pv.getProdName() %>">
		<input type="hidden" name="prodPrice" value="<%=pv.getProdPrice()%>">
		<input type="hidden" name="prodImg" value="<%=pv.getProdImg()%>">
		<input type="hidden" name="grdAccr" value="<%=pv.getGrdAccr()%>">
		</td>
		<td class="tar"><%=pv.getProdPrice()%></td>
		<td class="tar"><%=pv.getProdPrice() * qty%></td>
		<td class="tar">
		<%=(int)(pv.getGrdAccr() * (pv.getProdPrice()/100.0) * qty)%>
		</td>
		<td class="tar">0</td>
	</tr>
		<%
			
				pageContext.setAttribute("total_accr", total_accr += (int)(pv.getGrdAccr() * (pv.getProdPrice()/100.0) * qty));
				pageContext.setAttribute("total_price", total_price += (pv.getProdPrice() * qty));
				pageContext.setAttribute("total_qty", total_qty += qty);
			}
		
		%>
		</tbody>
	</table>
</div>

<div id="sod_bsk_tot">
	<table class="wfull">
	<h2 class="anc_tit">결제 예상금액 통계</h2>
	<tr>
		<td class="w50p">
			<div class="tbl_frm01 tbl_wrap">
				<table>
				<colgroup>
					<col class="w140">
					<col class="w140">
					<col>
				</colgroup>
				<tr>
					<th scope="row">포인트</th>
					<td class="tar">적립 포인트</td>
					<td class="tar bl">${total_accr}</td>
				</tr>
				<tr>
					<th scope="row" rowspan="2">상품</th>
					<td class="tar">상품금액 합계</td>
					<td class="tar bl"><span class="spr">${total_price}<span>원</span></span></td>
				</tr>
				<tr>
					<td class="tar">주문수량 합계</td>
					<td class="tar bl">${total_qty}</td>
				</tr>
				<tr>
					<td class="list2 tac bold" colspan="2">현재 포인트 보유잔액</td>
					<td class="list2 tar bold"><%=accVO.getPoint() %>P</td>
				</tr>
				<tr>
					<td class="list2 tac bold" colspan="2">결제예정금액</td>
					<td class="list2 tar bold fc_red"><span class="spr">
					${total_price}
					<span>원</span></span></td>
				</tr>
				</table>
			</div>
		</td>
	</tr>
	</table>
</div>

<section id="sod_fin_orderer">
	<h2 class="anc_tit">주문하시는 분</h2>
	<div class="tbl_frm01 tbl_wrap">
		<table>
		<colgroup>
			<col class="w140">
			<col>
		</colgroup>
				<tr>
			<th scope="row">이름</th>
			<td><input type="text" name="f_name" value="<%=accVO.getName()%>" required itemname="이름" class="frm_input required" size="20"></td>
		</tr>
		<tr>
			<th scope="row">핸드폰</th>
			<td><input type="text" name="f_phone" value="<%=accVO.getTel()%>" required itemname="핸드폰" class="frm_input required" size="20"></td>
		</tr>
		<tr>
			<th scope="row">주소</th>
			<td>
				<div>
					<input type="text" name="f_zip" value="<%=accVO.getZipCode() %>" required itemname="우편번호" class="frm_input required" maxLength="5" size="8"> <a href="javascript:win_zip('buyform', 'b_zip', 'b_addr1', 'b_addr2', 'b_addr3', 'b_addr_jibeon');" class="btn_small grey">주소검색</a>
				</div>
				<div class="padt5">
					<input type="text" name="f_addr1" value="<%=accVO.getAddr1()%>" required itemname="주소" class="frm_input required" size="60" readonly> 기본주소
				</div>
				<div class="padt5">
					<input type="text" name="f_addr2" value="<%=accVO.getAddr2()%>"class="frm_input" size="60"> 상세주소
				</div>
				<input type="hidden" name="f_addr3" class="frm_input" size="60" readonly>
			</td>
		</tr>
		<tr>
			<th scope="row">E-mail</th>
			<td><input type="text" name="email" value="<%=accVO.getEmail()%>" required email itemname="E-mail" class="frm_input required" size="30"></td>
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
			<th scope="row">배송지선택</th>
			<td class="td_label">
				<label><input type="radio" name="ad_sel_addr" value="1" checked> 주문자와 동일</label>
				<label><input type="radio" name="ad_sel_addr" value="2"> 신규배송지</label>
								<label><input type="radio" name="ad_sel_addr" value="3"> 배송지목록</label>
							</td>
		</tr>
		<tr>
			<th scope="row">이름</th>
			<td><input type="text" name="b_name" required itemname="이름" class="frm_input required" size="20"></td>
		</tr>
		<tr>
			<th scope="row">핸드폰</th>
			<td><input type="text" name="b_phone" required itemname="핸드폰" class="frm_input required" size="20"></td>
		</tr>
		<tr>
			<th scope="row">주소</th>
			<td>
				<div>
					<input type="text" name="b_zip" value="" required itemname="우편번호" class="frm_input required" maxLength="5" size="8"> <a href="javascript:win_zip('buyform', 'b_zip', 'b_addr1', 'b_addr2', 'b_addr3', 'b_addr_jibeon');" class="btn_small grey">주소검색</a>
				</div>
				<div class="padt5">
					<input type="text" name="b_addr1" value="" required itemname="주소" class="frm_input required" size="60" readonly> 기본주소
				</div>
				<div class="padt5">
					<input type="text" name="b_addr2" value=""class="frm_input" size="60"> 상세주소
				</div>
				<input type="hidden" name="b_addr3" class="frm_input" size="60" readonly>
			</td>
		</tr>
		<tr>
			<th scope="row">전하실말씀</th>
			<td>
				<select name="sel_memo">
					<option value="">요청사항 선택하기</option>
					<option value="부재시 경비실에 맡겨주세요.">부재시 경비실에 맡겨주세요</option>
					<option value="빠른 배송 부탁드립니다.">빠른 배송 부탁드립니다.</option>
					<option value="부재시 핸드폰으로 연락바랍니다.">부재시 핸드폰으로 연락바랍니다.</option>
					<option value="배송 전 연락바랍니다.">배송 전 연락바랍니다.</option>
				</select>
				<textarea name="memo" class="frm_textbox h60 mart5" rows="3"></textarea>
				<span class="frm_info"><strong class="fc_red">"택배사원"</strong>에 전하실 말씀을 써주세요~!<br>C/S관련문의는 고객센터에 작성해주세요. 이곳에 남기시면 확인이 불가능합니다.</span>
			</td>
		</tr>
		</table>
	</div>
</section>

<section id="sod_fin_pay">
	<h2 class="anc_tit">결제정보 입력</h2>
	<div class="tbl_frm01 tbl_wrap">
		<table>
		<colgroup>
			<col class="w140">
			<col>
		</colgroup>
		<tr>
			<th scope="row">결제방법</th>
			<td class="td_label">
				<input type="radio" name="paymethod" id="creditCard" value="신용카드"> <label for="creditCard">신용카드</label>
				<input type="radio" name="paymethod" id="kakao_pay" value="카카오페이"><label for="kakao_pay">카카오페이</label>
				<input type="radio" name="paymethod" id="toss_pay" value="토스페이"><label for="toss_pay">토스페이</label>
			</td>
		</tr>
		<tr>
			<th scope="row">합계</th>
			<td class="bold">${total_price}원</td>
		</tr>
				<tr>
			<th scope="row">할인쿠폰</th>
			<td><strong><span id="dc_amt">0</span>원 <span id="dc_cancel" style="display:none"><a href="javascript:coupon_cancel();">X</a></span></strong>
			<span id="dc_coupon"><a href="<%=request.getContextPath()%>/orderCoupon.do" onclick="win_open(this,'win_coupon','740','679','yes');return false"><span class='fc_197 tu'>사용 가능 쿠폰 0장</a> </span></span></td>
			<%
				session.setAttribute("prodList", prodList);
			%>
		</tr>
		<tr>
			<th scope="row">포인트결제</th>
			<td>
				<input type="text" name="use_point" value="0" class="frm_input" size="12" id="usePoint" style="font-weight:bold;"> 원 보유포인트 : <%=accVO.getPoint()%>P								(<strong>5,000P</strong> 부터 사용가능)
			</td>
		</tr>
				<tr>
			<th scope="row">총 결제금액</th>
			<td>
				<input type="text" name="tot_price" value="" class="frm_input" size="12" readonly style="font-weight:bold;color:#ec0e03;"> 원
			</td>
		</tr>
		</table>
	</div>
</section>

<div class="btn_confirm">
	<input type="button" id="payment" value="결제하기" class="btn_large wset">
	<a href="<%=request.getContextPath()%>/orderPayment.do" class="btn_large bx-white">취소</a>
</div>
</form>

<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script src="js/toast.js"></script>
<script src="js/opener.js"></script>
<script>


$(function() {
	
	IMP.init('imp63527867');
	var total_price = ${total_price};

	$('#payment').on('click', function() {
		let paymethod = $('input[name="paymethod"]:checked');
		
		if(paymethod.length > 0){
			let type = paymethod.val();
			
			if(type === '신용카드'){
				payments('html5_inicis');
			}else if(type === '카카오페이'){
				payments('kakaopay');
			}else {
				payments('tosspay');
			}
			
		}else{
			Toast.fire({
				icon: 'warning',
				title: '결제방식을 선택해주세요'
			});
		}
		
		function createUid(){
			let currentDate = new Date();
			let randomCode = Math.floor(Math.random() * 1000000);
			
			var year = currentDate.getFullYear();
			var month = currentDate.getMonth() + 1;
			var day = currentDate.getDate();
			
			month = month < 10 ? '0' + month : month;
			day = day < 10 ? '0' + day : day;
			
			let date = ''+year+month+day + randomCode + <%=accVO.getAccNo()%>;
			return date;
		}
		
		function payments(pg){
			console.log('name >> ',$('.td_name').text());
			console.log('price >> ',$('input[name=tot_price]').val());
			
			let date = createUid();
			console.log(date);
			
			let point = $('input[name="use_point"]').val();
			
			IMP.request_pay({
		      pg: pg,
		      pay_method: "card",
		      merchant_uid: date,   // 주문번호
		      name: $('.td_name').text().replace(/\s/g,''),
		      amount: parseInt($('input[name=tot_price]').val()),
		      buyer_email: "<%=accVO.getEmail()%>",
		      buyer_name: "<%=accVO.getName()%>",
		      buyer_tel: "<%=accVO.getTel()%>",
		      buyer_addr: "<%=accVO.getAddr1() + accVO.getAddr2()%>",
		      buyer_postcode: "<%=accVO.getAccNo()%>"
		    }, function (rsp) { // callback
		    	
		    	if(rsp.success){
		    		Swal.fire({
		    			icon: 'success',
		    			title: '결제가 성공적으로 완료되었습니다!'
		    		}).then(() => {
		    			let uid = $('<input>').attr({
		    			type: 'hidden',
		    			name: 'uid',
		    			value: date
		    			});
		    			
		    			$('#buyform').append(uid);
		    			$('#buyform').append($('<input>').attr({type: 'hidden', name: 'point', value: ${total_accr} } ));
		    			$('#buyform').append($('<input>').attr({type: 'hidden', name: 'point_use', value: point } ));
		    			$('#buyform').submit();
		    		});
		    	}else{
		    		Swal.fire({
		    			icon: 'error',
		    			title: rsp.error_msg
		    		})
		    	}
		    });
		}
		
	});
	
	updateTotalPrice();
	
	$('#dc_amt').on('change', function(){
		updateTotalPrice();
	});

	$('#usePoint').on('keyup', function(){
		let usePt = $(this).val();
		let pt = '<%=accVO.getPoint()%>';
		if(parseInt(usePt) > parseInt(pt)){
			Toast.fire({
				icon: 'warning',
				title: '현재 보유하고 계신 포인트보다 높습니다!!'
			})
			
			$(this).val(0);
		}
		updateTotalPrice();
	});
	
	function updateTotalPrice() {
		let dcAmt = parseInt($('#dc_amt').text().replace('원','').trim()) || 0;
		let usePoint = parseInt($('#usePoint').val()) || 0;
		
		let totalPrice = total_price - (dcAmt + usePoint);
		
		$('input[name=tot_price]').val(totalPrice);
	}

	$("input[name=b_addr2]").focus(function() {
	    var zip = $("input[name=b_zip]").val().replace(/[^0-9]/g, "");
	    if(zip == "")
	        return false;
	
	    var code = String(zip);
	    calculate_sendcost(code);
	});

	// 배송지선택
	$("input[name=ad_sel_addr]").on("click", function() {
		var addr = $(this).val();
	
		if(addr == "1") {
			gumae2baesong(true);
		} else if(addr == "2") {
			gumae2baesong(false);
		} else {
			win_open(tb_shop_url+'/orderaddress.php','win_address', 600, 600, 'yes');
		}
	});

	$("select[name=sel_memo]").change(function() {
	     $("textarea[name=memo]").val($(this).val());
	});
	
	function pay_info(rsp){
		
	}
});

function coupon_cancel() {
	var f = document.buyform;
	var sell_price = parseInt(no_comma(f.tot_price.value)); // 최종 결제금액
	var mb_coupon  = parseInt(f.coupon_total.value); // 쿠폰할인
	var tot_price  = sell_price + mb_coupon;

	$("#dc_amt").text(0);
	$("#dc_cancel").hide();
	$("#dc_coupon").show();

	$("input[name=tot_price]").val(number_format(String(tot_price)));
	$("input[name=coupon_total]").val(0);
	$("input[name=coupon_price]").val("");
	$("input[name=coupon_lo_id]").val("");
	$("input[name=coupon_cp_id]").val("");
}

// 구매자 정보와 동일합니다.
function gumae2baesong(checked) {
    var f = document.buyform;

    if(checked == true) {
		f.b_name.value			= '<%=accVO.getName()%>';
		f.b_phone.value			= '<%=accVO.getTel()%>';
		f.b_zip.value			= '<%=accVO.getZipCode()%>';
		f.b_addr1.value			= '<%=accVO.getAddr1()%>';
		f.b_addr2.value			= '<%=accVO.getAddr2()%>';

    } else {
		f.b_name.value			= '';
		f.b_phone.value		= '';
		f.b_zip.value			= '';
		f.b_addr1.value			= '';
		f.b_addr2.value			= '';
    }
}

gumae2baesong(true);


</script>
		</div>
	</div>

<jsp:include page="../../layout/footer.jsp"/>

