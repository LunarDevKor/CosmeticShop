<%@page import="com.cosmetic.product.service.IProdService"%>
<%@page import="com.cosmetic.common.service.AtchFileServiceImpl"%>
<%@page import="com.cosmetic.common.service.IAtachFileService"%>
<%@page import="com.cosmetic.common.vo.AtchFileDetailVO"%>
<%@page import="java.util.List"%>
<%@page import="com.cosmetic.product.vo.ProdVO"%>
<jsp:include page="../admin/layout/header.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	ProdVO pv = (ProdVO) request.getAttribute("pv");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품수정</title>
</head>
<body>

	<div id="wrapper">

		<div id="snb">
			<div class="snb_header ico_config">
				<h2>
					<i class="ionicons ion-bag"></i>상품관리
				</h2>
			</div>
			<dl>
				<dt class="g10 menu_toggle">상품관리</dt>
				<dd class="g10">
					<a href="http://demofran.com/admin/goods.php?code=list">전체 상품관리</a>
				</dd>
				<dd class="g10">
					<a href="http://demofran.com/admin/goods.php?code=supply">공급사
						대기상품<em>0</em>
					</a>
				</dd>
				<dd class="g10">
					<a href="http://demofran.com/admin/goods.php?code=supply2">공급사
						보류상품<em>0</em>
					</a>
				</dd>
				<dd class="g10">
					<a href="http://demofran.com/admin/goods.php?code=userlist">가맹점
						상품관리</a>
				</dd>
				<dd class="g10">
					<a href="http://demofran.com/admin/goods.php?code=type">상품 진열관리</a>
				</dd>
				<dd class="g10">
					<a href="http://demofran.com/admin/goods.php?code=brand_list">브랜드
						관리</a>
				</dd>
				<dd class="g10">
					<a href="http://demofran.com/admin/goods.php?code=plan">기획전 관리</a>
				</dd>
				<dt class="g20 menu_toggle">재고관리</dt>
				<dd class="g20">
					<a href="http://demofran.com/admin/goods.php?code=stock">상품
						재고관리<em>0</em>
					</a>
				</dd>
				<dd class="g20">
					<a href="http://demofran.com/admin/goods.php?code=optstock">상품
						옵션재고관리<em>0</em>
					</a>
				</dd>
				<dt class="g30 menu_toggle">일괄처리</dt>
				<dd class="g30">
					<a href="http://demofran.com/admin/goods.php?code=xls_reg">상품
						엑셀일괄등록</a>
				</dd>
				<dd class="g30">
					<a href="http://demofran.com/admin/goods.php?code=xls_option_reg">옵션
						엑셀일괄등록</a>
				</dd>
				<dd class="g30">
					<a href="http://demofran.com/admin/goods.php?code=xls_mod">상품
						엑셀일괄수정</a>
				</dd>
				<dd class="g30">
					<a href="http://demofran.com/admin/goods.php?code=getprice">빠른
						판매가격 수정</a>f
				</dd>
				<dd class="g30">
					<a href="http://demofran.com/admin/goods.php?code=getpoint">빠른
						적립포인트 수정</a>
				</dd>
				<dd class="g30">
					<a href="http://demofran.com/admin/goods.php?code=getuse">빠른
						판매여부 수정</a>
				</dd>
				<dd class="g30">
					<a href="http://demofran.com/admin/goods.php?code=getmove">빠른
						상품이동 수정</a>
				</dd>
				<dd class="g30">
					<a href="http://demofran.com/admin/goods.php?code=getbrand">빠른
						브랜드 수정</a>
				</dd>
				<dd class="g30">
					<a href="http://demofran.com/admin/goods.php?code=getdelivery">빠른
						배송비 수정</a>
				</dd>
				<dd class="g30">
					<a href="http://demofran.com/admin/goods.php?code=getbuylevel">빠른
						구매가능레벨 수정</a>
				</dd>
				<dt class="g40 menu_toggle">문의 / 후기</dt>
				<dd class="g40">
					<a href="http://demofran.com/admin/goods.php?code=qa">상품 문의관리<em>0</em></a>
				</dd>
				<dd class="g40">
					<a href="http://demofran.com/admin/goods.php?code=review">상품
						후기관리</a>
				</dd>
				<dt class="g50 menu_toggle">쿠폰관리</dt>
				<dd class="g50">
					<a href="http://demofran.com/admin/goods.php?code=gift">쿠폰관리
						(인쇄용)</a>
				</dd>
				<dd class="g50">
					<a href="http://demofran.com/admin/goods.php?code=coupon">쿠폰관리
						(온라인)</a>
				</dd>
				<dt class="g60 menu_toggle">기타관리</dt>
				<dd class="g60">
					<a href="http://demofran.com/admin/goods.php?code=price">가격비교사이트
						연동</a>
				</dd>
				<dd class="g60">
					<a href="http://demofran.com/admin/goods.php?code=popular_list">상품
						검색어관리</a>
				</dd>
				<dd class="g60">
					<a href="http://demofran.com/admin/goods.php?code=popular_rank">상품
						검색어순위</a>
				</dd>
			</dl>
		</div>

		<div id="content">
			<div class="breadcrumb">
				<span>HOME</span> <i class="ionicons ion-ios-arrow-right"></i> 상품관리
				<i class="ionicons ion-ios-arrow-right"></i> 상품수정
			</div>

			<div class="s_wrap">
				<h1>상품수정</h1>

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
					action="prodUpdate.do" enctype="multipart/form-data">


					<section id="anc_sitfrm_ini">
						<h2>기본정보</h2>


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
											itemname="상품코드" class="required frm_input"
											value="<%=pv.getProdNo()%>"></td>
									</tr>
									<tr>
										<th scope="row">상품명</th>
										<td><input type="text" name="prodName" required
											itemname="상품명" class="required frm_input" size="80"
											value="<%=pv.getProdName()%>"></td>
									</tr>
									<tr>
										<th scope="row">상품브랜드번호</th>
										<td><input type="text" name="brNo"
											value="<%=pv.getBrNo()%>" class="required frm_input"></td>
									</tr>
									<tr>
										<th scope="row">짧은설명</th>
										<td><input type="text" name="prodContent"
											value="<%=pv.getProdContent()%>" class="frm_input" size="80"></td>
									</tr>
									<tr>
										<th scope="row">상품가격</th>
										<td><input type="text" name="prodPrice"
											value="<%=pv.getProdPrice()%>" class="frm_input"></td>
									</tr>
									<tr>
										<th scope="row">상품카테고리번호</th>
										<td><input type="text" name="prodCateNo"
											value="<%=pv.getProdCateNo()%>" class="frm_input"></td>
									</tr>





								</tbody>
							</table>
							<div class="btn_confirm">
								<input type="submit" value="수정" class="btn_large" accesskey="s">


							</div>




						</div>

					</section>



					<section id="anc_sitfrm_cost">


						<div class="tbl_frm02">
							<table>
								<colgroup>
									<col class="w180">
									<col>
								</colgroup>
								<tbody>




									<tr>


										<script>
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
										</script>
										</td>
									</tr>

								</tbody>
							</table>
						</div>
					</section>






					</tbody>
					</table>
			</div>
			</section>








			<section id="anc_sitfrm_img">
				<h2>상품이미지 및 상세정보</h2>

				<div class="tbl_frm02">
					<table>
						<colgroup>
							<col class="w180">
							<col>
						</colgroup>
						<tbody>

							<tr class="item_img_fld">
								<th scope="row">이미지1 <span class="fc_197">(400 *
										400)</span> <strong class="fc_red">[필수]</strong></th>
								<td>
									<div class="item_file_fld">
										<input type="file" name="atchFile" value="">
								</td>
							</tr>
							<tr class="item_img_fld">
								<th scope="row">이미지2 <span class="fc_197">(400 *
										400)</span> <strong class="fc_red">[필수]</strong></th>
								<td>
									<div class="item_file_fld">
										<input type="file" name="atchFile" value="">
									</div>

								</td>
							</tr>
							<tr class="item_img_fld">
								<th scope="row">이미지3 <span class="fc_197">(400 *
										400)</span></th>
								<td>
									<div class="item_file_fld">
										<input type="file" name="atchFile" value="">
									</div>

								</td>
							</tr>
							<tr class="item_img_fld">
								<th scope="row">이미지4 <span class="fc_197">(400 *
										400)</span></th>
								<td>
									<div class="item_file_fld">
										<input type="file" name="atchFile" value="">
									</div>

								</td>
							</tr>
							<tr class="item_img_fld">
								<th scope="row">이미지5 <span class="fc_197">(400 *
										400)</span></th>
								<td>
									<div class="item_file_fld">
										<input type="file" name="atchFile" value="">
									</div>

								</td>
							</tr>
							<tr class="item_img_fld">
								<th scope="row">이미지6 <span class="fc_197">(400 *
										400)</span></th>
								<td>
									<div class="item_file_fld">
										<input type="file" name="atchFile" value="">
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
				<input type="submit" value="수정" class="btn_large" accesskey="s">
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
					oEditors.getById['memo'].exec('UPDATE_CONTENTS_FIELD', []);
					if (jQuery.inArray(document.getElementById('memo').value
							.toLowerCase().replace(/^\s*|\s*$/g, ''), [
							'&nbsp;', '<p>&nbsp;</p>', '<p><br></p>',
							'<div><br></div>', '<p></p>', '<br>', '' ]) != -1) {
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
						$("#chk_ppay_auto")
								.text("가맹점관리 > 가맹점 수수료정책 (기본설정 사용중)");
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