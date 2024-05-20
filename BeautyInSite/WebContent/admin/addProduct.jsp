<jsp:include page="../admin/layout/header.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록</title>
</head>
<body>

	<div id="wrapper">

		<div id="snb">
		
			<div class="snb_header ico_config snb_header_1">
		<h2><i class="ionicons ion-clipboard"></i>주문 및 <br>상품관리</h2>
	</div>
			
			<dl>
				
				<dt class="o10 menu_toggle">주문관리</dt>		
		<dd class="o10"><a href="<%=request.getContextPath() %>/admin/orderlist.do">주문리스트(전체)</a></dd>				
		<dd class="o10"><a href="<%=request.getContextPath() %>/admin/shipdetail.do">배송관리</a></dd>
		<dd class="o30"><a href="<%=request.getContextPath() %>/admin/releaseList.do">출고 관리</a></dd>
		<dt class="o20 menu_toggle">상품 관리</dt>				
		<dd class="o20 active"><a href="<%=request.getContextPath() %>/prodWrite.do">상품 등록</a></dd>		
		<dd class="o20"><a href="<%=request.getContextPath() %>/prodList.do">상품 리스트(전체)</a></dd>		
			</dl>
		</div>

		<div id="content">
			<div class="breadcrumb">
				<span>HOME</span> <i class="ionicons ion-ios-arrow-right"></i> 상품관리
				<i class="ionicons ion-ios-arrow-right"></i> 신규 상품등록
			</div>

			<div class="s_wrap">
				<h1>신규 상품등록</h1>

				<script type="text/javascript"
					src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/jquery-ui.min.js"></script>
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
				<script src=admin/js/categoryform.js></script>


				<script src=admin/js/categoryform.js></script>
				<form name="fregform" method="post"
					action="prodWrite.do" enctype="multipart/form-data">

					<section id="anc_sitfrm_ini">
						<h2>기본정보</h2>
						<!-- <ul class="anchor">
							<li><a href="#anc_sitfrm_cate">카테고리</a></li>
							<li><a href="#anc_sitfrm_ini">기본정보</a></li>
							<li><a href="#anc_sitfrm_option">옵션정보</a></li>
							<li><a href="#anc_sitfrm_cost">가격 및 재고</a></li>
							<li><a href="#anc_sitfrm_pay">가맹점수수료</a></li>
							<li><a href="#anc_sitfrm_sendcost">배송비</a></li>
							<li><a href="#anc_sitfrm_compact">요약정보</a></li>
							<li><a href="#anc_sitfrm_relation">관련상품</a></li>
							<li><a href="#anc_sitfrm_img">상품이미지</a></li>
						</ul> -->

						<div class="tbl_frm02">
							<table>
								<colgroup>
									<col class="w180">
									<col>
								</colgroup>
								<tbody>

									<tr>
										<th scope="row">상품코드</th>

										<td><input type="text" name="prodNo" required
											itemname="상품코드" class="required frm_input"></td>
									</tr>
									<tr>
										<th scope="row">상품명</th>
										<td><input type="text" name="prodName" required
											itemname="상품명" class="required frm_input" size="80"></td>
									</tr>

									<tr>
										<th scope="row">상품브랜드번호</th>
										<td><input type="text" name="brNo" value=""
											class="required frm_input"></td>
									</tr>

									<tr>
										<th scope="row">짧은설명</th>
										<td><input type="text" name="prodContent" value=""
											class="frm_input" size="80"></td>
									</tr>


									<tr>
										<th scope="row">상품가격</th>
										<td><input type="text" name="prodPrice" value=""
											class="frm_input"></td>
									</tr>
									<tr>
										<th scope="row">상품카테고리번호</th>
										<td><input type="text" name="prodCateNo" value=""
											class="frm_input"></td>
									</tr>
										
									


								</tbody>
							</table>
						</div>

					</section>

					<!-- <div class="btn_confirm">
						<input type="submit" value="저장" class="btn_large" accesskey="s">
					</div> -->

					<!-- <section id="anc_sitfrm_cost">
						<h2>가격 및 재고</h2>
						<ul class="anchor">
							<li><a href="#anc_sitfrm_cate">카테고리</a></li>
							<li><a href="#anc_sitfrm_ini">기본정보</a></li>
							<li><a href="#anc_sitfrm_option">옵션정보</a></li>
							<li><a href="#anc_sitfrm_cost">가격 및 재고</a></li>
							<li><a href="#anc_sitfrm_pay">가맹점수수료</a></li>
							<li><a href="#anc_sitfrm_sendcost">배송비</a></li>
							<li><a href="#anc_sitfrm_compact">요약정보</a></li>
							<li><a href="#anc_sitfrm_relation">관련상품</a></li>
							<li><a href="#anc_sitfrm_img">상품이미지</a></li>
						</ul>
						<div class="tbl_frm02">
							<table>
								<colgroup>
									<col class="w180">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">시중가격</th>
										<td><input type="text" name="normal_price" value="0"
											class="frm_input w80" onkeyup="addComma(this);"> 원 <span
											class="fc_197 marl5">시중에 판매되는 가격 (판매가보다 크지않으면 시중가
												표시안함)</span></td>
									</tr>
									<tr>
										<th scope="row">공급가격</th>
										<td><input type="text" name="supply_price" value="0"
											class="frm_input w80" onkeyup="addComma(this);"> 원 <span
											class="fc_197 marl5">사입처에서 공급받은 가격</span></td>
									</tr>
									<tr>
										<th scope="row">판매가격</th>
										<td><input type="text" name="goods_price" value="0"
											class="frm_input w80" onkeyup="addComma(this);"> 원 <span
											class="fc_197 marl5">실제 판매가 입력 (대표가격으로 사용)</span></td>
									</tr>
									<tr>
										<th scope="row">포인트</th>
										<td><input type="text" name="gpoint" value="0"
											class="frm_input w80" onkeyup="addComma(this);"> P <input
											type="text" name="marper" class="frm_input w50"> %</td>
									</tr>
									<tr>
										<th scope="row">가격 대체문구</th>
										<td><input type="text" name="price_msg" value=""
											class="frm_input"> <span class="fc_197 marl5">가격대신
												보여질 문구를 노출할 때 입력, 주문불가</span></td>
									</tr>
									<tr>
										<th scope="row">수량</th>
										<td><input type="radio" name="stock_mod" value="0"
											id="ids_stock_mode1" checked="checked"
											onclick="chk_stock(0);"> <label for="ids_stock_mode1"
											class="marr10">무제한</label> <input type="radio"
											name="stock_mod" value="1" id="ids_stock_mode2"
											onclick="chk_stock(1);"> <label for="ids_stock_mode2">한정</label>
											<input type="text" name="stock_qty" value="0"
											class="frm_input w80" onkeyup="addComma(this);"> 개, <b
											class="marl10">재고 통보수량</b> <input type="text" name="noti_qty"
											value="999" class="frm_input w80" onkeyup="addComma(this);">
											개
											<p class="fc_197 mart7">
												상품의 재고가 통보수량보다 작을 때 상품 재고관리에 표시됩니다.<br>옵션이 있는 상품은 개별
												옵션의 통보수량이 적용됩니다. 설정이 무제한이면 재고관리에 표시되지 않습니다.
											</p></td>
									</tr>
									<tr>
										<th scope="row">주문한도</th>
										<td>최소 <input type="text" name="odr_min" value=""
											class="frm_input w80"> ~ 최대 <input type="text"
											name="odr_max" value="" class="frm_input w80"> <span
											class="fc_197 marl5">미입력시 무제한</span>
										</td>
									</tr>
									<tr>
										<th scope="row">판매기간 설정</th>
										<td><label for="sb_date" class="sound_only">시작일</label> <input
											type="text" name="sb_date" value="" id="sb_date"
											class="frm_input w80" maxlength="10"> ~ <label
											for="eb_date" class="sound_only">종료일</label> <input
											type="text" name="eb_date" value="" id="eb_date"
											class="frm_input w80" maxlength="10"> <a
											href="javascript:void(0);" class="btn_small is_reset">기간초기화</a>
											<div class="fc_197 mart7">
												설정된 기간 동안만 판매 가능하며, 설정된 종료일 이후에는 판매되지 않습니다.<br> 일시 판매중지
												처리하실 경우, 종료일을 현재날짜 이전의 과거 날짜를 넣어주시면 됩니다.
											</div> <script>
												$(function() {
													// 날짜 검색 : TODAY MAX값으로 인식 (maxDate: "+0d")를 삭제하면 MAX값 해제
													$("#sb_date,#eb_date")
															.datepicker(
																	{
																		changeMonth : true,
																		changeYear : true,
																		dateFormat : "yy-mm-dd",
																		showButtonPanel : true,
																		yearRange : "c-99:c+99"
																	});

													// 기간초기화
													$(document)
															.on(
																	"click",
																	".is_reset",
																	function() {
																		$(
																				"#sb_date, #eb_date")
																				.val(
																						"");
																	});
												});
											</script></td>
									</tr>
									<tr>
										<th scope="row">구매가능 레벨</th>
										<td><select id="buy_level" name="buy_level">
												<option value='10'>제한없음</option>
												<option value='9'>[9] 일반회원</option>
												<option value='8'>[8] 우수회원</option>
												<option value='7'>[7] 특별회원</option>
												<option value='6'>[6] 가맹점</option>
												<option value='5'>[5] 지점</option>
										</select> <label class="marl5"><input type="checkbox"
												name="buy_only" value="1"> 현재 레벨이상 가격공개</label></td>
									</tr>
								</tbody>
							</table>
						</div>
					</section> -->




					<!-- <div class="btn_confirm">
						<input type="submit" value="저장" class="btn_large" accesskey="s">
					</div> -->
					<!-- <section id="anc_sitfrm_sendcost">
						<h2>배송비</h2>
						<ul class="anchor">
							<li><a href="#anc_sitfrm_cate">카테고리</a></li>
							<li><a href="#anc_sitfrm_ini">기본정보</a></li>
							<li><a href="#anc_sitfrm_option">옵션정보</a></li>
							<li><a href="#anc_sitfrm_cost">가격 및 재고</a></li>
							<li><a href="#anc_sitfrm_pay">가맹점수수료</a></li>
							<li><a href="#anc_sitfrm_sendcost">배송비</a></li>
							<li><a href="#anc_sitfrm_compact">요약정보</a></li>
							<li><a href="#anc_sitfrm_relation">관련상품</a></li>
							<li><a href="#anc_sitfrm_img">상품이미지</a></li>
						</ul>
						<div class="local_desc02 local_desc">
							<p>
								※ <span>참고사항) : 고객이 동일 판매자의 상품을 복수 구매시 배송비는 단 한번만 부과 됩니다.
									단! 배송비는 가장 큰값을 산출하여 적용 됩니다.</span>
							</p>
							<p>
								※ <span>조건부무료배송) : 고객이 동일 판매자의 상품을 복수 구매시 가장 큰 값의 (조건
									배송비) 금액을 산출하여 최종배송비가 자동 적용 됩니다.</span>
							</p>
							<p>
								※ <span>유료배송) : 고객이 동일 판매자의 상품을 복수 구매시 가장 큰 값의 (기본 배송비)
									금액을 산출하여 최종배송비가 자동 적용 됩니다.</span>
							</p>
						</div>
						<div class="tbl_frm02">
							<table>
								<colgroup>
									<col class="w180">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">배송정보</th>
										<td><select name="sc_type"
											onChange="chk_sc_type(this.value);">
												<option value="0" selected="selected">공통설정</option>
												<option value="1">무료배송</option>
												<option value="2">조건부무료배송</option>
												<option value="3">유료배송</option>
										</select> <a href="./config.php?code=baesong" target="_blank"
											class="btn_small grey">설정</a>
											<div id="sc_method" class="mart7">
												배송비결제 <select name="sc_method" class="marl10">
													<option value="0" selected="selected">선불</option>
													<option value="1">착불</option>
													<option value="2">사용자선택</option>
												</select>
											</div>
											<div id="sc_amt" class="padt5">
												기본배송비 <input type="text" name="sc_amt" value="0"
													class="frm_input w80 marl10" onkeyup="addComma(this);">
												원 <label class="marl10"><input type="checkbox"
													name="sc_each_use" value="1"> 묶음배송불가</label>
											</div>
											<div id="sc_minimum" class="padt5">
												조건배송비 <input type="text" name="sc_minimum" value="0"
													class="frm_input w80 marl10" onkeyup="addComma(this);">
												원 이상이면 무료배송
											</div></td>
									</tr>
									<tr>
										<th scope="row">배송가능 지역</th>
										<td><select name="zone">
												<option value="전국" selected="selected">전국</option>
												<option value="강원도">강원도</option>
												<option value="경기도">경기도</option>
												<option value="경상도">경상도</option>
												<option value="서울/경기도">서울/경기도</option>
												<option value="서울특별시">서울특별시</option>
												<option value="전라도">전라도</option>
												<option value="제주도">제주도</option>
												<option value="충청도">충청도</option>
										</select></td>
									</tr>
									<tr>
										<th scope="row">추가설명</th>
										<td><input type="text" name="zone_msg" value=""
											class="frm_input" size="50" placeholder="예 : 제주 (도서지역 제외)"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</section> -->




					<!-- <div class="btn_confirm">
						<input type="submit" value="저장" class="btn_large" accesskey="s">
					</div> -->




					<section id="anc_sitfrm_img">
						<h2>상품이미지 및 상세정보</h2>
						<!-- <ul class="anchor">
							<li><a href="#anc_sitfrm_cate">카테고리</a></li>
							<li><a href="#anc_sitfrm_ini">기본정보</a></li>
							<li><a href="#anc_sitfrm_option">옵션정보</a></li>
							<li><a href="#anc_sitfrm_cost">가격 및 재고</a></li>
							<li><a href="#anc_sitfrm_pay">가맹점수수료</a></li>
							<li><a href="#anc_sitfrm_sendcost">배송비</a></li>
							<li><a href="#anc_sitfrm_compact">요약정보</a></li>
							<li><a href="#anc_sitfrm_relation">관련상품</a></li>
							<li><a href="#anc_sitfrm_img">상품이미지</a></li>
						</ul> -->
						<div class="tbl_frm02">
							<table>
								<colgroup>
									<col class="w180">
									<col>
								</colgroup>
								<tbody>
									<tr>
										
										
									</tr>
									<tr class="item_img_fld">
										<th scope="row">이미지1 <span class="fc_197">(400 *
												400)</span> <strong class="fc_red">[필수]</strong></th>
										<td>
											<div class="item_file_fld">
 												<input type="file" name="thumbFile">   
											</div>
											
										</td>
									</tr>
									<tr class="item_img_fld">
										<th scope="row">이미지2 <span class="fc_197">(400 *
												400)</span> <strong class="fc_red">[필수]</strong></th>
										<td>
											<div class="item_file_fld">
												<input type="file" name="atchFile">
											</div>
											
										</td>
									</tr>
									<tr class="item_img_fld">
										<th scope="row">이미지3 <span class="fc_197">(400 *
												400)</span></th>
										<td>
											<div class="item_file_fld">
												<input type="file" name="atchFile">
											</div>
											
										</td>
									</tr>
									<tr class="item_img_fld">
										<th scope="row">이미지4 <span class="fc_197">(400 *
												400)</span></th>
										<td>
											<div class="item_file_fld">
												<input type="file" name="atchFile">
											</div>
											
										</td>
									</tr>
									<tr class="item_img_fld">
										<th scope="row">이미지5 <span class="fc_197">(400 *
												400)</span></th>
										<td>
											<div class="item_file_fld">
												<input type="file" name="atchFile">
											</div>
											
										</td>
									</tr>
									<tr class="item_img_fld">
										<th scope="row">이미지6 <span class="fc_197">(400 *
												400)</span></th>
										<td>
											<div class="item_file_fld">
												<input type="file" name="atchFile">
											</div>
										
										</td>
									</tr>
									<tr>
										<th scope="row">상세설명</th>
										<td><span class="sound_only">웹에디터 시작</span> <script
												src="http://demofran.com/plugin/editor/smarteditor2/js/HuskyEZCreator.js"></script>
											<script>
												var tw_editor_url = "http://demofran.com/plugin/editor/smarteditor2", oEditors = [];
											</script> <script
												src="http://demofran.com/plugin/editor/smarteditor2/config.js"></script>
											<textarea id="memo" name="memo" class="smarteditor2"
												maxlength="65536" style="width: 100%"></textarea> <span
											class="sound_only">웹 에디터 끝</span></td>
									</tr>
									<tr>
										<th scope="row">관리자메모</th>
										<td><textarea name="admin_memo" class="frm_textbox"></textarea></td>
									</tr>
								</tbody>
							</table>
						</div>
					</section>

					<div class="btn_confirm">
						<input type="submit" value="저장" class="btn_large" accesskey="s">
					</div>
				</form>

				<script>
					function fregform_submit(f) {
						var multi_caid = new Array();
						var new_caid = "";

						$("select#sel_ca_id option").each(function() {
							new_caid = $(this).val();
							if (new_caid == "")
								return true;

							multi_caid.push(new_caid);
						});

						if (multi_caid.length > 0) {
							$("input[name=ca_id]").val(multi_caid[0]);
							$("input[name=ca_id2]").val(multi_caid[1]);
							$("input[name=ca_id3]").val(multi_caid[2]);
						}

						if (!f.ca_id.value) {
							alert("카테고리를 하나이상 선택하세요.");
							return false;
						}

						var sel_count = $("select#sel_ca_id option").size();
						if (sel_count > 3) {
							alert('카테고리는 최대 3개까지만 등록 가능합니다.');
							return false;
						}

						var item = new Array();
						var re_item = gs_id = "";

						$("#reg_relation input[name='re_gs_id[]']").each(
								function() {
									gs_id = $(this).val();
									if (gs_id == "")
										return true;

									item.push(gs_id);
								});

						if (item.length > 0)
							re_item = item.join();

						$("input[name=gs_list]").val(re_item);

						var memo_editor_data = oEditors.getById['memo'].getIR();
						oEditors.getById['memo'].exec('UPDATE_CONTENTS_FIELD',
								[]);
						if (jQuery.inArray(
								document.getElementById('memo').value
										.toLowerCase()
										.replace(/^\s*|\s*$/g, ''), [ '&nbsp;',
										'<p>&nbsp;</p>', '<p><br></p>',
										'<div><br></div>', '<p></p>', '<br>',
										'' ]) != -1) {
							document.getElementById('memo').value = '';
						}

						f.action = "./goods/goods_form_update.php";
						return true;
					}

					// 배송비 설정
					function chk_sc_type(type) {
						switch (type) {
						case "0": // 공통설정
							$("#sc_amt").hide();
							$("#sc_minimum").hide();
							$("#sc_method").show();
							$("input[name=sc_amt]").attr('disabled', true);
							$("input[name=sc_minimum]").attr('disabled', true);
							$("select[name=sc_method]").attr('disabled', false);
							break;
						case "1": // 무료배송
							$("#sc_amt").hide();
							$("#sc_minimum").hide();
							$("#sc_method").hide();
							$("input[name=sc_amt]").attr('disabled', true);
							$("input[name=sc_minimum]").attr('disabled', true);
							$("select[name=sc_method]").attr('disabled', true);
							break;
						case "2": // 조건부무료배송
							$("#sc_amt").show();
							$("#sc_minimum").show();
							$("#sc_method").show();
							$("input[name=sc_amt]").attr('disabled', false);
							$("input[name=sc_minimum]").attr('disabled', false);
							$("select[name=sc_method]").attr('disabled', false);
							break;
						case "3": // 유료배송
							$("#sc_amt").show();
							$("#sc_minimum").hide();
							$("#sc_method").show();
							$("input[name=sc_amt]").attr('disabled', false);
							$("input[name=sc_minimum]").attr('disabled', true);
							$("select[name=sc_method]").attr('disabled', false);
							break;
						}
					}

					// 이미지 등록방식
					function chk_simg_type(type) {
						if (type == 0) { // 직접업로드
							$(".item_file_fld").show();
							$(".item_url_fld").hide();
						} else { // URL 입력
							$(".item_img_fld").show();
							$(".item_file_fld").hide();
							$(".item_url_fld").show();
						}
					}

					// 재고수량 체크
					function chk_stock(type) {
						if (type == 0) {
							$("input[name=stock_qty]").attr('disabled', true);
							$("input[name=noti_qty]").attr('disabled', true);
						} else {
							$("input[name=stock_qty]").attr('disabled', false);
							$("input[name=noti_qty]").attr('disabled', false);
						}
					}

					// 수수료 적용
					function chk_ppay_type(type) {
						if (type == 0) {
							$("input[name=ppay_dan]").attr('disabled', true);
							$("select[name=ppay_rate]").attr('disabled', true);
							$("#chk_ppay_auto").text(
									"가맹점관리 > 가맹점 수수료정책 (기본설정 사용중)");
						} else {
							$("input[name=ppay_dan]").attr('disabled', false);
							$("select[name=ppay_rate]").attr('disabled', false);
							$("#chk_ppay_auto").text("수수료를 적용할 단계를 입력하세요");
						}
					}

					function chk_ppay_dan(no, index) {
						$.post(tb_admin_url + "/goods/goods_form_auto.php", {
							"no" : no,
							"index" : index
						}, function(data) {
							$("#chk_ppay_auto").empty().html(data);
						});
					}
				</script>

				<script>
					chk_sc_type("0");
					chk_simg_type("0");
					chk_stock("0");
					chk_ppay_type("0");
				</script>
</body>
</html>