<%@page import="com.cosmetic.admin.vo.ShipDetailVo"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	List<Map<String, Object>> shipList = (List<Map<String, Object>>)request.getAttribute("shipList");

	String msg = session.getAttribute("msg") == null ? ""
			: (String)session.getAttribute("msg");
	session.removeAttribute("msg");
	
	int totalCount = (Integer)request.getAttribute("totalCount");

%>    
    
 
<jsp:include page="./layout/header.jsp"></jsp:include>

<div id="wrapper">
	
<div id="snb">

	<div class="snb_header ico_config snb_header_1">
		<h2><i class="ionicons ion-clipboard"></i>주문 및 <br>상품관리</h2>
	</div>
	
		<dl>
		<dt class="o10 menu_toggle">주문관리</dt>		
		<dd class="o10"><a href="<%=request.getContextPath() %>/admin/orderlist.do">주문리스트(전체)</a></dd>		
		<dd class="o10 active"><a href="<%=request.getContextPath() %>/admin/shipdetail.do">배송관리</a></dd>
		<dd class="o30"><a href="<%=request.getContextPath() %>/admin/releaseList.do">출고 관리</a></dd>
		<dt class="o20 menu_toggle">상품 관리</dt>				
		<dd class="o20"><a href="<%=request.getContextPath() %>/prodWrite.do">상품 등록</a></dd>		
		<dd class="o20"><a href="<%=request.getContextPath() %>/prodList.do">상품 리스트(전체)</a></dd>				
		</dl>
	</div>
	<div id="content">
		<div class="breadcrumb">
			<span>HOME</span> <i class="ionicons ion-ios-arrow-right"></i> 주문관리 <i class="ionicons ion-ios-arrow-right"></i> 배송준비		</div>
	
<div class="s_wrap">
	<h1>배송관리</h1>
	
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/jquery-ui.min.js"></script>
<script>
jQuery(function($){
    $.datepicker.regional["ko"] = {
        closeText: "닫기",
        prevText: "이전달",
        nextText: "다음달",
        currentText: "오늘",
        monthNames: ["1월(JAN)","2월(FEB)","3월(MAR)","4월(APR)","5월(MAY)","6월(JUN)", "7월(JUL)","8월(AUG)","9월(SEP)","10월(OCT)","11월(NOV)","12월(DEC)"],
        monthNamesShort: ["1월","2월","3월","4월","5월","6월", "7월","8월","9월","10월","11월","12월"],
        dayNames: ["일","월","화","수","목","금","토"],
        dayNamesShort: ["일","월","화","수","목","금","토"],
        dayNamesMin: ["일","월","화","수","목","금","토"],
        weekHeader: "Wk",
        dateFormat: "yymmdd",
        firstDay: 0,
        isRTL: false,
        showMonthAfterYear: true,
        yearSuffix: ""
    };
	$.datepicker.setDefaults($.datepicker.regional["ko"]);
});
</script>
<h2>기본검색</h2>
<form name="fsearch" id="fsearch" method="get" action="<%=request.getContextPath()%>/shipSearch.do">
<input type="hidden" name="code" value="list">
<div class="tbl_frm01">
	<table>
	<colgroup>
		<col class="w100">
		<col>
	</colgroup>
	<tbody>
	<tr>
		<th scope="row">검색어</th>
		<td>
			<select name="cate">
				<option value="od_id">주문번호</option>
				<option value="b_name">수취인</option>
				<option value="phone">수령자핸드폰</option>
				<option value="delivery">운송장번호</option>
			</select>
			<input type="text" name="search" value="" class="frm_input" size="30">
		</td>
	</tr>
	<tr>
		
	</tr>
	<!-- <tr>
		<th scope="row">결제방법</th>
		<td>
			<label><input type="radio" name="od_settle_case" value="" checked="checked"> 전체</label>
			<label><input type="radio" name="od_settle_case" value="무통장"> 무통장</label>
			<label><input type="radio" name="od_settle_case" value="가상계좌"> 가상계좌</label>
			<label><input type="radio" name="od_settle_case" value="계좌이체"> 계좌이체</label>
			<label><input type="radio" name="od_settle_case" value="휴대폰"> 휴대폰</label>
			<label><input type="radio" name="od_settle_case" value="신용카드"> 신용카드</label>
			<label><input type="radio" name="od_settle_case" value="간편결제"> PG간편결제</label>
			<label><input type="radio" name="od_settle_case" value="KAKAOPAY"> KAKAOPAY</label>
		</td>
	</tr>
	<tr>
		<th scope="row">기타선택</th>
		<td>
			<label><input type="checkbox" name="od_taxbill" value="Y"> 세금계산서</label>
			<label><input type="checkbox" name="od_taxsave" value="Y"> 현금영수증</label>
			<label><input type="checkbox" name="od_memo" value="Y"> 배송메세지</label>
			<label><input type="checkbox" name="od_shop_memo" value="Y"> 관리자메모</label>
			<label><input type="checkbox" name="od_receipt_point" value="Y"> 포인트주문</label>
			<label><input type="checkbox" name="od_coupon" value="Y"> 쿠폰할인</label>
			<label><input type="checkbox" name="od_escrow" value="Y"> 에스크로</label>
		</td>
	</tr> -->
	</tbody>
	</table>
