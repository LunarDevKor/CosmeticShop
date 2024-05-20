<%@page import="com.cosmetic.admin.vo.OrderVO"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Clob"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.Reader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<% 

	List<Map<String, Object>> orderList = (List<Map<String, Object>>)request.getAttribute("orderList");
	
	String msg = session.getAttribute("msg") == null ? ""
			: (String)session.getAttribute("msg");
	session.removeAttribute("msg");
	
	int totalCount = (Integer)request.getAttribute("totalCount");

%>    
    
<jsp:include page="./layout/header.jsp"></jsp:include>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<div id="wrapper">
	
<div id="snb">
	<div class="snb_header ico_config snb_header_1">
		<h2><i class="ionicons ion-clipboard"></i>주문 및 <br>상품관리</h2>
	</div>
		<dl>
		<dt class="o10 menu_toggle">주문관리</dt>		
		<dd class="o10 active"><a href="<%=request.getContextPath() %>/admin/orderlist.do">주문리스트(전체)</a></dd>				
		<dd class="o10"><a href="<%=request.getContextPath() %>/admin/shipdetail.do">배송 관리</a></dd>	
		<dd class="o30"><a href="<%=request.getContextPath() %>/admin/releaseList.do">출고 관리</a></dd>	
		<dt class="o20 menu_toggle">상품 관리</dt>			
		<dd class="o20"><a href="<%=request.getContextPath() %>/prodWrite.do">상품 등록</a></dd>		
		<dd class="o20"><a href="<%=request.getContextPath() %>/prodList.do">상품 리스트(전체)</a></dd>					
		</dl>
	</div>
	<div id="content">
		<div class="breadcrumb">
			<span>HOME</span> <i class="ionicons ion-ios-arrow-right"></i> 주문관리 <i class="ionicons ion-ios-arrow-right"></i> 주문리스트(전체)		</div>
	
<div class="s_wrap">
	<h1>주문리스트(전체)</h1>
	
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
<form name="fsearch" id="fsearch" method="get" action="<%=request.getContextPath()%>/orderSerch.do">
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
				<option value="mb_id">회원아이디</option>
				<option value="name">수령자명</option>
			</select>
			<input type="text" name="search" value="" class="frm_input" size="30">
		</td>
	</tr>
	<tr>
		
	</tr>

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
	<strong class="ov_a">총주문액 : 1,733,850원</strong>
</div>

<!-- <form name="forderlist" id="forderlist" method="post"> -->
<input type="hidden" name="q1" value="code=list">
<input type="hidden" name="page" value="1">



<form action="<%=request.getContextPath() %>/admin/updatelist.do" method="post" id="orderListForm">
<div class="tbl_head01">
	<table id="sodr_list">
	<colgroup>
		<%-- <col class="w50"> --%>
		<col class="w100">
		<col class="w150">
		<col class="w40">
		<col class="w40">
		<col>
		<col class="w60">
		<col class="w80">
		<col class="w80">
		<col class="w90">
		<col class="w90">
		<col class="w90">
		<col class="w90">
		<col class="w90">
		<col class="w90">
		<col class="w90">
	</colgroup>
	<thead>
	<tr>
		<!-- <th scope="col">번호</th> -->
		<th scope="col">주문번호</th>
		<th scope="col">주문일시</th>
		<th scope="col"><input type="checkbox" name="chkall" value="1" onclick="check_all(this.form);"></th>
		<th scope="col" colspan="2">주문상품</th>
		<th scope="col">수량</th>
		<th scope="col">상품금액</th>
		<th scope="col">배송비</th>
		<th scope="col">주문상태</th>
		<th scope="col">판매자</th>
		<th scope="col">주문자ID</th>
		<th scope="col">수령자</th>
		<th scope="col">총주문액</th>
		<th scope="col" colspan="2">결제방법</th>
	</tr>
	</thead>
	<tbody>
	
