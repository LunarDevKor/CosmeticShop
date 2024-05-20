<%@page import="java.util.stream.Collectors"%>
<%@page import="java.sql.Clob"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.Reader"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="com.cosmetic.member.account.vo.AccountVO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../layout/header.jsp"/>
<%
List<Map<String, Object>> list = (List<Map<String, Object>>) request.getAttribute("list");
String search = (String)request.getAttribute("search");
int totalCount = (Integer)request.getAttribute("totalCount");
AccountVO accVO = (AccountVO) session.getAttribute("LOGIN_USER");

%>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="cont_inner">

<h2 class="pg_tit"><span>상품 검색 결과</span></h2>

<div class="bd list1 marb10">
	<fieldset style="padding:0 10px;">
		<legend>검색</legend>
		<form name="fsearch2" id="fsearch2" action="prodSearch.do" method="get">
		<table class="wfull">
		<tbody><tr height="40">
			<td class="tal padr10 padl10 bb">
				<strong class="fc_255">"<%=search %>"</strong> 통합검색 결과 총 <strong class="fc_255"><%=totalCount %></strong>개의 상품이 검색 되었습니다.
			</td>
		</tr>
		<tr height="40">
			<td class="tal padr10 padl10">
				<span class="padr5">검색</span>
				<input name="search" value="" size="40" class="frm_input">
				<input type="submit" value="검색" class="btn_small grey">
			</td>
		</tr>
		</tbody></table>
		</form>
	</fieldset>
</div>

<div class="tab_sort">
	<ul>
<%-- 		<li><a href="prodSearch.do?ss_tx=<%= request.getParameter("search") %>&amp;page_rows=&amp;sort=readcount&amp;sortodr=desc">인기상품순</a></li> --%>
<li><a href="prodSearch.do?search=<%= search %>&amp;page_rows=&amp;sort=PROD_PRICE&amp;sortodr=asc">낮은가격순</a></li>
<li><a href="prodSearch.do?search=<%= search %>&amp;page_rows=&amp;sort=PROD_PRICE&amp;sortodr=desc">높은가격순</a></li>
<%-- <li><a href="prodSearch.do?ss_tx=<%= request.getParameter("search") %>&amp;page_rows=&amp;sort=PROD_DATE&amp;sortodr=desc">후기많은순</a></li> --%>
<li><a href="prodSearch.do?search=<%=search %>&amp;page_rows=&amp;sort=PROD_DATE&amp;sortodr=desc">최근등록순</a></li>
	</ul>
</div>

<div class="pr_desc wli4">
	<ul>
<%
    if(list != null && !list.isEmpty()){
        for(Map<String, Object> map : list){
            if(map != null){
            	Reader reader;
            	BufferedReader br;
            	String result = "";
            	if(map.get("PROD_IMG") != null){
            		Clob clob = (Clob) map.get("PROD_IMG");
            		reader = clob.getCharacterStream();
            		br = new BufferedReader(reader);
            		result = br.lines().collect(Collectors.joining());
            	}
%>
			<li>
				<a href="http://demofran.com/shop/view.php?index_no=21">
					<dd class="marb10">
						<dt><img src="<%=result %>" width="235" height="235"></dt>
						<dd class="pname"><%=map.get("PROD_NAME") %></dd>
						<dd class="pname"><%=map.get("PROD_CONTENT") %></dd>
						<dd class="price"><span class="spr"><%=map.get("PROD_PRICE") %><span>원</span></span><span class="mpr"><%=map.get("PROD_PRICE") %><span>원</span></span></dd>
						<dd class="petc">
							<span class="fbx_small fbx_bg6"><%= ((BigDecimal)request.getAttribute("GRD_ACCR")).multiply((BigDecimal)map.get("PROD_PRICE")).divide(BigDecimal.valueOf(100)) %>원 적립</span>
							<span class="fbx_small fbx_bg4">무료배송</span>
						</dd>
					</dd>
				</a>
				<p class="ic_bx"><span onclick="javascript:itemlistwish('19');" id="19" class="19 zzim"></span> <a href="http://demofran.com/shop/view.php?index_no=19" target="_blank" class="nwin"></a></p>
			</li>
<%
            }
        }
    }
%>
	</ul>
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
		location.href="prodSearch.do?search=<%=search%>&page=" + $(this).text();
	});
	
	$('.next').on('click',function(){
// 		alert( parseInt($('.pagination').children().last().text()) +1 );
		currentPage = parseInt($('.pagination').children().last().text()) +1;
		
		//현재 페이지가 totalPage보다 클때 페이지정보를 넘기지 않음
		if(<%=request.getAttribute("ttPage")%> < currentPage) return;
		location.href="prodSearch.do?search=<%=search%>&page=" + currentPage;
	});
	
	$('.prev').on('click',function(){
		
		currentPage = parseInt($('.pagination').children().first().text()) -1;
		//현재페이지가 0보다 작거나 같을 때
		if(currentPage <= 0) return;
		location.href="prodSearch.do?search=<%=search%>&page=" + currentPage;
	});



</script>	


		</div>
		
<jsp:include page="../layout/footer.jsp"/>

