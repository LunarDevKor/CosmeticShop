<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.cosmetic.product.vo.ProdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//List<ProdVO> list = (List<ProdVO>) request.getAttribute("bestList");//
List<Map<String, Object>> list = (List<Map<String, Object>>) request.getAttribute("newList");
%>

<jsp:include page="../layout/header.jsp" />
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

	<div id="container">

		<div class="qbtn_bx">
			<button type="button" id="anc_up">TOP</button>
			<button type="button" id="anc_dw">DOWN</button>
		</div>

		<script>
$(function() {
	var itemQty = 0; // 총 아이템 수량
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

			<h2 class="pg_tit">
				<span>신상품</span>
				<p class="pg_nav">
					HOME<i>&gt;</i>신상품
				</p>
			</h2>

			<div class="tab_sort">
				<span class="total">전체상품 <b class="fc_90" id="total"><%=list.size()%></b>개
				</span>
				<ul>
					<li><a
						href="/shop/listtype.php?type=1&page_rows=&sort=readcount&sortodr=desc"
						class="active">신상품순</a></li>
					<li><a
						href="/shop/listtype.php?type=1&page_rows=&sort=goods_price&sortodr=asc">낮은가격순</a></li>
					<li><a
						href="/shop/listtype.php?type=1&page_rows=&sort=goods_price&sortodr=desc">높은가격순</a></li>
					<li><a
						href="/shop/listtype.php?type=1&page_rows=&sort=m_count&sortodr=desc">후기많은순</a></li>
					<li><a
						href="/shop/listtype.php?type=1&page_rows=&sort=index_no&sortodr=desc">최근등록순</a></li>
				</ul>
			</div>
			<div class="pr_desc wli4">

				<ul>
					<%
						for (Map<String, Object> pv : list) {
					%>
					<li>
					<a href="prodDetail.do?prodNo=<%=pv.get("PROD_NO")%>">
						<dl>

							<td>
									<img src="<%=pv.get("PROD_IMG")%>" width="270" height="270">
							</td>
							<dd class="prodName"><%=pv.get("PROD_NAME")%></dd>

							<dd class="prodPrice">
								<span class="mpr" style="font-weight: 800; color: #e02020;"><%=pv.get("PROD_PRICE")%><span>원</span></span>
							</dd>

							 <dd class="petc">
								<span class="fbx_small fbx_bg6">1,580P 적립</span> <span
									class="fbx_small fbx_bg4">무료배송</span>
							</dd>

						</dl>
						</a>
					</li>
					<%
						}
					%>

				</ul>

			</div>


		</div>
	</div>
	<jsp:include page="../layout/footer.jsp" />