</div>
<div class="btn_confirm">
	<input type="submit" value="검색" class="btn_medium">
	<input type="button" value="초기화" id="frmRest" class="btn_medium grey">
</div>
</form>

<div class="local_ov mart30">
	전체 : <b class="fc_red"><%=totalCount %></b> 건 조회
	<!-- <select id="page_rows" onchange="location='/admin/order.php?code=3&page=1&page_rows='+this.value;" class="marl5">
		<option value="30" selected="selected">30줄 정렬</option>
		<option value="50">50줄 정렬</option>
		<option value="100">100줄 정렬</option>
		<option value="150">150줄 정렬</option>
	</select> -->
	
</div>

<form name="forderlist" id="forderlist" action="./order/order_update.php" onsubmit="return forderlist_submit(this);" method="post">
<input type="hidden" name="q1" value="code=3">
<input type="hidden" name="page" value="1">

<!-- <div class="local_frm01">
	<input type="submit" name="act_button" value="운송장번호수정" class="btn_lsmall white" onclick="document.pressed=this.value">
<a href="#" id="frmOrderPrint" class="btn_lsmall white"><i class="fa fa-print"></i> 주문서출력</a>
<a href="#" id="frmOrderExcel" class="btn_lsmall white"><i class="fa fa-file-excel-o"></i> 선택 엑셀저장</a>
<a href="./order/order_excel.php?code=3" class="btn_lsmall white"><i class="fa fa-file-excel-o"></i> 검색결과 엑셀저장</a>
<a href="./order.php?code=delivery" class="btn_lsmall"><i class="fa fa-upload"></i> 엑셀배송처리</a></div> -->
<div class="tbl_head01">
	<table id="sodr_list">
	<colgroup>
		<col class="w50">
		<col class="w100">
		<col class="w40">
		<col class="w80">
		<col class="w40">
		<col class="w30">
		<col class="w400">
		<col class="w120">
		<col>
		<col>
		<col class="w90">
		<col class="w90">
		<col class="w90">
		<col class="w90">
		<col class="w90">
	</colgroup>
	<thead>
	<tr>
		<th scope="col">번호</th>
		<th scope="col">주문번호</th>
		<th scope="col"><input type="checkbox" id="sit_select_all"></th>
		<th scope="col">수취인</th>
		<th scope="col" colspan="3">수취인주소</th>
		<th scope="col">수취인연락처</th>
		<th scope="col">배송시작일</th>
		<th scope="col">배송완료일</th>
		<th scope="col">송장번호</th>
		<th scope="col">배송상태</th>
		<th scope="col" colspan="3">배송메모</th>
		<!-- <th scope="col">총주문액</th>
		<th scope="col" colspan="2">결제방법</th> -->
	</tr>
	</thead>
	<tbody>
	<!-- <tr><td colspan="14" class="empty_table">자료가 없습니다.</td></tr>	 -->
	