<% 
	if(orderList.size() == 0) {
%>		
		<tr>
			<td colspan="5"> 주문내역이 없습니다.</td>
		</tr>

<% 
	}else{	
		
		for(Map<String, Object> ov : orderList) {
			if(ov != null){
	            Reader reader;
	            BufferedReader br;
	            String result = "";
	            if(ov.get("PROD_IMG") != null){
	                Clob clob = (Clob) ov.get("PROD_IMG");
	                reader = clob.getCharacterStream();
	                br = new BufferedReader(reader);
	                result = br.lines().collect(Collectors.joining());
	            }	
			
			
%>
	<tr class="list0">
		<%-- <td rowspan="1"><%=ov.get("ORD_NO") %></td> --%>
		<td rowspan="1">
			<a href="#" onclick="win_open(this,'pop_orderform','1200','800','yes');return false;" class="fc_197"><%=ov.get("OD_ORD_NO") %></a>
		</td>
		<td rowspan="1"> <%=ov.get("ORD_DATE") %></td>
		<td rowspan="1">
			<input type="hidden" name="od_id[10]" value="22012617052419">
			<input type="checkbox" name="ordercheckbox" value="<%=ov.get("ORD_NO") %>" id="chk_10">
		</td>
		<td class="td_img">
		<!-- <a href="http://demofran.com/shop/view.php?index_no=16" target="_blank"> -->
		<img src="<%=result %>" width="50" height="50">
		<!-- </a> -->
		</td>
		<td class="td_itname"><a href="#" target="_blank"><%=ov.get("PROD_NAME") %></a></td>
		<td><%=ov.get("PR_QTY") %></td>
		<td class="tar"><%=ov.get("PROD_PRICE") %></td>
		<td class="tar"><%=ov.get("ORD_SHIPCOST") %></td>
		
		<%
		 if(ov.get("ORD_STATUS").equals("1")) {
		%>
		<td>주문처리 완료</td>
		<%
		 }else{
		
		%>
		<td>주문처리중</td>
		<%
		 }
		%>
		<td>본사</td>
		<td rowspan="1">
			<span class="sv_wrap">
				<a href="javascript:void(0);" class="sv_member"><%=ov.get("ID") %></a></span>	
		</td>
		<td rowspan="1"><%=ov.get("ORD_RECPNAME") %></td>
		<td rowspan="1" class="td_price"><%=ov.get("ORD_TOTALAMT") %></td>
		<%
		 if(ov.get("ORD_PAYMETHOD").equals("1")) {
		%>
		<td rowspan="1" colspan="2">카카오페이</td>
		<% 
		}else {
		%>
		<td rowspan="1" colspan="2">신용카드</td>
		<%
		}
		%>
	</tr>

<%
			}
		}
	}
%>
	</tbody>
	</table>
</div>



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
		location.href="admin/orderlist.do?page=" + $(this).text();
	});
	
	$('.next').on('click',function(){
		currentPage = parseInt($('.pagination').children().last().text()) +1;
		
		//현재 페이지가 totalPage보다 클때 페이지정보를 넘기지 않음
		if(<%=request.getAttribute("ttPage")%> < currentPage) return;
		location.href="admin/orderlist.do?page=" + currentPage;
	});
	
	$('.prev').on('click',function(){
		
		currentPage = parseInt($('.pagination').children().first().text()) -1;
		//현재페이지가 0보다 작거나 같을 때
		if(currentPage <= 0) return;
		location.href="admin/orderlist.do?page=" + currentPage;
	});



</script>



<!-- 배송관리로 이동 -->
<h2>주문 처리</h2>
<div class="tbl_frm01">
	<table>
	<colgroup>
		<col class="w100">
		<col>
	</colgroup>
	<tbody>
	<tr>
		<th scope="row" rowspan="2">선택한 목록을</th>
		
	</tr>
	<tr>
		<td>
			<input type="submit" name="act_button" value="'주문처리 완료'로 변경" class="btn_medium green" onclick="document.pressed=this.value">
		</td>
	</tr>

	</tr>
	</tbody>
	</table>
</div>
</form>


<script src="js/toast.js"></script>
<c:choose>
    <c:when test='${shipFail eq "FAILURE"}'>
        <script>
            Toast.fire({
                icon: 'error',
                title: '최소한 1개 체크해주세요'
            });
            <% session.removeAttribute("shipFail"); %>
        </script>
    </c:when>
    <c:when test='${success eq "SUCCESS"}'>
        <script>
            Toast.fire({
                icon: 'success',
                title: '배송관리로 이동 되었습니다.'
            });
            <% session.removeAttribute("success"); %>
        </script>
    </c:when>
</c:choose>
<script>

$(function(){
    $("#fr_date, #to_date").datepicker({ changeMonth: true, changeYear: true, dateFormat: "yy-mm-dd", showButtonPanel: true, yearRange: "c-99:c+99", maxDate: "+0d" });

	// 주문서출력
	$("#frmOrderPrint, #frmOrderExcel").on("click", function() {
		var type = $(this).attr("id");
		var od_chk = new Array();
		var od_id = "";
		var $el_chk = $("input[name='chk[]']");

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
</div>

</div>
</div>

<jsp:include page="./layout/footer.jsp"/>