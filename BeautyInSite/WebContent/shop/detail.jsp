<%@page import="java.util.Map"%>
<%@page import="com.cosmetic.product.vo.ProdVO"%>
<%@page import="com.cosmetic.member.account.vo.AccountVO"%>
<%@page import="com.cosmetic.product.service.IReviewService"%>
<%@page import="com.cosmetic.product.dao.IReviewDao"%>
<%@page import="com.cosmetic.product.dao.ReviewDaoImpl"%>
<%@page import="com.cosmetic.common.vo.AtchFileDetailVO"%>
<%@page import="com.cosmetic.product.vo.ReviewVO"%>
<%@page import="java.util.List"%>
<%@page import="com.cosmetic.product.service.IProdService"%>
<%@page import="com.cosmetic.product.service.ProdServiceImpl"%>
<%@page import="com.cosmetic.product.dao.IProdDao"%>
<%@page import="com.cosmetic.product.dao.ProdDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../layout/header.jsp" />
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 구글폰츠 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/basic.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>


	<div id="container">

		<!-- 퀵메뉴 우측날개 시작 { -->
		<div id="qcr">
			<ul>
				<li class="tit">최근 본 상품</li>
				<li>
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
				var itemQty = 1; // 총 아이템 수량
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
				$('#up').click(function() {
					if (Flag == 1) {
						alert('목록의 처음입니다.');
					} else {
						Flag--;
						$('.c' + Flag).css('display', 'block');
						$('.c' + (Flag + 1)).css('display', 'none');
					}
					$('#stv_pg').text(Flag + '/' + EOFlag); // 페이지 값 재설정
				})
				$('#down').click(function() {
					if (Flag == EOFlag) {
						alert('더 이상 목록이 없습니다.');
					} else {
						Flag++;
						$('.c' + Flag).css('display', 'block');
						$('.c' + (Flag - 1)).css('display', 'none');
					}
					$('#stv_pg').text(Flag + '/' + EOFlag); // 페이지 값 재설정
				});

				$(window).scroll(function() {
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
				$("#anc_up").click(function() {
					$("html, body").animate({
						scrollTop : 0
					}, 400);
				});

				// 하위로이동
				$("#anc_dw").click(function() {
					$("html, body").animate({
						scrollTop : $(document).height()
					}, 400);
				});

				// 좌/우 퀵메뉴 높이 자동조절
				var Theight = $("#header").height() - $("#gnb").height();
				var ptop = 20;
				$("#qcr, #qcl").css({
					'top' : ptop + 'px'
				});

				$(window).scroll(function() {
					if ($(this).scrollTop() > Theight) {
						$("#qcr, #qcl").css({
							'position' : 'fixed',
							'top' : '67px',
							'z-index' : '999'
						});
					} else {
						$("#qcr, #qcl").css({
							'position' : 'absolute',
							'top' : ptop + 'px'
						});
					}
				});
			});
		</script>
		<!-- } 우측 퀵메뉴 끝 -->
		<div class="cont_inner">

			<form name="fbuyform" method="post">
				<p class="tit_navi marb15">
					<a href='http://demofran.com' class='fs11'>HOME</a> <i
						class="ionicons ion-ios-arrow-right"></i> <a
						href='http://demofran.com/shop/list.php?ca_id=001'>패션의류/잡화/뷰티</a>
				</p>
				<div class="vi_info">


					<%
						ProdVO prodList = (ProdVO) request.getAttribute("prodvo");
						pageContext.setAttribute("prodNo", prodList.getProdNo());
						String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
						session.removeAttribute("msg");
					%>

					<div class="vi_img_bx" style="width: 400px">
						<div class="t_social">
							<span>[판매종료]</span>&nbsp;&nbsp;시작일 : 2021년 06월 06일 ~ 종료일 : 2021년
							06월 16일
						</div>
						<div class="bimg">
							<img src="<%=prodList.getProdImg()%>" width="400" height="400" id='big'>
						</div>
						<div class="simg_li">
							<ul>
								<li><img src="" onmouseover="document.all['big'].src='http://demofran.com/data/goods/1516934487/thumb-79666_HBd4xBl6Vmnnn5s8R938FPteb8lZaU_400x400.jpg'"></li>
							</ul>
						</div>
					</div>

					<div class="vi_txt_bx">
						<h2 class="prodNo">
							<%=prodList.getProdName()%>
							<p class="stxt"></p>
						</h2>
						<div class="price_bx">

							<dl>
								<dt class="padt5">판매가격</dt>
								<dd class="price">
									<span class="price"><%=prodList.getProdPrice()%><span>원</span></span>
								</dd>
							</dl>
						</div>
						<div class="vi_txt_li">
							<dl>
								<dt>상품코드</dt>
								<dd><%=prodList.getProdNo()%></dd>
							</dl>
							<dl>
								<dt>포인트</dt>
								<dd>
									1,580P <span class='fc_107'>(5%)</span>
								</dd>
							</dl>



							<dl>
								<dt>상품명</dt>
								<dd><%=prodList.getProdName()%></dd>
							</dl>
							<dl>
								<dt>배송비</dt>
								<dd>무료배송</dd>
							</dl>
							<dl>
								<dt>배송가능지역</dt>
								<dd>전국</dd>
							</dl>
							<dl>
							<% ReviewVO rvDetail = (ReviewVO) request.getAttribute("reviewDetail");%>
								<dt>고객상품평</dt>
								<dd>상품평 : <b><%=rvDetail.getCnt()%>건</b>, 
								평점 : <% if(rvDetail.getRvRating() == 1) {%>
									<img class="starimg" src="./imgSource/1.png" align="absmiddle">
									<% }else if (rvDetail.getRvRating() == 2){ %>
									<img class="starimg" src="./imgSource/2.png" align="absmiddle">
									<%}else if (rvDetail.getRvRating() == 3){%>
									<img class="starimg" src="./imgSource/3.png" align="absmiddle">
									<%}else if (rvDetail.getRvRating() == 4){%>
									<img class="starimg" src="./imgSource/4.png" align="absmiddle">
									<%}else {%>
									<img class="starimg" src="./imgSource/5.png" align="absmiddle">
									<%}%>
							</dl>

						</div>

						<div id="option_set_list">
						<ul id="option_set_added">
				<li class="sit_opt_list vi_txt_li">
					<dl>
						<dt>
							<span class="sit_opt_subj">수량</span>
							<span class="sit_opt_prc"></span>
						</dt>
						<dd class="li_ea">
							<span>
								<a href="#" class="defbtn_minus"><i class="fa-regular fa-angle-down"></i></a>
