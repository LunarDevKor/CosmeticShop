<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.time.ZoneId"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="com.cosmetic.member.account.vo.AccountVO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Map"%>
<%@page import="com.cosmetic.admin.vo.QNAVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../../layout/header.jsp" />


<%
	Map<String, Object> detailMap = (Map<String, Object>)request.getAttribute("detailMap");
%>


<head>
<meta charset="UTF-8">
<title>공지사항 내용</title>
</head>
<!-- Summernote CSS -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<!-- 부트스트랩 CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.2/css/bootstrap.min.css" rel="stylesheet">
<!-- 부트스트랩 JS 및 종속 라이브러리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.2/js/bootstrap.bundle.min.js"></script>
<!-- Summernote JS -->
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

<body>
<div id="container">


<!-- 퀵메뉴 우측날개 시작 { -->
<div id="qcr">
	<ul>
		<li class="tit">최근 본 상품</li>
		<li>
						<p class="dn c1">
				<a href="http://demofran.com/shop/view.php?index_no=16"><img src="http://demofran.com/data/goods/1483411597/thumb-l7xUjCx1dy5Tp6GlLAy2zMlRLHhxGx_60x60.jpg" width="60" height="60"></a>
			</p>
						<p class="dn c1">
				<a href="http://demofran.com/shop/view.php?index_no=12"><img src="http://demofran.com/data/goods/1483411284/thumb-NcEq6PgZABZ4yTEDMfbc7CMZjFb4w8_60x60.jpg" width="60" height="60"></a>
			</p>
						<p class="dn c1">
				<a href="http://demofran.com/shop/view.php?index_no=21"><img src="http://demofran.com/data/goods/1516934487/thumb-79666_Dqpxzw59F3Pzg9PrtDe9tSmaUCF7tu_60x60.jpg" width="60" height="60"></a>
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
	var itemQty = 3; // 총 아이템 수량
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
		<p class="eng">CS CENTER</p>
		<p class="kor">고객센터</p>
	</div>
	<dl class="aside_cs">	
		<dt><a href="notice.do">공지사항</a></dt>
		<dt><a href="qnaList.do">1:1 상담문의</a></dt>		
		<dt><a href="faq.do">자주묻는질문</a></dt>		
	</dl>
</aside>
<!-- } 좌측메뉴 끝 -->

<div id="con_lf">
	<h2 class="pg_tit">
		<span>1:1 상담문의</span>
		<p class="pg_nav">HOME<i>&gt;</i>고객센터<i>&gt;</i>1:1 상담문의</p>
	</h2>

	
<form name="fboardform" id="fboardform" method="post" action="qnaAnswer.do" onsubmit="return fboardform_submit(this);" autocomplete="off" enctype="MULTIPART/FORM-DATA">
	
<div class="tbl_head02 tbl_wrap">
	<table>
	<colgroup>
		<col class="w100">
		<col class="w300">
	</colgroup>
	<tbody>
	<%
		AccountVO accVO = (AccountVO) request.getSession().getAttribute("LOGIN_USER");
		Timestamp ts = (Timestamp) detailMap.get("SB_CREATE_DATE");
		LocalDateTime ldt = LocalDateTime.ofInstant(ts.toInstant(), ZoneId.systemDefault());
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
	%>
    <tr>
        <th>이름</th>
        <td><%=detailMap.get("NAME") %></td>
        <th>작성시간</th>
        <td><%=ldt.format(dtf) %></td>
    </tr>
	<tr>
		<th>제목</th>
		<td colspan="3"><input type="text" name="sbTitle" value="<%=detailMap.get("SB_TITLE") %>" class="frm_input wfull" readonly></td>
	</tr>
	<tr>
	<th >내용</th>
	<td colspan="3"><input type="text" name="sbContent" value="<%=detailMap.get("SB_CONTENT") %>" class="frm_input wfull" readonly>
	</td>
		</tbody>
	</table>
	
	<hr style="display:block; margin-top:10px; margin-bottom:20px;">

<%
	Map<String,Object> answerMap = (Map<String,Object>) request.getAttribute("answerMap");
	String title = (answerMap != null) ? (String) answerMap.get("SB_TITLE") : "";
	String content = (answerMap != null) ? (String) answerMap.get("SB_CONTENT") : "";
	long sbNo = (answerMap != null) ? ((BigDecimal) answerMap.get("SB_NO")).longValue() : 0;
%>
<input type="hidden" name="answerNo" value="<%=detailMap.get("SB_NO")%>">
<input type="hidden" name="answerCate" value="<%=detailMap.get("SB_CATE")%>">
<input type="hidden" name="answerId" value="<%=accVO.getAccNo()%>">
<table>
	<colgroup>
		<col class="w100">
		<col class="w300">
	</colgroup>
	<tbody>
    <tr>
        <th>이름</th>
        <td>
        <%=accVO.getName()%>
        </td>
    </tr>
	<tr>
		<th>제목</th>
		<td colspan="3">
		<c:choose>
			<c:when test='<%=title.equals("")%>'>
				<input type="text" name="answerTitle" value="" class="frm_input wfull">
			</c:when>
			<c:otherwise>
				<input type="text" name="answerTitle" value="<%=title %>" class="frm_input wfull" readonly>
			</c:otherwise>
		</c:choose>
		</td>
	</tr>
	<tr>
		<th>내용</th>
		<td colspan="3">
		<c:choose>
			<c:when test='<%=content.equals("")%>'>
				<textarea rows="" cols="" name="answerContent" class="summernote"></textarea>
			</c:when>
			<c:otherwise>
				<%=content%>
			</c:otherwise>
		</c:choose>
		</td>
		</tbody>
	</table>
	
</div>

<div class="btn_confirm">
	<% if(Integer.parseInt(accVO.getAuth()) == 1 && request.getAttribute("answerMap") == null) { %>
	<input class="btn_lsmall bx-white" type="submit" value="답변하기">
	<% } %>
	<a href="javascript:history.go(-1);" class="btn_lsmall bx-white">뒤로가기</a>
</div>
	</form>
		</div>
	</div>
</div>

<script>
$('.summernote').summernote({
	height: 150
})
</script>
</body>
</html>

<jsp:include page="../../layout/footer.jsp"/>