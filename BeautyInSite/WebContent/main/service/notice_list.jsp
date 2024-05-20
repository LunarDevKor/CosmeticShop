<%@page import="org.apache.commons.collections.MapUtils"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="com.cosmetic.admin.notice.vo.NoticeVO"%>
<%@page import="com.cosmetic.member.account.vo.AccountVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../../layout/header.jsp"/>
<%
	List<NoticeVO> list = (List<NoticeVO>) request.getAttribute("list");
	DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
	int totalCount = (Integer)request.getAttribute("totalCount");
	
%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
<style>
  #pageArea {
    text-align: center;
  }

  .pagination {
    display: inline-block;
    padding: 0;
    margin: 0;
  }

  .pagination li {
    display: inline;
    margin: 0 2px;
  }

  .pagination li a {
    text-decoration: none;
    padding: 8px 12px;
    border: 1px solid #ddd;
    color: #333;
    border-radius: 4px;
  }

  .pagination li.active a {
    background-color: #ddd;
  }

  .pagination li.prev,
  .pagination li.next {
    display: inline-block;
    margin: 0 5px;
    padding: 8px 12px;
    border: 1px solid #ddd;
    border-radius: 4px;
  }

  .pagination li.prev a,
  .pagination li.next a {
    text-decoration: none;
    color: #333;
  }
</style>
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

<%

%>

$(function() {
	var itemQty = 1; // 총 아이템 수량
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
		<span>공지사항</span>
		<p class="pg_nav">HOME<i>&gt;</i>고객센터<i>&gt;</i>공지사항</p>
	</h2>
	
<form name="fboardlist" method="get" action="noticeList.do" onsubmit="return Check_Select(this);">
<input type='hidden' name="boardid" value="13">
<input type="hidden" name="sfl" value="">
<input type="hidden" name="stx" value="">
<input type="hidden" name="page" value="1">
<p class="pg_cnt">
	<em>총 <%=totalCount %>개</em>의 게시물이 있습니다.
</p>
<div class="tbl_head01 tbl_wrap">
	<table>
	<colgroup>
		<col>
		<col>
		<col>
		<col>
	</colgroup>
	<thead>
	<tr>
		<th scope="col">번호</th>
		<th scope="col" colspan="2">제목</th>
		<th scope="col">작성자</th>
		<th scope="col">등록일</th>
	</tr>
	</thead>
	<tbody>
			<tr>
<!-- 			<td colspan="6" class="empty_table">게시물이 없습니다.</td> -->
			<%
	if(list.size()==0){
		
%>	
		<tr>
			<td colspan="5">게시판이 존재하지 않습니다.</td>
		
		</tr>
<%
	}else{
		
		for(NoticeVO noticeVO : list){
		
%>		
		<tr>
			<td><%=noticeVO.getNoticeNo()%></td>
			<td colspan="2"><a href="noticeDetail.do?noticeNo=<%= noticeVO.getNoticeNo() %>"><%= noticeVO.getNoticeTitle() %></a></td>
			<td>관리자</td>
			<td><%=noticeVO.getNoticeDate().format(dtf)%></td>
		</tr>
<%
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
	<div id="pageArea" style="margin-top: 20px">
		
		<ul class="pager">
		  <li class="prev"><a href="#"><i class="fas fa-chevron-left"></i></a></li>
		
		<ul class="pagination pager">
		<%
			int sPage = request.getAttribute("sPage") == null ? 1 : (int)  request.getAttribute("sPage");
			int ePage = request.getAttribute("ePage") == null ? 1 : (int) request.getAttribute("ePage");
			int cPage = request.getAttribute("cPage") == null ? 1 : (int) request.getAttribute("cPage");
	
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
			}//for end %>
		</ul>
		
		
		  <li class="next"><a href="#"><i class="fas fa-chevron-right"></i></a></li>
		
		</ul>
	</div>
	<!-- 페이징 영역 end -->		
	<%
		}
	%>
<%
    AccountVO accVO = (AccountVO) session.getAttribute("LOGIN_USER");
    long auth = 0;
    if (accVO != null) {
        try {
            auth = Long.parseLong(accVO.getAuth());
        } catch (NumberFormatException e) {
        }
    }
%>
<div class="page_wrap">
    <%
        if (auth == 1) { // auth 값이 1인 경우에만 버튼을 표시
    %>
        <div class="btn_write">
            <a href="noticeWrite.do" class="btn btn-primary">공지 작성하기</a>
        </div>
    <%
        }
    %>
</div>
		
</form>
<form name="searchform" method="get" action="<%=request.getContextPath()%>/noticeSearch.do" >
<input type="hidden" name="boardid" value="13">
<div class="bottom_sch">
	<select name="cate">
	<option value='noticeTitle'>제목</option>
	<option value='noticeContent'>내용</option>
	</select>
	<input type="text" name="search" class="frm_input" value="">
	<input type="submit" value="검색" class="btn_lsmall grey">
	
</div>
</form>
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
	actionMap.put("update", (String) session.getAttribute("update"));
	actionMap.put("delete", (String) session.getAttribute("delete"));
	
	String msg = "";
	String result = "";
	
	for(Map.Entry<String,Object> entry : actionMap.entrySet()){
		if (entry.getValue() != null && (entry.getValue().equals("SUCCESS") || entry.getValue().equals("FAILURE"))) {
			String action = "";
			
			 Map<String, Object> actions = new HashMap<String, Object>() {{
		            put("insert", "작성");
		            put("update", "수정");
		            put("delete", "삭제");
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
<script>


	$('.pagination li').on('click',function(){
// 		alert( $(this).text() );
		location.href="notice.do?page=" + $(this).text();
	});
	
	$('.next').on('click',function(){
// 		alert( parseInt($('.pagination').children().last().text()) +1 );
		currentPage = parseInt($('.pagination').children().last().text()) +1;
		
		//현재 페이지가 totalPage보다 클때 페이지정보를 넘기지 않음
		if(<%=request.getAttribute("ttPage")%> < currentPage) return;
		location.href="notice.do?page=" + currentPage;
	});
	
	$('.prev').on('click',function(){
		
		currentPage = parseInt($('.pagination').children().first().text()) -1;
		//현재페이지가 0보다 작거나 같을 때
		if(currentPage <= 0) return;
		location.href="notice.do?page=" + currentPage;
	});
</script>	
	</div>		</div>
	</div>
	
	<jsp:include page="../../layout/footer.jsp"/>