<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="./layout/header.jsp"></jsp:include>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<div id="wrapper">
	
<div id="snb">
	<div class="snb_header ico_config">
		<h2><i class="fa fa-bar-chart"></i>통계분석</h2>
	</div>
		<dl>
		<dt class="v10 menu_toggle">접속자통계</dt>		<dd class="v10 active"><a href="http://demofran.com/admin/visit.php?code=hour">시간별 접속통계</a></dd>		<dd class="v10"><a href="http://demofran.com/admin/visit.php?code=date">일별 접속통계</a></dd>		<dd class="v10"><a href="http://demofran.com/admin/visit.php?code=week">요일별 접속통계</a></dd>		<dd class="v10"><a href="http://demofran.com/admin/visit.php?code=month">월별 접속통계</a></dd>		<dd class="v10"><a href="http://demofran.com/admin/visit.php?code=year">연도별 접속통계</a></dd>		<dd class="v10"><a href="http://demofran.com/admin/visit.php?code=browser">브라우저별 접속통계</a></dd>		<dd class="v10"><a href="http://demofran.com/admin/visit.php?code=os">OS별 통계분석</a></dd>		<dd class="v10"><a href="http://demofran.com/admin/visit.php?code=domain">도메인별 접속통계</a></dd>		<dd class="v10"><a href="http://demofran.com/admin/visit.php?code=search">접속자검색</a></dd>		<dt class="v20 menu_toggle">주문통계</dt>		<dd class="v20"><a href="http://demofran.com/admin/visit.php?code=order1">일별 주문통계</a></dd>		<dd class="v20"><a href="http://demofran.com/admin/visit.php?code=order2">월별 주문통계</a></dd>		<dd class="v20"><a href="http://demofran.com/admin/visit.php?code=cancel">일별 취소통계</a></dd>		<dd class="v20"><a href="http://demofran.com/admin/visit.php?code=return">일별 반품통계</a></dd>		<dd class="v20"><a href="http://demofran.com/admin/visit.php?code=change">일별 교환통계</a></dd>		<dd class="v20"><a href="http://demofran.com/admin/visit.php?code=refund">일별 환불통계</a></dd>	</dl>
	</div>
	<div id="content">
		<div class="breadcrumb">
			<span>HOME</span> <i class="ionicons ion-ios-arrow-right"></i> 통계분석 <i class="ionicons ion-ios-arrow-right"></i> 시간별 접속통계		</div>
	
<div class="s_wrap">
	<h1>시간별 접속통계</h1>
	
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/jquery-ui.min.js"></script>
<script>
jQuery(function($){
    $.datepicker.regional["ko"] = {
        closeText: "닫기",
        prevText: "이전달",
        nextText: "다음달",
        currentText: "오늘",
        monthNames: ["1월(JAN)","2월(FEB)","3월(MAR)","4월(APR)","5월(MAY)","6월(JUN)", "7월(JUL)","8월(AUG)","9월(SEP)","10월(OCT)","11월(NOV)","12월(DEC)"],
        monthNamesShort: ["1월","2월","3월","4월","5월","6월", "7월","8월","9월","10월","11월","12월"],
        dayNames: ["일","월","화","수","목","금","토"],
        dayNamesShort: ["일","월","화","수","목","금","토"],
        dayNamesMin: ["일","월","화","수","목","금","토"],
        weekHeader: "Wk",
        dateFormat: "yymmdd",
        firstDay: 0,
        isRTL: false,
        showMonthAfterYear: true,
        yearSuffix: ""
    };
	$.datepicker.setDefaults($.datepicker.regional["ko"]);
});
</script>
<h2>통계검색</h2>
<form name="fsearch" id="fsearch" method="get">
<input type="hidden" name="code" value="hour">
<div class="tbl_frm01">
	<table>
	<colgroup>
		<col class="w100">
		<col>
	</colgroup>
	<tbody>
	<tr>
		<th scope="row">기간검색</th>
		<td>
			<label for="fr_date" class="sound_only">시작일</label>
