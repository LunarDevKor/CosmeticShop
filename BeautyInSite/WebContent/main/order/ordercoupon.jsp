<%@page import="com.cosmetic.member.account.vo.AccountVO"%>
<%@page import="com.cosmetic.member.coupon.vo.CouponVO"%>
<%@page import="com.cosmetic.product.vo.ProdVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<meta charset="utf-8">
<meta http-equiv="imagetoolbar" content="no">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="author" content="샘플샵, TubeWeb">
<meta name="description" content="샘플샵 - PHP 웹솔루션 전문 개발업체">
<meta name="keywords" content="PHP, 쇼핑몰솔루션, 독립형쇼핑몰, 입점형쇼핑몰, 독립몰, 입점몰, 몰인몰, 분양쇼핑몰, 분양몰, 프랜차이즈몰, 홈빌더">
<!-- Open Graph -->
<meta property="og:type" content="website">
<meta property="og:title" content="쿠폰적용 및 조회">
<meta property="og:description" content="샘플샵 - PHP 웹솔루션 전문 개발업체">
<meta property="og:url" content="http://demofran.com">
<meta property="og:site_name" content="행복을 주는 쇼핑몰!">
<meta property="og:image" content="http://demofran.com/data/banner/PC6g1NMhDVSjEVxesJjMAkWQDTmpsr.jpg?v=20240117231357">
<meta property="og:locale" content="ko_KR">
<meta name="robots" content="index,follow">
<title>쿠폰적용 및 조회 | 샘플샵 - PHP 웹솔루션 전문 개발업체</title>
<link rel="stylesheet" href="assets/css/default.css">
<link rel="stylesheet" href="assets/theme/basic/style.css">
<link rel="shortcut icon" href="http://demofran.com/data/banner/JnLfWUSUyR6sXJP5n3Re4Fvdc93k93.ico" type="image/x-icon">
<script>
var tb_url = "http://demofran.com";
var tb_bbs_url = "http://demofran.com/bbs";
var tb_shop_url = "http://demofran.com/shop";
var tb_mobile_url = "http://demofran.com/m";
var tb_mobile_bbs_url = "http://demofran.com/m/bbs";
var tb_mobile_shop_url = "http://demofran.com/m/shop";
var tb_is_member = "1";
var tb_is_mobile = "";
var tb_cookie_domain = "";
</script>
<script src="assets/js/jquery-3.5.1.min.js"></script>
<script src="assets/js/jquery-ui-1.10.3.custom.js"></script>
<script src="assets/js/common.js"></script>
<script src="assets/js/slick.js"></script>
<style id="mttstyle">
    .tippy-box[data-theme~="custom"] {
      font-size: 14px  !important;
      max-width: 200px  !important;
      text-align: center !important;
      backdrop-filter: blur(4px) !important;
      background-color: #000000b8 !important;
      color: #ffffffff !important;
      overflow-wrap: break-word !important;
      font-family: Arial !important;
    }
    [data-tippy-root] {
      display: inline-block !important;
      visibility: visible  !important;
      position: absolute !important;
    }
    .tippy-box[data-theme~='custom'][data-placement^='top'] > .tippy-arrow::before {
      border-top-color: #000000b8 !important;
    }
    .tippy-box[data-theme~='custom'][data-placement^='bottom'] > .tippy-arrow::before {
      border-bottom-color: #000000b8 !important;
    }
    .tippy-box[data-theme~='custom'][data-placement^='left'] > .tippy-arrow::before {
      border-left-color: #000000b8 !important;
    }
    .tippy-box[data-theme~='custom'][data-placement^='right'] > .tippy-arrow::before {
      border-right-color: #000000b8 !important;
    }
    .mtt-highlight{
      background-color: #21dc6d40  !important;
      position: absolute !important;   
      z-index: 100000100 !important;
      pointer-events: none !important;
      display: inline !important;
      border-radius: 3px !important;
    }
    .ocr_text_div{
      position: absolute;
      opacity: 0.7;
      color: transparent !important;
      border: 2px solid CornflowerBlue;
      background: none !important;
    }
        #ytp-caption-window-container .ytp-caption-segment {
          cursor: text !important;
          user-select: text !important;
        }
        .caption-visual-line{
          display: flex  !important;
          align-items: stretch  !important;
        }
        .captions-text .caption-visual-line:first-of-type:after {
          content: '⣿⣿';
          background-color: #000000b8;
          display: inline-block;
          vertical-align: top;
          opacity:0;
          transition: opacity 0.7s ease-in-out;
        }
        .captions-text:hover .caption-visual-line:first-of-type:after {
          opacity:1;
        }
        .ytp-pause-overlay {
          display: none !important;
        }
        .ytp-expand-pause-overlay .caption-window {
          display: block !important;
        }
      </style></head>
<body>
<form name="flist" method="post" class="new_win">

<%
	List<ProdVO> prodList = (List<ProdVO>) session.getAttribute("prodList");
	List<CouponVO> couponList = (List<CouponVO>) request.getAttribute("couponList");
	AccountVO accVO = (AccountVO) request.getAttribute("accVO");
	session.removeAttribute("prodList");