<!-- 								<button type="button" class="defbtn_minus">감소</button> -->
								<input type="text" id="qtyOpt" name="" value="1" class="inp_opt" title="수량설정" size="2">
<!-- 								<button type="button" class="defbtn_plus">증가</button> -->
								<a href="#" class="defbtn_plus"><i class="fa-regular fa-angle-up"></i></a>
							</span>
						</dd>
					</dl>
				</li>
			</ul>
					</div>

						<!-- 선택된 옵션 시작 { -->
						<div id="option_set_list"></div>
						<!-- } 선택된 옵션 끝 -->
						<div id="sit_tot_views" class="dn" style="display: block;">
							<span class="fl">총 합계금액</span>
							<span id="sit_tot_price" class="prdc_price"><%=prodList.getProdPrice()%> 원</span>
						</div>
						<div class="vi_btn">
							<span>
							<a href="#" id="orderProd" class="btn_large wset" data-pno="<%=prodList.getProdNo()%>">구매하기</a></span>
							 <span> 
							 <a href="#" class="btn_large grey" id="addCart" data-pno="<%=prodList.getProdNo()%>">장바구니</a>
							</span> <span> <a href="#" id="addWish"
								class="btn_large bx-white">찜하기</a>
							</span>
						</div>
					</div>
				</div>
			</form>

			<div class="mart_container">

					<div class="vi_tab ">
						<ul class="tabs">
							<li class="on current" data-tab="tab-1">상품정보</li>
							<li data-tab="tab-2" id="list02">상품평</li>
							<li>상품문의</li>
							<li>배송/교환/반품안내</li>
						</ul>
					</div>
				<section id="tab-1" class="mart50_1 tab-content current" data-tab="tab-1">
					<a name="tab1"></a>

						<div>
							<%
								if (prodList == null || prodList.getAtchfileDetList() == null || prodList.getAtchfileDetList().isEmpty()) {
							%>
							<p>회원정보가 존재하지 않거나 이미지가 없습니다.</p>

							<%
								} else {
							%>


							<div class="prod_container" id="<%=prodList.getProdNo()%>">
								<%
									for (AtchFileDetailVO atchFileVO : prodList.getAtchfileDetList()) {
								%>
								<p>
								<%-- 	디테일::<%=atchFileVO.getFileDetNo()%>
									파일::<%=prodList.getFileNo()%></p> --%>
								<div>
									<img
										src="<%=request.getContextPath()%>/fileDownload.do?fileDetNo=<%=atchFileVO.getFileDetNo()%>&fileNo=<%=prodList.getFileNo()%>"
										class="pv_img">
								</div>

								<%
									}
								}
								%>
							</div>
						</div>


					<div class="mart20 marb30" data-tab="tab-2">
						<h2 class="anc_tit">전자상거래 등에서의 상품정보제공고시</h2>
						<div class="tbl_frm01 tbl_wrap">
							<table>
								<colgroup>
									<col width="25%">
									<col width="75%">
								</colgroup>
								<tr>
									<th scope="row">상품코드</th>
									<td><%=prodList.getProdNo()%></td>
								</tr>
								<tr>
									<th scope="row">상품명</th>
									<td><%=prodList.getProdName()%></td>
								</tr>
								<tr>
									<th scope="row">브랜드번호</th>
									<td><%=prodList.getBrNo()%></td>
								</tr>
								<tr>
									<th scope="row">상품설명</th>
									<td><%=prodList.getProdContent()%></td>
								</tr>
								<tr>
									<th scope="row">상품가격</th>
									<td><%=prodList.getProdPrice()%></td>
								</tr>
								<tr>
									<th scope="row">카테고리번호</th>
									<td><%=prodList.getProdCateNo()%></td>
								</tr>


							</table>
						</div>
					</div>
				</section>

				<section id="tab-2" class="mart50_1 tab-content">
					<a name="tab2"></a>
					<!-- <div class="vi_tab">
						<ul>
							<li onclick="javascript:pg_anchor('tab1')">상품정보</li>
							<li onclick="javascript:pg_anchor('tab2')" class="on">상품평</li>
							<li onclick="javascript:pg_anchor('tab3')">상품문의</li>
							<li onclick="javascript:pg_anchor('tab4')">배송/교환/반품안내</li>
						</ul>
					</div> -->
					<div class="mart15">

						<a name="it_comment"></a>
						<div class="bx-danger">
							전체 <b><%=rvDetail.getCnt()%></b>건의 상품평이 있습니다. 상품평 이외에 다른 목적이나 불건전한 내용을 올리실 경우 삭제 처리될 수
							있습니다.
						</div>

						<table class="wfull">
						</table>

						<form id="fuserform" action="insert.do"
							method="post" onsubmit="return fuserform_submit(this);"
							class="mart20" encType="multipart/form-data">
						<input type="hidden" name="prodNo" value="<%=prodList.getProdNo()%>">
							<table class="wfull">
								<tr>
									<!-- <td class="tal">로그인 후 작성하여 주십시오.</td> -->
									<td class="tar"><input type="radio" name="rvRating" value="1"> 
										<img class="starimg" src="./imgSource/1.png" align="absmiddle"> 
										<input type="radio" name="rvRating" value="2"> 
										<img class="starimg" src="./imgSource/2.png" align="absmiddle"> 
										<input type="radio" name="rvRating" value="3"> 
										<img class="starimg" src="./imgSource/3.png" align="absmiddle"> 
										<input type="radio" name="rvRating" value="4"> 
										<img class="starimg" src="./imgSource/4.png" align="absmiddle"> 
										<input type="radio" name="rvRating" value="5"> 
										<img class="starimg" src="./imgSource/5.png" align="absmiddle">
									</td>
								</tr>
							</table>
							<div class="file">
								<input type="file" name="atchFile" class="rv_file" multiple>
							</div>

							<table class="wfull mart10">
								<tr>
									<td><textarea name="rvContent" class="letter_bx"></textarea></td>
									<td width="10"></td>
									<td width="78">
										<button class="btn_letter" type="submit">
											사용후기<br>등록하기
										</button>
									</td>
								</tr>
							</table>
						</form>

						<%
							List<ReviewVO> reviewList = (List<ReviewVO>) request.getAttribute("reviewList");

						String msg1 = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
						session.removeAttribute("msg");
						%>

						<%
							if (reviewList.size() == 0) {
						%>
						<p>리뷰가 존재하지 않습니다.</p>

						<%
							} else {

						for (ReviewVO rv : reviewList) {
						%>

						<div class="review_container" id="<%=rv.getRvNo()%>">
							<div class="left_box">
								
								
								<%
								if(rv.getRvRating() == 1){
								
								%>
								<div class="tar_box rv_con">
									<img class="starimg" src="./imgSource/1.png" align="absmiddle"> 
								</div>
								<%
								}else if (rv.getRvRating() == 2){
								%>
								<div class="tar_box">
									<img class="starimg" src="./imgSource/2.png" align="absmiddle">
								</div>
								<%
								}else if (rv.getRvRating() == 3){
								%>
								<div class="tar_box">
									<img class="starimg" src="./imgSource/3.png" align="absmiddle">
								</div>
								<%
								}else if (rv.getRvRating() == 4){
								%>
								<div class="tar_box">
									<img class="starimg" src="./imgSource/4.png" align="absmiddle">
								</div>
								<%
								}else {
								%>
								<div class="tar_box">
									<img class="starimg" src="./imgSource/5.png" align="absmiddle">
								</div>
								<%
								}
								
								if(rv.getAtchfileDetList() != null){
									
								%>
								<div class="rv_con img_box">
								<% 
								for (AtchFileDetailVO atchFileVO : rv.getAtchfileDetList()) {
								%>
									<img src="<%=request.getContextPath()%>/fileDownload.do?fileDetNo=<%=atchFileVO.getFileDetNo()%>&fileNo=<%=rv.getFileNo()%>" class="rv_img">
								<%
									}
								%>
								</div>
								
								<!-- 평점 -->
								<%
									
								}
								%>
								<div class="rv_con"><%=rv.getRvContent()%></div>
								<%
									AccountVO accVO = (AccountVO) request.getSession().getAttribute("LOGIN_USER");
									pageContext.setAttribute("accNo", accVO.getAccNo());
								if (accVO.getAccNo() == rv.getAccNo()) {
								%>
								<div class="rv_con">
								<button class="upbtn mody">리뷰수정</button>
								<button class="upbtn delete" onclick="confirmDelete(<%=rv.getRvNo()%>, <%=prodList.getProdNo()%>)">리뷰삭제</button>
								<%
									}
								%>
							</div>
							
						</div>
						<div class="right_box">
								<div class="rv_con"><span class="rv_nt">작성자 ID :</span> <%=rv.getId()%></div>
								<div class="rv_con"><span class="rv_nt">피부타입 :</span> <%=rv.getSkType() %></div>
         					<div class="rv_con font_box"> 

									<button class="thumb" id="thumb-<%=rv.getRvNo()%>">
										<span><i class="fa-thin fa-circle-heart" style="color: #f84f81;"></i></span> 
										<span class="like-count-<%=rv.getRvNo()%>"><%=rv.getLikeCnt()%></span>
									</button>


								</div>
							</div>
					</div>

						<!-- 리뷰 수정하기  -->
						<form id="fuserform" action="review/update.do"
							method="post" onsubmit="return fuserform_submit(this);"
							class="mart20" encType="multipart/form-data">
							<div class="update_container" id="<%=rv.getRvNo()%>">

								<input type="hidden" name="rvNo" value="<%=rv.getRvNo()%>">
								<input type="hidden" name="fileNum" value="<%=rv.getFileNo()%>">

								<table class="wfull">
									<tr>
										<td class="tar">
											<input type="radio" name="rvRating"value="1"> 
											<img class="starimg" src="./imgSource/1.png" align="absmiddle"> 
											<input type="radio" name="rvRating" value="2"> 
											<img class="starimg" src="./imgSource/2.png" align="absmiddle"> 
											<input type="radio" name="rvRating" value="3"> 
											<img class="starimg" src="./imgSource/3.png" align="absmiddle">  
											<input type="radio" name="rvRating" value="4"> 
											<img class="starimg" src="./imgSource/4.png" align="absmiddle">  
											<input type="radio" name="rvRating" value="5"> 
											<img class="starimg" src="./imgSource/5.png" align="absmiddle"> 
										</td>
									</tr>
								</table>
								<div class="file">
									<span>신규 이미지</span> <input type="file" name="atchFile"
										class="rv_file" multiple>
									<button class="cancel">취소</button>
								</div>

								<table class="wfull mart10">
									<tr>
										<td><textarea name="rvContent" class="letter_bx"><%=rv.getRvContent()%></textarea></td>
										<td width="10"></td>
										<td width="78">
											<button class="btn_letter" type="submit" name="prodNo" value="<%=prodList.getProdNo()%>">
												리뷰<br>수정하기
											</button>
										</td>
									</tr>
								</table>

							</div>
						</form>
						<%
							}
						}
						%>



						<script>

						//tab이동 test
						let msg = "<%=msg%>";
						
						$(document).ready(function() {
							  $('ul.tabs li').click(function() {
							    let tab_id = $(this).attr('data-tab');

							    $('ul.tabs li').removeClass('current');
							    $('.tab-content').removeClass('current');

							    $(this).addClass('current');
							    $("#" + tab_id).addClass('current');
							  });

							  if(msg == "성공"){
							  $("#list02").trigger("click");
							  
							  }
							});
							
							
						/* if(msg == "성공"){
							$('.tabs li').eq(0).removeAttr('class','on current');
							$('.tabs li').eq(1).attr('class','on current');
							$('#tab-1').removeAttr('class','current');
							$('#tab-2').attr('class','current');
						} */

							
						
						
						//댓글수정 취소창
						
						$(".cancel").click(function(){
					        $(this).closest('.update_container').hide();
					        return false;
					    });
							//ajax로 리뷰 좋아요 1증가

							//thumb 클래스를 가진 요소를 선택
							let thumbBtn = $(".thumb");

							//thumb 요소에 대해 이벤트를 추가
							thumbBtn.on("click", function() {
								
								let rvNo = $(this).attr('id').replace('thumb-','');
								let likeCount = $('.like-count-'+rvNo).text();

								// AJAX 호출
								$.ajax({
									url : "likeIt.do", // 서버에서 처리할 URL
									type : "POST", // 또는 "GET", 요청 방식에 따라 변경
									data : {
										count : likeCount,
										rvNo : rvNo
									}, // 전송할 데이터
									success : function(data) {
										// 서버 응답이 성공하면
										if(data === 'SUCCESS'){
											likeCount++; // 클라이언트 측에서도 카운트 증가
											$('.like-count-'+rvNo).text(likeCount);											
										}else{
											likeCount--;
											$('.like-count-'+rvNo).text(likeCount);											
										}
									},
									error : function(error) {
										console.log("에러 발생:", error);
									}
								});
							});

							//전역 스코프에서 isLiked 변수를 선언
							let isLiked = false;

							// 모든 thumb 클래스를 가진 요소를 선택
							let thumbBtns = $(".thumb");

							// 각 thumb 요소에 대해 이벤트를 추가
							thumbBtns.on("click", function() {
								// 상태 변경
								isLiked = !isLiked;

								// 아이콘 및 배경색 변경
								updateLikeStatus($(this));
							});

							// 아이콘 및 배경색 변경 함수
							function updateLikeStatus(thumb) {
								// isLiked 값에 따라 클래스 추가 또는 제거
								thumb.toggleClass("thumbactive", isLiked);
							}

							//리뷰 수정 창 나오기
							$(".mody").click(function() {
							    // 현재 클릭된 버튼과 연결된 review_container의 아이디 가져오기
							    let reviewContainerId = $(this).closest(".review_container").attr("id");
							
							    // reviewContainerId와 같은 update_container 찾아서 display를 "block"으로 설정
							    $(".update_container").each(function() {
							        if ($(this).attr("id") === reviewContainerId) {
							            $(this).css("display", "block");
							        } else {
							            $(this).css("display", "none");
							        }
							    });
							});
							
							$(".cancel").click(function() {
							    // 클릭된 'cancel' 요소가 속한 부모 요소의 'update_container' 찾기
							    let updateContainer = $(this).closest(".update_container");
							
							    // 해당 'update_container'의 display를 'none'으로 설정
							    updateContainer.css("display", "none");
							});
							
							let rvRating = $('input[name="rvRating"]');
							
							function fuserform_submit(f) {
							    if (!f.rvContent.value) {
							        Swal.fire({
							        	icon : 'warning',
							        	title : '내용을 입력해주세요!'
							        })
							        f.rvContent.focus();
							        return false;
							    }
							    
							    let isChecked = false;
							    for (let i = 0; i < rvRating.length; i++) {
							        if (rvRating[i].checked) {
							            isChecked = true;
							            break;
							        }
							    }
							    
							    if (!isChecked) {
							        Swal.fire({
							            icon: 'warning',
							            title: '평점을 선택해주세요!'
							        });
							        return false;
							    }
							}

							function confirmDelete(rvNo, prodNo) {
							    if (confirm('리뷰를 삭제하시겠습니까?')) {
							        location.href = '<%=request.getContextPath()%>/review/delete.do?rvNo=' + rvNo + '&prodNo=' + prodNo;
							    }
							}
						
							
							function tguest() {
							    answer = confirm('로그인 하셔야 상품평 작성이 가능합니다. 로그인 하시겠습니까?');
							    if (answer == true) {
							        location.href = tb_bbs_url + "/login.php?url=%2Fshop%2Fview.php%3Findex_no%3D21";
							    }
							}
						</script>
					</div>
				</section>


				<script>
				
				$('ul.tabs li').click(function(e){
					e.preventDefault();
					let tab_id = $(this).attr('data-tab');

					$('ul.tabs li').removeClass('current');
					$('.tab-content').removeClass('current');

					$(this).addClass('current');
					$("#"+tab_id).addClass('current');
				})
				
				</script>
				<!-- <section class="mart50">
					<a name="tab3"></a>
					<div class="vi_tab">
						<ul>
							<li onclick="javascript:pg_anchor('tab1')">상품정보</li>
							<li onclick="javascript:pg_anchor('tab2')">상품평</li>
							<li onclick="javascript:pg_anchor('tab3')" class="on">상품문의</li>
							<li onclick="javascript:pg_anchor('tab4')">배송/교환/반품안내</li>
						</ul>
					</div>
					<div class="mart15 vi_qa">

						<a name="it_qa"></a>
						<form name="f_search" method="post">
							<table class="wfull marb5">
								<tr>
									<td class="tal">총 <b class="fc_red">0</b>개의 문의가 있습니다.
									</td>
									<td class="tar"><a
										href="http://demofran.com/shop/qaform.php?gs_id=21"
										onclick="win_open(this,'qaform','600','600','yes');return false"
										class="btn_lsmall grey">상품Q&A작성</a> <a
										href="http://demofran.com/bbs/qna_list.php" target="_blank"
										class="btn_lsmall grey">고객센터 문의하기</a></td>
								</tr>
							</table>
						</form>

						<div class="tbl_head01 tbl_wrap">
							<table>
								<colgroup>
									<col width="8%">
									<col width="14%">
									<col width="6%">
									<col width="2%">
									<col>
									<col width="12%">
									<col width="14%">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">문의유형</th>
										<th scope="col" colspan="3">문의/답변</th>
										<th scope="col">작성자</th>
										<th scope="col">작성일</th>
									</tr>
								</thead>
							</table>
							<div class="empty_list bb">문의 내역이 없습니다.</div>
						</div>


						<script>
							function js_qna(id) {
								var $con = $("#sod_qa_con_" + id);
								if ($con.is(":visible")) {
									$con.hide(200);
								} else {
									$(".sod_qa_con:visible").hide();
									$con.show(200);
								}
							}

							$(function() {
								$(".itemqa_delete")
										.click(
												function() {
													return confirm("정말 삭제 하시겠습니까?\n\n삭제후에는 되돌릴수 없습니다.");
												});
							});
						</script>
					</div>
				</section> -->

