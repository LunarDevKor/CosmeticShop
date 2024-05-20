<%@page import="com.cosmetic.admin.vo.OutProductVO"%>
<%@page import="com.cosmetic.admin.vo.OrderVO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<% 

List<Map<String ,Object>> list = (List<Map<String ,Object>>) request.getAttribute("list");
	int totalCount = (Integer) request.getAttribute("totalCount");

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
		<dd class="o10"><a href="<%=request.getContextPath() %>/admin/orderlist.do">주문리스트(전체)</a></dd>			
		<dd class="o10"><a href="<%=request.getContextPath() %>/admin/shipdetail.do">배송관리</a></dd>
		<dd class="o30 active"><a href="<%=request.getContextPath() %>/admin/releaseList.do">출고 관리</a></dd>
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
<form name="fsearch" id="fsearch" method="get" action="<%=request.getContextPath()%>/admin/releaseSerch.do">
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
				<option value="prodNo">상품 번호</option>
			
			</select>
			<input type="text" name="search" value="" class="frm_input" size="30">
		</td>
	</tr>

	</tbody>
	</table>
</div>
<div class="btn_confirm">
	<input type="submit" value="검색" class="btn_medium">
</div>
</form>

<div class="local_ov mart30">
	전체 : <b class="fc_red"><%=totalCount %></b> 건 조회
	<strong class="ov_a">총주문액 : 1,733,8510원</strong>
</div>

<!-- <form name="forderlist" id="forderlist" method="post"> -->
<input type="hidden" name="q1" value="code=list">
<input type="hidden" name="page" value="1">

<!-- <div class="local_frm01">
	<a href="#" id="frmOrderPrint" class="btn_lsmall white"><i class="fa fa-print"></i> 주문서출력</a>
<a href="#" id="frmOrderExcel" class="btn_lsmall white"><i class="fa fa-file-excel-o"></i> 선택 엑셀저장</a>
<a href="./order/order_excel.php?code=list" class="btn_lsmall white"><i class="fa fa-file-excel-o"></i> 검색결과 엑셀저장</a></div> -->


<form action="<%=request.getContextPath() %>/admin/updatelist.do" method="post" id="orderListForm">
<div class="tbl_head01">
	<table id="sodr_list">
	<colgroup>
		<col class="w50">
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
		<th scope="col" colspan="2">출고번호</th>
		<th scope="col" colspan="3">상품번호</th>
		<th scope="col" colspan="1">출고량</th>
		<th scope="col" colspan="5">출고일</th>
		<th scope="col" colspan="3">출고가격</th>
		<th scope="col" colspan="3">비고</th>

	
		
	</tr>
	</thead>
	<tbody>
	
<% 
	if(list.size() == 0) {
%>		
		<tr>
			<td colspan="5"> 주문내역이 없습니다.</td>
		</tr>

<% 
	}else{	
		
		for(Map<String,Object> map : list) {
%>
	<tr class="list0">
		<td colspan="2"><%=map.get("OP_NO") %></td>
		<td colspan="3"><%=map.get("PROD_NO") %></td>
		<td colspan="1"><%=map.get("OP_QTY")%></td>
		<td colspan="5"><%=map.get("OP_DATE") %></td>
		<td colspan="3"><%=map.get("OP_PRICE")%></td>
		<td colspan="3">비고</td>
		
		
	</tr>

<%
		}
	}
%>
	</tbody>
	</table>
</div>



<!-- <div class="local_frm02">
	<a href="#" id="frmOrderPrint" class="btn_lsmall white"><i class="fa fa-print"></i> 주문서출력</a>
	<a href="#" id="frmOrderExcel" class="btn_lsmall white"><i class="fa fa-file-excel-o"></i> 선택 엑셀저장</a>
	<a href="./order/order_excel.php?code=list" class="btn_lsmall white"><i class="fa fa-file-excel-o"></i> 검색결과 엑셀저장</a>
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
		location.href="admin/releaseList.do?page=" + $(this).text();
	});
	
	$('.next').on('click',function(){
		currentPage = parseInt($('.pagination').children().last().text()) +1;
		
		//현재 페이지가 totalPage보다 클때 페이지정보를 넘기지 않음
		if(<%=request.getAttribute("ttPage")%> < currentPage) return;
		location.href="admin/releaseList.do?page=" + currentPage;
	});
	
	$('.prev').on('click',function(){
		
		currentPage = parseInt($('.pagination').children().first().text()) -1;
		//현재페이지가 0보다 작거나 같을 때
		if(currentPage <= 0) return;
		location.href="admin/releaseList.do?page=" + currentPage;
	});



</script>



<!-- 배송관리로 이동 -->
<%-- <h2>주문 처리</h2>
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
</div> --%>
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