<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="java.sql.Clob"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.Reader"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.cosmetic.product.vo.ProdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
List<Map<String, Object>> list = (List<Map<String, Object>>) request.getAttribute("list");
String cate = (String)request.getAttribute("cate");
int totalCount = (Integer)request.getAttribute("totalCount");


%>




<jsp:include page="../layout/header.jsp" />
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
					<p class="no_item">없음</p>
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
	var itemQty = 0; // 총 아이템 수량
	var itemShow = 3; // 한번에 보여줄 아이템 수량
	var Flag = 1; // 페이지
	var EOFlag = parseInt(itemQty/itemShow); // 전체 리스트를 나눠 페이지 최댓값을 구하고
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

			<h2 class="pg_tit">
				<span>쇼핑특가</span>
				<p class="pg_nav">
					HOME<i>&gt;</i>쇼핑특가
				</p>
			</h2>

			<div class="tab_sort">
				<span class="total">전체상품 <b class="fc_90" id="total"><%=totalCount %></b>개
				</span>
				<ul>
<!-- 					<li><a -->
<!-- 						href="/shop/listtype.php?type=1&page_rows=&sort=readcount&sortodr=desc" -->
<!-- 						class="active">인기상품순</a></li> -->
					<li><a
						href="cateList.do?cate=<%=cate %>&amp;page_rows=&amp;sort=PROD_PRICE&amp;sortOdr=asc">낮은가격순</a></li>
                     
					<li><a
						href="cateList.do?cate=<%=cate %>&amp;page_rows=&amp;sort=PROD_PRICE&amp;sortOdr=desc">높은가격순</a></li>
                     <li><a
						href="cateList.do?cate=<%=cate %>&amp;page_rows=&amp;sort=PROD_DATE&amp;sortOdr=desc">최근등록순</a></li>
<!-- 					<li><a -->
<!-- 						href="/shop/listtype.php?type=1&page_rows=&sort=m_count&sortodr=desc">후기많은순</a></li> -->
					
				</ul>
				
			</div>
			
			<div class="pr_desc wli4">
				<ul>
				<%
    pageContext.setAttribute("cate", cate);
    for (Map<String, Object> map : list) {
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
            	<a href="prodDetail.do?prodNo=<%=map.get("PROD_NO")%>">
                <dl>
                    <td>
                        
                            <img src="<%=result%>" width="270" height="270">
                        
                    </td>
                    <dd class="prodName">
                        <%=map.get("PROD_NAME")%>
                    </dd>
                    <dd class="prodPrice">
                        <span class="mpr" style="font-weight: 800; color: #e02020;">
                            <%=map.get("PROD_PRICE")%>
                            <span>원</span>
                        </span>
                    </dd>
                    <dd class="petc">
                        <span class="fbx_small fbx_bg6"><%= ((BigDecimal)request.getAttribute("GRD_ACCR")).multiply((BigDecimal)map.get("PROD_PRICE")).divide(BigDecimal.valueOf(100)) %>원 적립</span> 
                        <span class="fbx_small fbx_bg4">무료배송</span>
                    </dd>
                </dl>
                </a>
            </li>
<%
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
	$(function(){
		
	$('.pagination li').on('click',function(){
// 		alert( $(this).text() );
		location.href="cateList.do?&cate=<%=cate%>&page=" + $(this).text();
	});
	
	$('.next').on('click',function(){
// 		alert( parseInt($('.pagination').children().last().text()) +1 );
		currentPage = parseInt($('.pagination').children().last().text()) +1;
		
		//현재 페이지가 totalPage보다 클때 페이지정보를 넘기지 않음
		if(<%=request.getAttribute("ttPage")%> < currentPage) return;
		
		console.log(currentPage);
		location.href="cateList.do?&cate=<%=cate%>&page=" + currentPage;
	});
	
	$('.prev').on('click',function(){
		
		currentPage = parseInt($('.pagination').children().first().text()) -1;
		//현재페이지가 0보다 작거나 같을 때
		if(currentPage <= 0) return;
		console.log(currentPage);
		location.href="cateList.do?&cate=<%=cate%>&page=" + currentPage;
	});
	
	})

</script>	

		</div>
	</div>
	<jsp:include page="../layout/footer.jsp" />