<!-- 				<section class="mart50">
					<a name="tab4"></a>
					<div class="vi_tab">
						<ul>
							<li onclick="javascript:pg_anchor('tab1')">상품정보</li>
							<li onclick="javascript:pg_anchor('tab2')">상품평</li>
							<li onclick="javascript:pg_anchor('tab3')">상품문의</li>
							<li onclick="javascript:pg_anchor('tab4')" class="on">배송/교환/반품안내</li>
						</ul>
					</div>
					<div class="mart15"></div>
				</section> -->
			</div>
			<%
				AccountVO accVO = (AccountVO) request.getAttribute("LOGIN_USER");
			%>
			<script src="js/toast.js"></script>
			<script>
			
			
				$(function(){
					
					let unitPrice = <%=prodList.getProdPrice()%>;
					
					
				    // 수량 증가 버튼 클릭 이벤트
				    $('.defbtn_plus').on('click', function(e) {
				      e.preventDefault();
				      var quantity = $('#qtyOpt').val();
				      quantity = parseInt(quantity) + 1;
				      $('#qtyOpt').val(quantity);
		
				      // 가격 업데이트
				      updatePrice(quantity);
				    });
		
				    // 수량 감소 버튼 클릭 이벤트
				    $('.defbtn_minus').on('click', function(e) {
				      e.preventDefault();
				      var quantity = $('#qtyOpt').val();
				      quantity = parseInt(quantity) - 1;
		
				      // 수량이 1 미만으로 내려가지 않도록 제한
				      if (quantity < 1) {
				        quantity = 1;
				      }
		
				      $('#qtyOpt').val(quantity);
		
				      // 가격 업데이트
				      updatePrice(quantity);
				    });
		
				    // 수량이 변경될 때 가격 업데이트 함수
				    function updatePrice(quantity) {
				      var totalPrice = unitPrice * quantity;
				      $('#sit_tot_price').text(totalPrice+' 원');
				    }
				});
			
				$('#orderProd').on('click', function(e) {
					e.preventDefault();
					let qty = $('#qtyOpt').val();
					location.href='<%=request.getContextPath()%>/orderProd.do?prodNo=${prodNo}&qty='+qty;
				});
				
				let wish = $('#addWish');
				wish.on('click', function(e) {
					e.preventDefault();
					
					$.ajax({
						url: '<%=request.getContextPath()%>/addWish.do',
						type: 'POST',
						data: {
							accNo : '${accNo}',
							prodNo : '${prodNo}'
						},
						success: function(rst) {
							if(rst === 'SUCCESS'){
								Toast.fire({
									icon: 'success',
									title: '해당 상품이 찜 목록에 추가되었습니다!'
								})
							}else{
								Toast.fire({
									icon: 'warning',
									title: '이미 찜 목록에 있는 상품입니다!'
								})
							}
						},
						error: function(xhr) {
							console.log(xhr.status);
						}
					});
					
				})
				
				let cart = $('#addCart');
				cart.on('click', function(e) {
					e.preventDefault();
					let qty = $('#qtyOpt').val();
					$.ajax({
						url: '<%=request.getContextPath()%>/cartInsert.do',
						type: 'GET',
						data: {
							prodNo : '${prodNo}',
							qty : qty
						},
						success: function(rst) {
							if(rst === 'SUCCESS'){
								Toast.fire({
									icon: 'success',
									title: '해당 상품이 카트에 추가되었습니다'
								})
							}else{
								Swal.fire({
									icon: 'question',
									title: '해당 상품이 이미 카트에 존재합니다 카트로 이동하시겠습니까?',
									showCancelButton: true,
									confirmButtonText: '예',
									cancelButtonText: '아니오'
								})	
								.then(result => {
									if(result.isConfirmed){
										location.href="cartList.do";
									}									
								});
							}
						},
						error: function(xhr) {
							console.log(xhr.status);
						}
					});
					
				})
	
		</script></div>
	</div>

	<jsp:include page="../layout/footer.jsp" />