%>

<h1 id="win_title">쿠폰적용 및 조회</h1>

<div class="win_desc marb10">
	<p class="bx-danger">
		* 쿠폰적용시 개별 (주문/상품) 에 한해서만 적용 됩니다 (단! 중복할인 쿠폰은 제외)<br>
		* 쿠폰적용시 배송비는 할인되지 않습니다. (할인예시 : {상품 판매가 x 수량}+{좌동}+{좌동}…만 적용)<br>
		* 주문을 취소하시거나 반품하실 경우에는 쿠폰은 자동소멸 됩니다.
	</p>
</div>

<div class="tbl_head02 tbl_wrap">
	<table>
	<colgroup>
		<col class="w70">
		<col>
		<col class="w90">
		<col class="w80">
		<col class="w90">
	</colgroup>
	<thead>
	<tr>
		<th scope="col">이미지</th>
		<th scope="col">상품명</th>
		<th scope="col">판매가</th>
		<th scope="col">쿠폰선택</th>
		<th scope="col">할인금액</th>
	</tr>
	</thead>
	<tbody>
	<%
		for(ProdVO pv : prodList){
	%>
		<tr class="list0">
		<td class="tac">
			<img src="<%=pv.getProdImg()%>" width="60" height="60">		</td>
		<td class="td_name"><%=pv.getProdName() %></td>
		<td class="tac">
			<div><span class="spr" id="price_<%=pv.getProdNo()%>"><%=pv.getProdPrice()%><span>원</span></span></div>
			<div class="padt5 fc_197" id="qty_<%=pv.getProdNo()%>">(수량:<%=pv.getCartQty()%>)</div>
		</td>
		<td class="tac">
			<span id="cp_avail_button_<%=pv.getProdNo()%>">
			<a href="#" onclick="show_coupon('<%=pv.getProdNo()%>');return false;" class="btn_small">쿠폰선택</a>
			</span>
		</td>
		<td class="tar">
			<span id="dc_amt_<%=pv.getProdNo()%>">0</span>원
			<span id="dc_cancel_bt_<%=pv.getProdNo()%>" style="display:none"><a href="javascript:coupon_cancel('12','458','0');">X</a></span>
		</td>
	</tr>
	<%
		}	
	%>
		</tbody>
	<tfoot>
	<tr>
		<td class="tar" colspan="5">
			<strong>쿠폰 할인 적용 금액 : <span id="to_dc_amt" class="fc_red">0</span>원</strong>
		</td>
	</tr>
	</tfoot>
	</table>
</div>

<div class="btn_confirm marb30">
	<a href="#" id="couponSubmit" class="btn_medium red">쿠폰 적용하기</a>
</div>

<div class="win_desc">
	<p class="pg_cnt">
		<em>총 <%=couponList.size()%>개</em> 조회
		(<b><%=accVO.getName()%></b>님께서 사용가능한 쿠폰상세내역입니다)
	</p>
</div>

<div class="tbl_head02 tbl_wrap">
	<table>
	<colgroup>
		<col class="w60">
		<col>
	</colgroup>
	<thead>
	<tr>
		<th scope="col">쿠폰번호</th>
		<th scope="col">할인쿠폰명</th>
	</tr>
	<%for(CouponVO cv : couponList) { %>
	<tr>
		<td><%=cv.getCpNo()%></td>
		<td><%=cv.getCpName()%></td>
	</tr>
	<%} %>
	
	</thead>
		<%
			if(couponList.size() == 0){
		%>
	<tbody>
	<tr><td colspan="2" class="empty_list">자료가 없습니다.</td></tr>	</tbody>
		<%
				}
		%>
	</table>
</div>


<% for(ProdVO prodVO : prodList) { %>
	<div id="cp_list<%=prodVO.getProdNo()%>" class="apply_cmd" style="top: 118px; left: 158.5px; display: none;">
	<table width="306">
	<tbody><tr>
		<td>
			<img src="http://demofran.com/img/coupon_apply_title.gif" usemap="#coupon_apply0">
			<map name="coupon_apply0">
			<area shape="rect" coords="286,0,304,14" href="#" onclick="hide_cp_list('<%=prodVO.getProdNo()%>'); return false;">
			</map>
		</td>
	</tr>
	</tbody></table>

	<div class="tbl_head02">
		<table width="306">
		<thead>
		<tr>
			<th scope="col">선택</th>
			<th scope="col">쿠폰이름</th>
			<th scope="col">할인금액(율)</th>
			<th scope="col">할인적용가</th>
		</tr>
	
	<% 
		double discPrice = 0;
		for(CouponVO cv : couponList){ %>
		<tr>
			<td><input type="hidden" name="couponNo" value="<%=cv.getCpNo()%>"></td>
			<td><input type="radio" name="coupon" value="<%=cv.getCpDiscount()%>"></td>
			<td><%=cv.getCpName() %></td>
			<td><%=cv.getCpDiscount() %>%</td>
			<td style="font-weight:bold;color:#ec0e03;">
			<%
					for(ProdVO pv : prodList) {
						double price = pv.getProdPrice();
						double discount = cv.getCpDiscount();
						discPrice = price - (price * (discount/100.0));
					}
			%>
			<%=(int)discPrice%>
			</td>
		</tr>
	<%
	}
	%>
		</thead>
		<%
			if(couponList.size() == 0){
		%>
		<tbody>
		<tr><td colspan="3" class="empty_table">사용할 수 있는 쿠폰이 없습니다.</td></tr>		
		</tbody>
		<%
			}
		%>
		</table>
	</div>

	<div class="btn_confirm mart10">
		<button type="button" id="couponSelect" class="btn_small">쿠폰적용하기</button>
	</div>
</div>
<% } %>
<div class="win_btn">
	<a href="javascript:window.close();" class="btn_lsmall bx-white">창닫기</a>