<input type="text" name="fr_date" value="2024-01-08" id="fr_date" class="frm_input w80" maxlength="10">
 ~ 
<label for="to_date" class="sound_only">종료일</label>
<input type="text" name="to_date" value="2024-01-08" id="to_date" class="frm_input w80" maxlength="10">
<span class="btn_group"><input type="button" onclick="search_date('fr_date','to_date',this.value);" class="btn_small white" value="오늘"><input type="button" onclick="search_date('fr_date','to_date',this.value);" class="btn_small white" value="어제"><input type="button" onclick="search_date('fr_date','to_date',this.value);" class="btn_small white" value="일주일"><input type="button" onclick="search_date('fr_date','to_date',this.value);" class="btn_small white" value="지난달"><input type="button" onclick="search_date('fr_date','to_date',this.value);" class="btn_small white" value="1개월"><input type="button" onclick="search_date('fr_date','to_date',this.value);" class="btn_small white" value="3개월"></span>		</td>
	</tr>
	</tbody>
	</table>
</div>
<div class="btn_confirm">
	<input type="submit" value="검색" class="btn_medium">
</div>
</form>

<script>
$(function(){
	// 날짜 검색 : TODAY MAX값으로 인식 (maxDate: "+0d")를 삭제하면 MAX값 해제
	$("#fr_date,#to_date").datepicker({ changeMonth: true, changeYear: true, dateFormat: "yy-mm-dd", showButtonPanel: true, yearRange: "c-99:c+99", maxDate: "+0d" });
});
</script>

<div class="local_ov mart30">
	총 접속자수 : <b class="fc_red">24</b>건 접속
</div>

