<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.stream.Collector"%>
<%@page import="java.sql.Clob"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.Reader"%>
<%@page import="java.util.Map"%>
<%@page import="com.cosmetic.product.vo.ProdVO"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../admin/layout/header.jsp" />

<%
	//List<ProdVO> list = (List<ProdVO>) request.getAttribute("list");
List<Map<String, Object>> list = (List<Map<String, Object>>) request.getAttribute("prodList");

String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
session.removeAttribute("msg");
%>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div id="wrapper">

		<div id="snb">
			<div class="snb_header ico_config snb_header_1">
				<h2>
					<i class="ionicons ion-clipboard"></i>주문 및 <br>상품관리
				</h2>
			</div>
			<dl>
		<dt class="o10 menu_toggle">주문관리</dt>		
		<dd class="o10"><a href="<%=request.getContextPath() %>/admin/orderlist.do">주문리스트(전체)</a></dd>			
		<dd class="o10"><a href="<%=request.getContextPath() %>/admin/shipdetail.do">배송관리</a></dd>
		<dd class="o10 "><a href="<%=request.getContextPath() %>/admin/releaseList.do">출고관리</a></dd>
		<dt class="o20 menu_toggle">상품 관리</dt>				
		<dd class="o20"><a href="<%=request.getContextPath() %>/prodWrite.do">상품 등록</a></dd>		
		<dd class="o20 active"><a href="<%=request.getContextPath() %>/prodList.do">상품 리스트(전체)</a></dd>		
		</dl>
		</div>
		<div id="content">
			<div class="breadcrumb">
				<span>HOME</span> <i class="ionicons ion-ios-arrow-right"></i> 상품관리
				<i class="ionicons ion-ios-arrow-right"></i> 전체 상품관리
			</div>

			<div class="s_wrap">
				<h1>전체 상품관리</h1>


				<script>
					jQuery(function($) {
						$.datepicker.regional["ko"] = {
							closeText : "닫기",
							prevText : "이전달",
							nextText : "다음달",
							currentText : "오늘",
							monthNames : [ "1월(JAN)", "2월(FEB)", "3월(MAR)",
									"4월(APR)", "5월(MAY)", "6월(JUN)", "7월(JUL)",
									"8월(AUG)", "9월(SEP)", "10월(OCT)",
									"11월(NOV)", "12월(DEC)" ],
							monthNamesShort : [ "1월", "2월", "3월", "4월", "5월",
									"6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
							dayNames : [ "일", "월", "화", "수", "목", "금", "토" ],
							dayNamesShort : [ "일", "월", "화", "수", "목", "금", "토" ],
							dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
							weekHeader : "Wk",
							dateFormat : "yymmdd",
							firstDay : 0,
							isRTL : false,
							showMonthAfterYear : true,
							yearSuffix : ""
						};
						$.datepicker.setDefaults($.datepicker.regional["ko"]);
					});
				</script>
				<h2>기본검색</h2>
				<form name="fsearch" id="fsearch" method="get"
					action="<%=request.getContextPath()%>/prodSearchaAdmin.do">
					<input type="hidden" name="code" value="list">
					<div class="tbl_frm01">
						<table class="tablef">
							<colgroup>
								<col class="w100">
								<col>
								<col class="w100">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">검색어</th>
									<td><select name="cate">

											<option value="prod_name">상품명</option>
											<option value="br_no">브랜드번호</option>
											<option value="prod_cate_no">카테고리번호</option>
									</select> <input type="text" name="search" value="" class="frm_input"
										size="30"></td>


								</tr>
								<tr>


									<script>
										$(function() {
											$("#sel_ca1")
													.multi_select_box(
															"#sel_ca",
															5,
															tb_admin_url
																	+ "/ajax.category_select_json.php",
															"=카테고리선택=");
											$("#sel_ca2")
													.multi_select_box(
															"#sel_ca",
															5,
															tb_admin_url
																	+ "/ajax.category_select_json.php",
															"=카테고리선택=");
											$("#sel_ca3")
													.multi_select_box(
															"#sel_ca",
															5,
															tb_admin_url
																	+ "/ajax.category_select_json.php",
															"=카테고리선택=");
											$("#sel_ca4")
													.multi_select_box(
															"#sel_ca",
															5,
															tb_admin_url
																	+ "/ajax.category_select_json.php",
															"=카테고리선택=");
											$("#sel_ca5").multi_select_box(
													"#sel_ca", 5, "",
													"=카테고리선택=");
										});
									</script>
							</tbody>
						</table>
					</div>
					<div class="btn_confirm">
						<input type="submit" value="검색" class="btn_medium">
					</div>
				</form>


				<form name="fgoodslist" id="fgoodslist" method="post"
					action="<%=request.getContextPath()%>/prodDelete.do"
					onsubmit="return fgoodslist_submit(this);">
					<input type="hidden" name="q1" value="code=list"> <input
						type="hidden" name="page" value="1">

					<div class="local_ov mart30">
						전체 : <b class="fc_red">13</b> 건 조회 <span class="ov_a"> <!-- <select
							id="page_rows"
							onchange="location='/admin/goods.php?code=list&page=1&page_rows='+this.value;">
								<option value="30" selected="selected">30줄 정렬</option>
								<option value="50">50줄 정렬</option>
								<option value="100">100줄 정렬</option>
								<option value="150">150줄 정렬</option>
						</select> -->
						</span>
					</div>
					<div class="local_frm01">
						<input type="submit" name="act_button" value="선택삭제"
							class="btn_lsmall bx-white" onclick="document.pressed=this.value">


						<a href="prodWrite.do" class="fr btn_lsmall red"><i
							class="ionicons ion-android-add"></i> 상품등록</a>
					</div>

					<div class="tbl_head02">


						<table id="sodr_list" class="tablef">
							<colgroup>
								<col class="w50">
								<col class="w50">
								<col class="w60">
								<col class="w120">
								<col class="w50">
								<col class="w200">
								<col class="w80">
								<col class="w80">
								<col class="w100">
								<col class="w90">

							</colgroup>



							<thead>


								<tr>
									<th scope="col" rowspan="2"><input type="checkbox"
										id="chkAll" name="chkall" value="1"
										onclick="check_all(this.form);"></th>
									<th scope="col" rowspan="2">상품코드</th>
									<th scope="col" rowspan="2">이미지</th>
									<th scope="col" rowspan="2">상품명</th>
									<th scope="col" rowspan="2">브랜드번호</th>
									<th scope="col" rowspan="2">짧은 설명</th>
									<th scope="col" rowspan="2">상품가격</th>
									<th scope="col" rowspan="2">카테고리번호</th>
									<th scope="col" rowspan="2">등록날짜</th>
									<th scope="col" rowspan="2">관리</th>

								</tr>


							</thead>



							<%
								if (list.size() == 0) {
							%>
							<tr>
								<td colspan="5">검색결과가 없습니다.</td>
							</tr>

							<%
								} else {

							for (Map<String, Object> pv : list) {

								if (pv != null) {
									Reader reader;
									BufferedReader br;
									String result = "";
									if (pv.get("PROD_IMG") != null) {
								Clob clob = (Clob) pv.get("PROD_IMG");
								reader = clob.getCharacterStream();
								br = new BufferedReader(reader);
								result = br.lines().collect(Collectors.joining());
									}
							%>







							<tbody id="productTable">

								<tr class="list0">
									<td rowspan="2"><input type="hidden" name="gs_id[0]"
										value="21"> <input type="checkbox" name="delchk"
										class="chkGrp" value="<%=pv.get("PROD_NO")%>"></td>
									<td rowspan="2" class="prodNo"><div>
											<a href="prodUpdate.do?prodNo=<%=pv.get("PROD_NO")%>"><%=pv.get("PROD_NO")%></a>
										</div></td>
									<td rowspan="2"><a
										href="prodDetail.do?prodNo=<%=pv.get("PROD_NO")%>"> <img
											src="<%=result%>" width="40" height="40"></a></td>
									<td rowspan="2" class="prodName"><div><%=pv.get("PROD_NAME")%></div></td>
									<td rowspan="2" class="brNo"><div><%=pv.get("BR_NO")%></div>
									</td>
									<td rowspan="2" class="prodContent"><div><%=pv.get("PROD_CONTENT")%></div></td>
									<td rowspan="2" class="prodPrice"><div><%=pv.get("PROD_PRICE")%></div></td>
									<td rowspan="2" class="prodCateNo"><div><%=pv.get("PROD_CATE_NO")%></div></td>
									<td rowspan="2" class="prodDate"><div><%=pv.get("PROD_DATE")%></div></td>
									<td rowspan="2"><a
										href="prodUpdate.do?prodNo=<%=pv.get("PROD_NO")%>"
										class="btn_small">수정</a></td>
								</tr>

							</tbody>

							<%
								}
							}
							}
							%>

						</table>

					</div>

					<div class="local_frm02">
						<!-- 						<input type="submit" name="btn" value="선택삭제" -->
						<!-- 							class="btn_lsmall bx-white" onclick="document.pressed=this.value"> -->





						<a href="prodWrite.do" class="fr btn_lsmall red"><i
							class="ionicons ion-android-add"></i> 상품등록</a>


					</div>




					<%
						if (request.getAttribute("sPage") != null) {
					%>
					<!-- 페이징 영역 start -->
					<div id="pageArea">

						<ul class="pager">
							<li class="prev"><a href="#"><i
									class="fa-regular fa-angles-left"></i></a></li>
						</ul>

						<ul class="pagination pager">
							<%
								int sPage = (int) request.getAttribute("sPage");
							int ePage = (int) request.getAttribute("ePage");
							int cPage = (int) request.getAttribute("cPage");

							for (int i = sPage; i <= ePage; i++) {
								//페이지번호 활성화 처리
								if (cPage == i) {
							%>
							<li class="active"><a href="#"><%=i%></a></li>
							<%
								} else {
							%>
							<li><a href="#"><%=i%></a></li>
							<%
								}
							} //for end
							%>
						</ul>

						<ul class="pager">
							<li class="next"><a href="#"><i
									class="fa-regular fa-angles-right"></i></a></li>
						</ul>
					</div>
					<!-- 페이징 영역 end -->
					<%
						}
					%>
					<script>
						$('.pagination li')
								.on(
										'click',
										function() {
											// 		alert( $(this).text() );
											location.href = "prodList.do?page="
													+ $(this).text();
										});

						$('.next')
								.on(
										'click',
										function() {
											currentPage = parseInt($(
													'.pagination').children()
													.last().text()) + 1;

											//현재 페이지가 totalPage보다 클때 페이지정보를 넘기지 않음
											if (
					<%=request.getAttribute("ttPage")%>
						< currentPage)
												return;
											location.href = "prodList.do?page="
													+ currentPage;
										});

						$('.prev')
								.on(
										'click',
										function() {

											currentPage = parseInt($(
													'.pagination').children()
													.first().text()) - 1;
											//현재페이지가 0보다 작거나 같을 때
											if (currentPage <= 0)
												return;
											location.href = "prodList.do?page="
													+ currentPage;
										});
					</script>









				</form>



				<script>
					function fgoodslist_submit(f) {
						if (!is_checked("chk[]")) {
							alert(document.pressed + " 하실 항목을 하나 이상 선택하세요.");
							return false;
						}

						if (document.pressed == "선택삭제") {
							if (!confirm("선택한 자료를 정말 삭제하시겠습니까?")) {
								return false;
							}
						}

						return true;
					}
					$(function() {
						$("#chkAll").click(function() {
							$(".chkGrp").attr("checked", this.checked);

						});

					});

					function 삭제함수() {

						let groupList = "";

						$(".chkGrp:checked").each(function(idx, item) {
							if (idx == 0) {
								groupList += item.value;
							} else {
								groupList += "," + item.value;
							}

						});
					}

					$(function() {
						// 날짜 검색 : TODAY MAX값으로 인식 (maxDate: "+0d")를 삭제하면 MAX값 해제
						$("#fr_date,#to_date").datepicker({
							changeMonth : true,
							changeYear : true,
							dateFormat : "yy-mm-dd",
							showButtonPanel : true,
							yearRange : "c-99:c+99",
							maxDate : "+0d"
						});
					});
				</script>

			</div>

		</div>
	</div>

	<jsp:include page="../admin/layout/footer.jsp" />