</div>
</form>

<script src="js/opener.js"></script>
<script>

$(function() {
		
	let total_disc;
	let total_price;
	let cpNo;
	
	$('#couponSelect').on('click', function(){
		let coupon = $('input[name="coupon"]:checked');
		cpNo = coupon.closest('tr').find('input[name="couponNo"]').val();
		
		if(!coupon.is(':checked')){
			alert('쿠폰체크해줭');
		}else{
			let idx = $(this).data('idx');
			
			
			let price = parseFloat($('#price_' + idx).text().replace('원', '').replace(/,/g, ''));
			let qty = $('#qty_' + idx).val() || 1;
			
			let discount = parseFloat(coupon.val());
			
			total_disc = (price*qty) * (discount/100);
			total_price = (price*qty) - total_disc;
			
			$('#dc_amt_'+idx).text(total_disc);
			$('#to_dc_amt').text(total_price);
			
			$('#cp_list'+idx).hide();
		}
	})
	
	$('#couponSubmit').on('click', function() {
		
		window.opener.updateValues(cpNo, total_disc, total_price);
		window.close();
		
	});
})

function show_coupon(idx)
{
	var cp_list = $("#cp_list"+idx);
	var wt = Math.max(0, (($(window).height() - $(cp_list).outerHeight()) / 2) + $(window).scrollTop()) + "px";
	var wl = Math.max(0, (($(window).width() - $(cp_list).outerWidth()) / 2) + $(window).scrollLeft()) + "px";
	$(cp_list).css("top", wt);
	$(cp_list).css("left", wl);
	$(cp_list).show();
	
	$('#couponSelect').data('idx', idx);
}

function hide_cp_list(idx) {
	var coupon_layer = document.getElementById("cp_list"+idx);
	coupon_layer.style.display = 'none';
}

function cp_submit() {
	var f = document.flist;
	var tot_price = opener.document.buyform.tot_price.value;

	if(f.sum_dc_amt.value == 0 || !f.sum_dc_amt.value) {
		alert("상품에 쿠폰을 선택해주세요.");
		return false;
	}

	if(parseInt(stripComma(tot_price)) < f.sum_dc_amt.value) {
		alert("쿠폰 할인 금액이 결제금액을 초과하였습니다.");
		return false;
	}

	if(!confirm("쿠폰적용을 하시겠습니까?"))
		return false;

	var tmp_dc_amt	= '';
	var tmp_lo_id	= '';
	var tmp_cp_id	= '';
	var chk_dc_amt	= '';
	var chk_lo_id	= '';
	var chk_cp_id	= '';
	var comma		= '';
	for(i = 0; i < max_layer; i++) {
		chk_dc_amt	= eval("f.gd_dc_amt_"+i).value ? eval("f.gd_dc_amt_"+i).value : 0;
		chk_lo_id   = eval("f.gd_cp_idx_"+i).value ? eval("f.gd_cp_idx_"+i).value : 0;
		chk_cp_id	= eval("f.gd_cp_no_"+i).value ? eval("f.gd_cp_no_"+i).value : 0;

		tmp_dc_amt += comma + chk_dc_amt;
		tmp_lo_id  += comma + chk_lo_id;
		tmp_cp_id  += comma + chk_cp_id;
		comma = '|';
	}

	// 로그
	opener.document.buyform.coupon_price.value = tmp_dc_amt;
	opener.document.buyform.coupon_lo_id.value = tmp_lo_id;
	opener.document.buyform.coupon_cp_id.value = tmp_cp_id;

	// 총 할인액
	opener.document.buyform.coupon_total.value = f.sum_dc_amt.value;
	opener.document.getElementById("dc_amt").innerText = formatComma(f.sum_dc_amt.value);
	opener.document.getElementById("dc_cancel").style.display = "";
	opener.document.getElementById("dc_coupon").style.display = "none";

	// 최종 결제금액
	opener.document.buyform.tot_price.value = formatComma(parseInt(stripComma(tot_price)) - f.sum_dc_amt.value);

	self.close();
}
</script>

<script src="assets/js/wrest.js"></script>
</body>

</html>