<%@page import="com.cosmetic.member.account.vo.AccountVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.time.ZoneId"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Map"%>
<%@page import="com.cosmetic.admin.vo.QNAVO"%>
<%@page import="java.util.List"%>
<jsp:include page="../../layout/header.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<Map<String, Object>> qnaList = (List<Map<String, Object>>) request.getAttribute("qnalist");
	AccountVO accVO = (AccountVO) request.getSession(false).getAttribute("LOGIN_USER"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
td {
	text-align: center;
}
</style>
</head>
<body>

	<div id="container">

		<!-- 퀵메뉴 우측날개 시작 { -->
		<div id="qcr">
			<ul>
				<li class="tit">최근 본 상품</li>
				<li>
					<p class="dn c1">
						<a href="http://demofran.com/shop/view.php?index_no=16"><img
							src="http://demofran.com/data/goods/1483411597/thumb-l7xUjCx1dy5Tp6GlLAy2zMlRLHhxGx_60x60.jpg"
							width="60" height="60"></a>
					</p>
					<p class="dn c1">
						<a href="http://demofran.com/shop/view.php?index_no=12"><img
							src="http://demofran.com/data/goods/1483411284/thumb-NcEq6PgZABZ4yTEDMfbc7CMZjFb4w8_60x60.jpg"
							width="60" height="60"></a>
					</p>
					<p class="dn c1">
						<a href="http://demofran.com/shop/view.php?index_no=21"><img
							src="http://demofran.com/data/goods/1516934487/thumb-79666_Dqpxzw59F3Pzg9PrtDe9tSmaUCF7tu_60x60.jpg"
							width="60" height="60"></a>
					</p>
				</li>
				<li class="stv_wrap"><img
					src="http://demofran.com/img/bt_qcr_prev.gif" id="up"> <span
					id="stv_pg"></span> <img
					src="http://demofran.com/img/bt_qcr_next.gif" id="down"></li>
			</ul>
		</div>
		<!-- } 퀵메뉴 우측날개 끝 -->

		<div class="qbtn_bx">
			<button type="button" id="anc_up">TOP</button>
			<button type="button" id="anc_dw">DOWN</button>
		</div>

		<script>
$(function() {
	var itemQty = 3; 
	// 총 아이템 수량
	var itemShow = 3; 
	// 한번에 보여줄 아이템 수량
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
<%!
private static String getResultMsg(String action, String result){
	switch(result) {
	case "SUCCESS" :
		return "게시글 " + action + "에 성공하였습니다.";
	case "FAILURE" :
		return "게시글 " + action + "에 실패하였습니다.";
	default:
		return "알 수 없는 동작 결과입니다.";
	}
}
%>
<%
	Map<String,Object> actionMap = new HashMap<>();
	actionMap.put("insert", (String) session.getAttribute("insert"));
	actionMap.put("answer", (String) session.getAttribute("answer"));
	
	String msg = "";
	String result = "";
	
	for(Map.Entry<String,Object> entry : actionMap.entrySet()){
		if (entry.getValue() != null && (entry.getValue().equals("SUCCESS") || entry.getValue().equals("FAILURE"))) {
			String action = "";
			
			 Map<String, Object> actions = new HashMap<String, Object>() {{
		            put("insert", "작성");
		            put("answer", "답변");
		     }};
			
		    action = (String) actions.get(entry.getKey());
			
	        msg = getResultMsg(action, entry.getValue().toString());
	        result = entry.getValue().toString();
	        
	        session.removeAttribute(entry.getKey());
	        
	        break;
		}
	}
%>

<%
	boolean showToast = !msg.isEmpty() && (result.equals("SUCCESS") || result.equals("FAILURE"));
	if(showToast) {
		String icon = result.equals("SUCCESS") ? "success" : "error";
%>

<script src="js/toast.js"></script>
<script>
Toast.fire({
icon: '<%=icon%>',
title: '<%=msg%>'
});
</script>
<%
	}
%>
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
					<p class="pg_nav">
						HOME<i>&gt;</i>고객센터<i>&gt;</i>1:1 상담문의
					</p>
				</h2>

				<div class="tar marb5">
					<%if(!accVO.getAuth().equals("1")) {%>
					<a href="qnaWrite.do" class="btn_small wset">상담문의하기</a>
					<%} %>
				</div>

				<div class="tbl_head02 tbl_wrap">
					<table>
						<colgroup>
							<col class="w50">
							<col class="w100">
							<col>
							<col class="w100">
							<col class="w100">
							<col class="w80">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">분류</th>
								<th scope="col">제목</th>
								<th scope="col">작성자</th>
								<th scope="col">날짜</th>
								<th scope="col">상태</th>
							</tr>
						</thead>
						<tbody>
							<%
								if (qnaList.size() == 0) {
							%>
							<tr>
								<td colspan="5">회원문의가 존재하지 않습니다.</td>

							</tr>
							
							<tr>
								<td colspan="6" class="empty_list">내역이 없습니다.</td>
							</tr>
							<%
								} else {

							for (Map<String, Object> map : qnaList) {
							%>

							<tr>
								<td style="text-align: center"><%=map.get("SB_NO")%></td>
								<td style="text-align: center"><%=map.get("CODE_NAME")%></td>
								<td style="text-align: center">
								<a href="qnaDetail.do?sbNo=<%=map.get("SB_NO")%>">
										<%=map.get("SB_TITLE")%>
								</a>
								</td>
								<td style="text-align: center"><%=map.get("NAME") %></td>
								<%
									Timestamp ts = (Timestamp) map.get("SB_CREATE_DATE");
									LocalDateTime ldt = LocalDateTime.ofInstant(ts.toInstant(), ZoneId.systemDefault());
									DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
								%>
								<td style="text-align: center"><%=ldt.format(dtf)%></td>
								<%if(Integer.parseInt((String)map.get("SB_PROCESSED")) == 0) {%>
								<td style="text-align: center"><i class="fa-solid fa-xmark fa-2x" style="color:red;"></i></td>
								<%} else {%>
								<td style="text-align: center"><i class="fa-solid fa-check fa-2x" style="color:green;"></i></td>
								<%} %>
							</tr>

							<%
								}
							}
							%>
						</tbody>
					</table>
				</div>

			</div>

			<script>
function js_qna(id){
	var $con = $("#sod_qa_con_"+id);
	if($con.is(":visible")) {
		$con.hide();
	} else {
		$(".sod_qa_con:visible").hide();
		$con.show();
	}
}
</script>
		</div>
	</div>

	<jsp:include page="../../layout/footer.jsp" />