<div class="tbl_head01">
	<table>
	<colgroup>
		<col class="w60">	
		<col>
		<col class="w80">
		<col class="w80">
	</colgroup>
	<thead>
	<tr>
		<th scope="col">시간</th>
		<th scope="col">그래프</th>
		<th scope="col">접속자수</th>
		<th scope="col">비율(%)</th>
	</tr>
	</thead>
	<tfoot>
	<tr>
		<td colspan="2"><strong>합계</strong></td>
		<td><strong>24</strong></td>
		<td><strong>100</strong></td>
	</tr>
	</tfoot>
	<tbody class="list">
		<tr class="list0">
		<td>00</td>
		<td class="tal">
			<div class="graph">
				<span class="bar" style="width:16.7%"></span>
			</div>
		</td>
		<td>4</td>
		<td>16.7</td>
	</tr>
		<tr class="list1">
		<td>01</td>
		<td class="tal">
			<div class="graph">
				<span class="bar" style="width:12.5%"></span>
			</div>
		</td>
		<td>3</td>
		<td>12.5</td>
	</tr>
		<tr class="list0">
		<td>02</td>
		<td class="tal">
			<div class="graph">
				<span class="bar" style="width:16.7%"></span>
			</div>
		</td>
		<td>4</td>
		<td>16.7</td>
	</tr>
		<tr class="list1">
		<td>03</td>
		<td class="tal">
			<div class="graph">
				<span class="bar" style="width:20.8%"></span>
			</div>
		</td>
		<td>5</td>
		<td>20.8</td>
	</tr>
		<tr class="list0">
		<td>04</td>
		<td class="tal">
			<div class="graph">
				<span class="bar" style="width:0.0%"></span>
			</div>
		</td>
		<td>0</td>
		<td>0.0</td>
	</tr>
		<tr class="list1">
		<td>05</td>
		<td class="tal">
			<div class="graph">
				<span class="bar" style="width:4.2%"></span>
			</div>
		</td>
		<td>1</td>
		<td>4.2</td>
	</tr>
		<tr class="list0">
		<td>06</td>
		<td class="tal">
			<div class="graph">
				<span class="bar" style="width:4.2%"></span>
			</div>
		</td>
		<td>1</td>
		<td>4.2</td>
	</tr>
		<tr class="list1">
		<td>07</td>
		<td class="tal">
			<div class="graph">
				<span class="bar" style="width:8.3%"></span>
			</div>
		</td>
		<td>2</td>
		<td>8.3</td>
	</tr>
		<tr class="list0">
		<td>08</td>
		<td class="tal">
			<div class="graph">
				<span class="bar" style="width:16.7%"></span>
			</div>
		</td>
		<td>4</td>
		<td>16.7</td>
	</tr>
		<tr class="list1">
		<td>09</td>
		<td class="tal">
			<div class="graph">
				<span class="bar" style="width:0.0%"></span>
			</div>
		</td>
		<td>0</td>
		<td>0.0</td>
	</tr>
		<tr class="list0">
		<td>10</td>
		<td class="tal">
			<div class="graph">
				<span class="bar" style="width:0.0%"></span>
			</div>
		</td>
		<td>0</td>
		<td>0.0</td>
	</tr>
		<tr class="list1">
		<td>11</td>
		<td class="tal">
			<div class="graph">
				<span class="bar" style="width:0.0%"></span>
			</div>
		</td>
		<td>0</td>
		<td>0.0</td>
	</tr>
		<tr class="list0">
		<td>12</td>
		<td class="tal">
			<div class="graph">
				<span class="bar" style="width:0.0%"></span>
			</div>
		</td>
		<td>0</td>
		<td>0.0</td>
	</tr>
		<tr class="list1">
		<td>13</td>
		<td class="tal">
			<div class="graph">
				<span class="bar" style="width:0.0%"></span>
			</div>
		</td>
		<td>0</td>
		<td>0.0</td>
	</tr>
		<tr class="list0">
		<td>14</td>
		<td class="tal">
			<div class="graph">
				<span class="bar" style="width:0.0%"></span>
			</div>
		</td>
		<td>0</td>
		<td>0.0</td>
	</tr>
		<tr class="list1">
		<td>15</td>
		<td class="tal">
			<div class="graph">
				<span class="bar" style="width:0.0%"></span>
			</div>
		</td>
		<td>0</td>
		<td>0.0</td>
	</tr>
		<tr class="list0">
		<td>16</td>
		<td class="tal">
			<div class="graph">
				<span class="bar" style="width:0.0%"></span>
			</div>
		</td>
		<td>0</td>
		<td>0.0</td>
	</tr>
		<tr class="list1">
		<td>17</td>
		<td class="tal">
			<div class="graph">
				<span class="bar" style="width:0.0%"></span>
			</div>
		</td>
		<td>0</td>
		<td>0.0</td>
	</tr>
		<tr class="list0">
		<td>18</td>
		<td class="tal">
			<div class="graph">
				<span class="bar" style="width:0.0%"></span>
			</div>
		</td>
		<td>0</td>
		<td>0.0</td>
	</tr>
		<tr class="list1">
		<td>19</td>
		<td class="tal">
			<div class="graph">
				<span class="bar" style="width:0.0%"></span>
			</div>
		</td>
		<td>0</td>
		<td>0.0</td>
	</tr>
		<tr class="list0">
		<td>20</td>
		<td class="tal">
			<div class="graph">
				<span class="bar" style="width:0.0%"></span>
			</div>
		</td>
		<td>0</td>
		<td>0.0</td>
	</tr>
		<tr class="list1">
		<td>21</td>
		<td class="tal">
			<div class="graph">
				<span class="bar" style="width:0.0%"></span>
			</div>
		</td>
		<td>0</td>
		<td>0.0</td>
	</tr>
		<tr class="list0">
		<td>22</td>
		<td class="tal">
			<div class="graph">
				<span class="bar" style="width:0.0%"></span>
			</div>
		</td>
		<td>0</td>
		<td>0.0</td>
	</tr>
		<tr class="list1">
		<td>23</td>
		<td class="tal">
			<div class="graph">
				<span class="bar" style="width:0.0%"></span>
			</div>
		</td>
		<td>0</td>
		<td>0.0</td>
	</tr>
		</tbody>
	</table>
</div>
</div>

</div>
</div>

<jsp:include page="./layout/footer.jsp"></jsp:include>