<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.Map"%>
<%@page import="com.cosmetic.admin.vo.OrderVO"%>
<%@page import="java.util.List"%>
<%@page import="com.cosmetic.member.account.vo.AccountVO"%>
<jsp:include page="../../layout/header.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<OrderVO> orderList = (List<OrderVO>) request.getAttribute("orderList"); 
	List<Map<String,Object>> wishList = (List<Map<String,Object>>) request.getAttribute("wishList"); 

%>
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
					<p class="dn c1">
						<a href="http://demofran.com/shop/view.php?index_no=10"><img
							src="http://demofran.com/data/goods/1483411092/thumb-Dqpxzw59F3Pzg9PrtDe9tSmaUCF7tu_60x60.jpg"
							width="60" height="60"></a>
					</p>
					<p class="dn c1">
						<a href="http://demofran.com/shop/view.php?index_no=11"><img
							src="http://demofran.com/data/goods/1483411200/thumb-mUTbYFV6RKVvmYLLdFAjpB7zQp5DHR_60x60.jpg"
							width="60" height="60"></a>
					</p>
					<p class="dn c1">
						<a href="http://demofran.com/shop/view.php?index_no=12"><img
							src="http://demofran.com/data/goods/1483411284/thumb-NcEq6PgZABZ4yTEDMfbc7CMZjFb4w8_60x60.jpg"
							width="60" height="60"></a>
					</p>
					<p class="dn c2">
						<a href="http://demofran.com/shop/view.php?index_no=16"><img
							src="http://demofran.com/data/goods/1483411597/thumb-l7xUjCx1dy5Tp6GlLAy2zMlRLHhxGx_60x60.jpg"
							width="60" height="60"></a>
					</p>
					<p class="dn c2">
						<a href="http://demofran.com/shop/view.php?index_no=13"><img
							src="http://demofran.com/data/goods/1483411346/thumb-cgv31q6CGaR3YASGhNQGY2XR4m4NKJ_60x60.jpg"
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
				$(function () {
					var itemQty = 5; // 총 아이템 수량
					var itemShow = 3; // 한번에 보여줄 아이템 수량
					var Flag = 1; // 페이지
					var EOFlag = parseInt(itemQty / itemShow); 
					// 전체 리스트를 나눠 페이지 최댓값을 구하고
					var itemRest = parseInt(itemQty % itemShow); // 나머지 값을 구한 후
					if (itemRest > 0) // 나머지 값이 있다면
					{
						EOFlag++; // 페이지 최댓값을 1 증가시킨다.
					}
					$('.c' + Flag).css('display', 'block');
					$('#stv_pg').text(Flag + '/' + EOFlag); // 페이지 초기 출력값
					$('#up').click(function () {
						if (Flag == 1) {
							alert('목록의 처음입니다.');
						} else {
							Flag--;
							$('.c' + Flag).css('display', 'block');
							$('.c' + (Flag + 1)).css('display', 'none');
						}
						$('#stv_pg').text(Flag + '/' + EOFlag); // 페이지 값 재설정
					})
					$('#down').click(function () {
						if (Flag == EOFlag) {
							alert('더 이상 목록이 없습니다.');
						} else {
							Flag++;
							$('.c' + Flag).css('display', 'block');
							$('.c' + (Flag - 1)).css('display', 'none');
						}
						$('#stv_pg').text(Flag + '/' + EOFlag); // 페이지 값 재설정
					});

					$(window).scroll(function () {
						var pos = $("#ft").offset().top - $(window).height();
						if ($(this).scrollTop() > 0) {
							$(".qbtn_bx").fadeIn(300);
							if ($(this).scrollTop() > pos) {
								$(".qbtn_bx").addClass('active');
							} else {
								$(".qbtn_bx").removeClass('active');
							}
						} else {
							$(".qbtn_bx").fadeOut(300);
						}
					});

					// 퀵메뉴 상위로이동
					$("#anc_up").click(function () {
						$("html, body").animate({ scrollTop: 0 }, 400);
					});

					// 하위로이동
					$("#anc_dw").click(function () {
						$("html, body").animate({ scrollTop: $(document).height() }, 400);
					});

					// 좌/우 퀵메뉴 높이 자동조절
					var Theight = $("#header").height() - $("#gnb").height();
					var ptop = 20;
					$("#qcr, #qcl").css({ 'top': ptop + 'px' });

					$(window).scroll(function () {
						if ($(this).scrollTop() > Theight) {
							$("#qcr, #qcl").css({ 'position': 'fixed', 'top': '67px', 'z-index': '999' });
						} else {
							$("#qcr, #qcl").css({ 'position': 'absolute', 'top': ptop + 'px' });
						}
					});
				});
			</script>
		<!-- } 우측 퀵메뉴 끝 -->
		<div class="cont_inner">
			<%
				AccountVO accVO = (AccountVO) session.getAttribute("LOGIN_USER");
			%>
			<!-- 좌측메뉴 시작 { -->
			<aside id="aside">
				<div class="aside_hd">
					<p class="eng">MY PAGE</p>
					<p class="kor">마이페이지</p>
				</div>
				<div class="aside_name" style="text-align: center; padding-right: 6px">
				<img id="preview" style="border-radius: 25%; overflow: hidden; width: 100px; height: 100px;" src="data:image/jpg;base64,<%=accVO.getImgProfile()%>" alt="프로필 이미지">
				</div>
				<div class="aside_name" style="text-align: center">
				<%=accVO.getName() %>
				</div>
				<ul class="aside_bx">
					<li>포인트 <span><a href="<%=request.getContextPath()%>/pointhistory.do"><%=accVO.getPoint()%></a>P</span></li>
				</ul>
				<dl class="aside_my">
					<dt>주문현황</dt>
					<dd>
						<a href="<%=request.getContextPath()%>/orderhistory.do">주문/배송조회</a>
					</dd>
					<dt>쇼핑통장</dt>
					<dd>
						<a href="<%=request.getContextPath()%>/pointhistory.do">포인트조회</a>
					</dd>
					<dd>
						<a href="<%=request.getContextPath()%>/mycoupon.do">쿠폰관리</a>
					</dd>
					<dt>관심상품</dt>
					<dd>
						<a href="<%=request.getContextPath()%>/cartList.do">장바구니</a>
					</dd>
					<dd>
						<a href="<%=request.getContextPath()%>/wishList.do">찜한상품</a>
					</dd>
					<dt>회원정보</dt>
					<dd>
						<a href="<%=request.getContextPath()%>/edit.do">회원정보수정</a>
					</dd>
					<dd class="marb5">
						<a href="<%=request.getContextPath()%>/leave.do" id="deleteAcc">회원탈퇴</a>
					</dd>
				</dl>
			</aside>
			<!-- } 좌측메뉴 끝 -->

			<!-- 마이페이지 시작 { -->
			<div id="con_lf">
				<h2 class="pg_tit">
					<span>마이페이지</span>
					<p class="pg_nav">
						HOME<i>&gt;</i>마이페이지
					</p>
				</h2>

				<!-- 회원정보 개요 시작 { -->
				<div id="smb_my_ov">
					<h2>회원정보 개요</h2>
					<div id="smb_my_act">
						<ul>
							<li><a
								href="<%=request.getContextPath()%>/edit.do"
								class="btn_lsmall">회원정보수정</a></li>
						</ul>
					</div>

					<table id="smb_my_tbl">
						<tbody>
							<tr>
								<th scope="row">보유포인트</th>
								<td><a href="<%=request.getContextPath()%>/pointhistory.do"><b><%=accVO.getPoint()%>P</b></a></td>
								<th scope="row">보유쿠폰</th>
								<td><a href="<%=request.getContextPath()%>/coupon.do"><b>0개</b></a></td>
							</tr>
							<tr>
								<th scope="row">휴대폰번호</th>
								<td><%=accVO.getTel()%></td>
								<th scope="row">E-Mail</th>
								<td><%=accVO.getEmail()%></td>
							</tr>
							<tr>
								<th scope="row">회원가입일시</th>
								<td colspan="4"><%=accVO.getRegDate()%></td>
							</tr>
							<tr>
								<th scope="row">주소</th>
								<td colspan="4"><%=accVO.getAddr1()%> &nbsp;<%=accVO.getAddr2() %></td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- } 회원정보 개요 끝 -->

				<!-- 최근 주문내역 시작 { -->
				<div id="smb_my_od">
					<h2 class="anc_tit">최근 주문내역</h2>
					<div class="tbl_head02 tbl_wrap">
						<table>
							<colgroup>
								<col class="w120">
								<col>
								<col class="w100">
								<col class="w80">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">주문일자</th>
									<th scope="col">상품정보</th>
									<th scope="col">결제금액</th>
									<th scope="col">상태</th>
								</tr>
							</thead>
							<tbody>
							<%
							
								if(orderList != null){
								DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
									for(OrderVO ov : orderList){
							%>
								<tr>
									<td class="tac" rowspan="2">
										<p class="bold"><%=ov.getOrdDate().format(dtf)%></p>
										<p class="padt5">
											<a href="#" class="btn_small detailshow">상세보기</a>
										</p>
									</td>
								</tr>
								<tr class="rows">
									<td>
										<div class="ini_wrap">
											<table class="wfull">
												<colgroup>
													<col class="w70">
													<col>
												</colgroup>
												<tr>
													<td class="vat tal">
													<a href="<%=request.getContextPath()%>/prodDetail.do?prodNo=<%=ov.getProdNo()%>">
													<img src="<%=ov.getProdImg()%>"
														width="60" height="60"></a></td>
													<td class="vat tal"><a
														href="<%=request.getContextPath()%>/prodDetail.do?prodNo=<%=ov.getProdNo()%>">대박난
															<%=ov.getProductName()%></a>
														<p class="padt3 fc_999">주문번호 : <%=ov.getOrdNo()%> / 수량 :
															<%=ov.getQuantity()%>개 / 배송비 : 0원</p></td>
												</tr>
											</table>
										</div>
									</td>
									<td class="tar"><%=ov.getOrdTotalamt()%>원</td>
									<td class="tac">
									<%if(ov.getOrdStatus().equals("0")) {%>
									<p>주문처리중</p>
									<%} else {%>
									<p>배송중</p>
									<%} %>
									</td>
								</tr>
								<%
									}
								}else{
								%>
								 <tr>
									<td colspan="4" class="empty_table">주문 내역이 없습니다.</td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>
					
					<div class="smb_my_more">
						<a href="<%=request.getContextPath()%>/orderhistory.do"
							class="btn_lsmall bx-white">주문내역 더보기</a>
					</div>
				</div>
				<!-- } 최근 주문내역 끝 -->

				<!-- 최근 찜한상품 시작 { -->
				<div id="smb_my_wish">
				<h2 class="anc_tit">최근 찜한상품</h2>
				<div class="tbl_head02 tbl_wrap">
					<table>
					<colgroup>
						<col class="w90">
						<col>
						<col class="w100">
						<col class="w140">
					</colgroup>
					<thead>
					<tr>
						<th scope="col">이미지</th>
						<th scope="col">상품명</th>
						<th scope="col">판매가</th>
						<th scope="col">보관일시</th>
					</tr>
					</thead>
					<tbody>
					<%
						if(wishList != null){
							DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
							for(Map<String,Object> map : wishList){
								LocalDateTime localDate = ((Timestamp)map.get("WISH_DATE")).toLocalDateTime();
					%>
								<tr>
						<td class="tac"><a href="<%=request.getContextPath()%>/prodDetail.do?prodNo=<%=map.get("PROD_NO") %>"><img src="<%=map.get("PROD_IMG") %>" width="70" height="70"></a></td>
						<td class="td_name">
							<a href="<%=request.getContextPath()%>/prodDetail.do?prodNo=<%=map.get("PROD_NO") %> 	"><%=map.get("PROD_NAME") %></a>
							<p class="fc_999"><%=map.get("PROD_CONTENT")%></p>
						</td>
						<td class="tar"><span class="mpr"><%=map.get("PROD_PRICE") %><span>원</span></span></td>
						<td class="tac"><%=localDate.format(dtf)%></td>
					</tr>
					
					<%
							}
						}
					%>
								</tbody>
					</table>
				</div>
			
				<div class="smb_my_more">
					<a href="<%=request.getContextPath()%>/wishList.do" class="btn_lsmall bx-white">찜한상품 더보기</a>
				</div>
			</div>
				<!-- } 최근 찜한상품 끝 -->

			</div>
			<!-- } 마이페이지 끝 -->
		</div>
	</div>
	<script>
	</script>
	<jsp:include page="../../layout/footer.jsp" />