<% 
	if(shipList.size() == 0) {
%>		
		<tr>
			<td colspan="5"> 주문내역이 없습니다.</td>
		</tr>

<% 
	}else{	
		
		for(Map<String, Object> sv : shipList) {
%>
	<tr class="list0">
		<td rowspan="1"><%=sv.get("SHIP_NO") %></td>
		<td rowspan="1"><%=sv.get("ORD_NO") %></td>
		<td rowspan="1">
			<input type="hidden" name="od_id[10]" value="22012617052419">
			<input type="checkbox" name="chk[]" value="10" id="chk_10">
		</td>
		<td rowspan="1">
			<a href="http://demofran.com/admin/pop_orderform.php?od_id=22012617052419" onclick="win_open(this,'pop_orderform','1200','800','yes');return false;" class="fc_197"><%=sv.get("RECP_NAME") %></a>
		</td>
		<td colspan="3"><%=sv.get("RECP_ADDR") %></td>
		<td class="tar"><%=sv.get("RECP_TEL") %></td>
		<td><%=sv.get("SHIP_STDATE") %></td>
		<td><%=sv.get("SHIP_CPDATE") %></td>

		<td><%=sv.get("SHIP_INVOICENO") %></td>
		
<%
		if(sv.get("SHIP_STATUS").equals("0")) {
%>
		<td rowspan="1">배송대기중</td>
<%
		}else if(sv.get("SHIP_STATUS").equals("1")){
%>
		<td rowspan="1">배송중</td>
<%
		}else {
%>
		<td rowspan="1">배송완료</td>
<%
		}

		if(sv.get("SHIP_NOTICE") ==null){
%>
		<td colspan="3">배송메모 없음</td>
<%
		}else{
%>
		<td colspan="3"><%=sv.get("SHIP_NOTICE") %></td>

<%
		}
%>
	</tr>

<%
		}
	}
%>	
	
	</tbody>
	</table>
</div>
 <!-- <div class="local_frm02">
	<input type="submit" name="act_button" value="운송장번호수정" class="btn_lsmall white" onclick="document.pressed=this.value">
<a href="#" id="frmOrderPrint" class="btn_lsmall white"><i class="fa fa-print"></i> 주문서출력</a>
<a href="#" id="frmOrderExcel" class="btn_lsmall white"><i class="fa fa-file-excel-o"></i> 선택 엑셀저장</a>
<a href="./order/order_excel.php?code=3" class="btn_lsmall white"><i class="fa fa-file-excel-o"></i> 검색결과 엑셀저장</a>
<a href="./order.php?code=delivery" class="btn_lsmall"><i class="fa fa-upload"></i> 엑셀배송처리</a>
</div> -->

	<%
		if(request.getAttribute("sPage") != null){
	%>
	<!-- 페이징 영역 start -->		
	<div id="pageArea">
		
		<ul class="pager">
		  <li class="prev"><a href="#"><i class="fa-regular fa-angles-left"></i></a></li>
		</ul>
		
		<ul class="pagination pager">
		<%
			int sPage = (int)request.getAttribute("sPage");
			int ePage = (int)request.getAttribute("ePage");
			int cPage = (int)request.getAttribute("cPage");
	
			for(int i=sPage; i<=ePage; i++){
				//페이지번호 활성화 처리
				if(cPage == i){
		%>
		  <li class="active"><a href="#"><%=i %></a></li>
		<%			
				}else{
		%>
		  <li><a href="#"><%=i %></a></li>
		<%
				}
			}//for end 
		%>
		</ul>
		
		<ul class="pager">
		  <li class="next"><a href="#"><i class="fa-regular fa-angles-right"></i></a></li>
		</ul>
	</div>
	<!-- 페이징 영역 end -->	
	<%
		}
	%>
	<script>
	$('.pagination li').on('click',function(){
// 		alert( $(this).text() );
		location.href="admin/shipdetail.do?page=" + $(this).text();
	});
	
	$('.next').on('click',function(){
		currentPage = parseInt($('.pagination').children().last().text()) +1;
		
		//현재 페이지가 totalPage보다 클때 페이지정보를 넘기지 않음
		if(<%=request.getAttribute("ttPage")%> < currentPage) return;
		location.href="admin/shipdetail.do?page=" + currentPage;
	});
	
	$('.prev').on('click',function(){
		
		currentPage = parseInt($('.pagination').children().first().text()) -1;
		//현재페이지가 0보다 작거나 같을 때
		if(currentPage <= 0) return;
		location.href="admin/shipdetail.do?page=" + currentPage;
	});



