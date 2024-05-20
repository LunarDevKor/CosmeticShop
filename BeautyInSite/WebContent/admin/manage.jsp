<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="./layout/header.jsp"></jsp:include>
<%
	List<Map<String, Object>> list = (List<Map<String, Object>>) request.getAttribute("list");
	int totalCount = (Integer) request.getAttribute("totalCount");

%>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<div id="wrapper">
	
<div id="snb">
	<div class="snb_header ico_config">
		<h2><i class="ionicons ion-ios-people fs40"></i>회원관리</h2>
	</div>
		<dl>
		<dt class="m10 menu_toggle">회원관리</dt>		<dd class="m10 active"><a href="manageList.do">회원 정보관리</a></dd>		<dd class="m10"><a href="gradeList.do">회원 등급관리</a></dd>		<dd class="m20"><a href="pointManage.do">포인트 관리</a></dd> <dd class="m20"><a href="couponManage.do">쿠폰 관리</a></dd>		</dl>
	</div>
	<div id="content">
		<div class="breadcrumb">
			<span>HOME</span> <i class="ionicons ion-ios-arrow-right"></i> 회원관리 <i class="ionicons ion-ios-arrow-right"></i> 포인트 일괄지급&차감		</div>
	
<div class="s_wrap">
	<h1>회원 정보관리</h1>
	
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
<form name="fsearch" id="fsearch" method="get" action="<%=request.getContextPath()%>/listSearch.do">
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
                <option value="id">아이디</option>
                <option value="name">회원이름</option>
                <option value="tel">전화번호</option>
            </select>
            <input type="text" name="search" value="" class="frm_input" size="30">
            
        </td>
    </tr>
    <tr>
        <th scope="row">레벨검색</th>
        <td>
            <label><input type="radio" name="grdNo" value="0" checked="checked"> 전체</label>
            <label><input type="radio" name="grdNo" value="1"> 땅</label>
            <label><input type="radio" name="grdNo" value="2"> 하늘</label>
            <label><input type="radio" name="grdNo" value="3"> 별빛</label>
            <label><input type="radio" name="grdNo" value="4"> 은하수</label>
            <label><input type="radio" name="grdNo" value="5"> 우주</label>

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
	총 회원수 : <b class="fc_red"><%=totalCount %></b>명
</div>
<!-- <div class="local_frm01">
	<a href="./member.php?code=mail_list" class="btn_lsmall bx-white">전체메일발송</a>
<a href="./sms/sms_member.php" onclick="win_open(this,'pop_sms','245','360','no');return false" class="btn_lsmall bx-white">전체문자발송</a>
<a href="./member/member_list_excel.php?code=list" class="btn_lsmall bx-white"><i class="fa fa-file-excel-o"></i> 엑셀저장</a>
<a href="./member.php?code=register_form" class="fr btn_lsmall red"><i class="ionicons ion-android-add"></i> 회원추가</a></div> -->
<div class="tbl_head01">
	<table>
	<colgroup>
		<col class="w50">
		<col class="w130">
		<col class="w150">
		<col>
		<col class="w130">
		<col class="w100">
		<col class="w130">
		<col class="w60">
		<col class="w60">
<!-- 	<col class="w60">
		<col class="w90"> -->
	</colgroup>
	<thead>
	<tr>
		<th scope="col">번호</th>
		<th scope="col"><a href="/admin/member.php?code=list&page=&filed=name&orderby=asc">회원명</a></th>
		<th scope="col"><a href="/admin/member.php?code=list&page=&filed=id&orderby=asc">아이디</a></th>
		<th scope="col"><a href="/admin/member.php?code=list&page=&filed=grade&orderby=asc">등급</a></th>
	
		<th scope="col">핸드폰</th>
		<th scope="col" colspan="2"><a href="/admin/member.php?code=list&page=&filed=reg_time&orderby=asc">가입일시</a></th>
		
				<th scope="col"  colspan="2"><a href="/admin/member.php?code=list&page=&filed=point&orderby=asc">포인트</a></th>
	</tr>
	</thead>
	<tbody class="list">
	<tr class="list0">
	
	
	
		<%
	if(list.size()==0){
		
%>	
		<tr>
			<td colspan="5">게시판이 존재하지 않습니다.</td>
		
		</tr>
<%
	}else{
		
		for(Map<String, Object> map : list){
		
%>		
	<tr>
    <td><%=map.get("ACC_NO")%></td>
    <td>
        <div class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><%=map.get("NAME")%></a>
            <div class="dropdown-menu">
                <a class="dropdown-item" href="manageUpdate.do?accNo=<%=map.get("ACC_NO")%>" onclick="win_open(this,'win_member','1200','600','yes');return false;">회원정보 수정하기</a>
<%--                 <a class="dropdown-item" href="manageUpdate.do?accNo=<%=map.get("ACC_NO")%>">회원정보 수정하기</a> --%>
                <!-- 추가로 다른 메뉴를 넣고 싶다면 아래와 같이 추가하면 됩니다. -->
<!--                 <a class="dropdown-item" href="#">다른 메뉴</a> -->
            </div>
        </div>
    </td>
    <td><%=map.get("ID")%></td>
    <td><%=map.get("GRD_NAME")%></td>
    <td><%=map.get("TEL")%></td>
    <td colspan="2"><%=map.get("REG_DATE")%></td>
    <td colspan="2"><%=map.get("POINT")%></td>
</tr>
<%
		}
	}
%>
	</tr>
		</tbody>
	</table>
	
	
	
</div>
<!-- <div class="local_frm02">
	<a href="./member.php?code=mail_list" class="btn_lsmall bx-white">전체메일발송</a>
<a href="./sms/sms_member.php" onclick="win_open(this,'pop_sms','245','360','no');return false" class="btn_lsmall bx-white">전체문자발송</a>
<a href="./member/member_list_excel.php?code=list" class="btn_lsmall bx-white"><i class="fa fa-file-excel-o"></i> 엑셀저장</a>
<a href="./member.php?code=register_form" class="fr btn_lsmall red"><i class="ionicons ion-android-add"></i> 회원추가</a></div> -->
	
	
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
		location.href="manageList.do?page=" + $(this).text();
	});
	
	$('.next').on('click',function(){
// 		alert( parseInt($('.pagination').children().last().text()) +1 );
		currentPage = parseInt($('.pagination').children().last().text()) +1;
		
		//현재 페이지가 totalPage보다 클때 페이지정보를 넘기지 않음
		if(<%=request.getAttribute("ttPage")%> < currentPage) return;
		location.href="manageList.do?page=" + currentPage;
	});
	
	$('.prev').on('click',function(){
		
		currentPage = parseInt($('.pagination').children().first().text()) -1;
		//현재페이지가 0보다 작거나 같을 때
		if(currentPage <= 0) return;
		location.href="manageList.do?page=" + currentPage;
	});



</script>



</div>

</div>
</div>