</script>


<!-- <h2>주문 일괄처리</h2>
<div class="tbl_frm01">
	<table>
	<colgroup>
		<col class="w100">
		<col>
	</colgroup>
	<tbody>
	<tr>
		<th scope="row" rowspan="2">선택한 주문을</th>
		<td>
			<select name="delivery2">
<option value="">배송사선택</option>
<option value="KG로지스|http://www.kglogis.co.kr/contents/waybill.jsp?item_no=">KG로지스</option>
<option value="KGB택배|http://www.kgbls.co.kr/sub5/trace.asp?f_slipno=">KGB택배</option>
<option value="KG옐로우캡택배|http://www.yellowcap.co.kr/custom/inquiry_result.asp?invoice_no=">KG옐로우캡택배</option>
<option value="CVSnet편의점택배|http://was.cvsnet.co.kr/_ver2/board/ctod_status.jsp?invoice_no=">CVSnet편의점택배</option>
<option value="CJ대한통운|https://www.doortodoor.co.kr/parcel/doortodoor.do?fsp_action=PARC_ACT_002&fsp_cmd=retrieveInvNoACT&invc_no=">CJ대한통운</option>
<option value="롯데택배(구현대택배)|https://www.lotteglogis.com/open/tracking?InvNo=">롯데택배(구현대택배)</option>
<option value="한진택배|http://www.hanjin.co.kr/Delivery_html/inquiry/result_waybill.jsp?wbl_num=">한진택배</option>
<option value="이노지스택배|http://www.innogis.co.kr/tracking_view.asp?invoice=">이노지스택배</option>
<option value="우체국|http://service.epost.go.kr/trace.RetrieveRegiPrclDeliv.postal?sid1=">우체국</option>
<option value="로젠택배|https://www.ilogen.com/web/personal/trace/">로젠택배</option>
<option value="동부택배|http://www.dongbups.com/delivery/delivery_search_view.jsp?item_no=">동부택배</option>
<option value="대신택배|http://home.daesinlogistics.co.kr/daesin/jsp/d_freight_chase/d_general_process2.jsp?billno1=">대신택배</option>
<option value="경동택배|http://www.kdexp.com/sub3_shipping.asp?stype=1&p_item=">경동택배</option>
</select>			<input type="text" name="delivery_no2" class="frm_input" placeholder="일괄 운송장번호">
			<span class="frm_info fc_125">선택한 주문을 일괄처리시에 입력하세요. 주문목록에서 개별 입력도 가능합니다.</span>		</td>
	</tr>
	<tr>
		<td>
			<input type="submit" name="act_button" value="배송중" class="btn_medium red" onclick="document.pressed=this.value">
		</td>
	</tr>
	</tbody>
	</table>
</div> -->
</form>


<!-- <div class="information">
	<h4>도움말</h4>
	<div class="content">
		<div class="hd">ㆍ주문상태 변경에 제한이 있나요?</div>
		<div class="desc01 accent">
			<p>ㆍ주문리스트 내 선택된 주문의 상태를 <em>"입금완료 &gt; 배송관리 &gt; 구매확정"</em> 순으로 변경됩니다.</p>
			<p>ㆍ배송준비 상태의 주문은 "배송중" 상태로만 변경할 수 있으며, 주문의 일부 상품만 부분적으로 "배송중" 상태로 변경 가능합니다.</p>
		</div>
		<div class="hd">ㆍ출고전 취소할 수 있나요?</div>
		<div class="desc01 accent">
			<p>ㆍ주문리스트에서 배송준비 상태의 주문을 취소/환불 처리가 불가능합니다.</p>
			<p>ㆍ<em>취소/환불/반품/교환</em> 등의 주문상태로 변경은 해당 주문의 <strong>"주문상세정보"</strong> 페이지에서 처리 가능합니다.</p>
		</div>
	 </div>
</div> -->

<script>
$(function(){
    $("#fr_date, #to_date").datepicker({ changeMonth: true, changeYear: true, dateFormat: "yy-mm-dd", showButtonPanel: true, yearRange: "c-99:c+99", maxDate: "+0d" });

	// 전체 상품선택
    $("#sit_select_all").click(function() {
        if($(this).is(":checked")) {
            $("input[name='it_sel[]']").attr("checked", true);
            $("input[name^=chk]").attr("checked", true);
        } else {
            $("input[name='it_sel[]']").attr("checked", false);
            $("input[name^=chk]").attr("checked", false);
        }
    });

    // 주문의 상품선택
    $("input[name='it_sel[]']").click(function() {
        var cls = $(this).attr("id").replace("sit_", "sct_");
        var $chk = $("input[name^=chk]."+cls);
        if($(this).is(":checked"))
            $chk.attr("checked", true);
        else
            $chk.attr("checked", false);
    });

	// 주문서출력
	$("#frmOrderPrint, #frmOrderExcel").on("click", function() {
		var type = $(this).attr("id");
		var od_chk = new Array();
		var od_id = "";
		var $el_chk = $("input[name='it_sel[]']");

		$el_chk.each(function(index) {
			if($(this).is(":checked")) {
				od_chk.push($("input[name='od_id["+index+"]']").val());
			}
		});

		if(od_chk.length > 0) {
			od_id = od_chk.join();
		}

		if(od_id == "") {
			alert("처리할 자료를 하나 이상 선택해 주십시오.");
			return false;
		} else {
			if(type == 'frmOrderPrint') {
				var url = "./order/order_print.php?od_id="+od_id;
				window.open(url, "frmOrderPrint", "left=100, top=100, width=670, height=600, scrollbars=yes");
				return false;
			} else {
				this.href = "./order/order_excel2.php?od_id="+od_id;
				return true;
			}
		}
	});
});
</script>

<script>
function forderlist_submit(f)
{
    if(!is_checked("chk[]")) {
        alert(document.pressed+" 하실 항목을 하나 이상 선택하세요.");
        return false;
    }

	if(document.pressed == "배송중") {
		if(f.delivery2.value && f.delivery_no2.value) {
			var $el_chk = $("input[name='chk[]']");
			$el_chk.each(function(index) {
				if($(this).is(":checked")) {
					$("select[name='delivery["+index+"]']").val(f.delivery2.value);
					$("input[name='delivery_no["+index+"]']").val(f.delivery_no2.value);
				}
			});
		}

		if(!confirm("선택하신 주문서의 주문상태를 '"+document.pressed+"'상태로 변경하시겠습니까?"))
			return false;
	}

	return true;
}
</script>
</div>
<jsp:include page="./layout/footer.jsp"></jsp:include>