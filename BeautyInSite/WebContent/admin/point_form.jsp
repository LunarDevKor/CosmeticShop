<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../admin/layout/header.jsp"></jsp:include>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="wrapper">
	
<div id="snb">
	<div class="snb_header ico_config">
		<h2><i class="ionicons ion-ios-people fs40"></i>회원관리</h2>
	</div>
		<dl>
		<dt class="m10 menu_toggle">회원관리</dt>		<dd class="m10"><a href="http://demofran.com/admin/member.php?code=list">회원 정보관리</a></dd>		<dd class="m10"><a href="http://demofran.com/admin/member.php?code=level_form">회원 레벨관리</a></dd>		<dd class="m10"><a href="http://demofran.com/admin/member.php?code=register_form">회원 등록하기</a></dd>		<dd class="m10"><a href="http://demofran.com/admin/member.php?code=xls">회원 엑셀일괄등록</a></dd>		<dd class="m10"><a href="http://demofran.com/admin/member.php?code=mail_list">회원 일괄메일발송</a></dd>		<dt class="m20 menu_toggle">포인트관리</dt>		<dd class="m20"><a href="http://demofran.com/admin/member.php?code=point">포인트 관리</a></dd>		<dd class="m20"><a href="http://demofran.com/admin/member.php?code=pointxls">포인트 엑셀일괄등록</a></dd>		<dd class="m20 active"><a href="http://demofran.com/admin/member.php?code=point_select_form">포인트 일괄지급&amp;차감</a></dd>		<dt class="m30 menu_toggle">가입통계</dt>		<dd class="m30"><a href="http://demofran.com/admin/member.php?code=month">월별 가입통계분석</a></dd>		<dd class="m30"><a href="http://demofran.com/admin/member.php?code=day">일별 가입통계분석</a></dd>	</dl>
	</div>
	<div id="content">
		<div class="breadcrumb">
			<span>HOME</span> <i class="ionicons ion-ios-arrow-right"></i> 회원관리 <i class="ionicons ion-ios-arrow-right"></i> 포인트 일괄지급&amp;차감		</div>
	
<div class="s_wrap">
	<h1>포인트 일괄지급&amp;차감</h1>
	
<form name="fpointselectlist" id="fpointselectlist" method="post" action="http://demofran.com/admin/member/member_point_select_update.php">
<input type="hidden" name="po_point" value="123">
<input type="hidden" name="po_content" value="ㅁㄴㅇ">
<input type="hidden" name="po_expire_term" value="">
<input type="hidden" name="token" value="">

<div class="local_desc02 local_desc">
	<p>
		선택된 회원수 : <strong>3</strong>명
	</p>
</div>
<div class="tbl_head01" id="sit_select_tbl">
	<table>
	<colgroup>
		<col width="50px">
		<col width="150px">
		<col width="150px">
		<col>
		<col width="100px">
		<col width="100px">
		<col width="100px">
	</colgroup>
	<thead>
	<tr>
		<th scope="col">번호</th>
		<th scope="col">아이디</th>
		<th scope="col">회원명</th>
		<th scope="col">레벨</th>
		<th scope="col">포인트잔액</th>
		<th scope="col">적용포인트</th>
		<th scope="col">비고</th>
	</tr>
	</thead>
	<tbody>
		<tr class="list0">
		<td>
			1			<input type="hidden" name="point_mb_id" value="admin">
		</td>
		<td class="tal">admin</td>
		<td class="tal">관리자</td>
		<td>관리자</td>
		<td class="tar">0</td>
		<td class="tar">123</td>
		<td><span class="fc_00f">정상</span></td>
	</tr>
		<tr class="list1">
		<td>
			2			<input type="hidden" name="point_mb_id" value="admin,tubeweb1">
		</td>
		<td class="tal">tubeweb1</td>
		<td class="tal">한글만</td>
		<td>가맹점</td>
		<td class="tar">0</td>
		<td class="tar">123</td>
		<td><span class="fc_00f">정상</span></td>
	</tr>
		<tr class="list0">
		<td>
			3			<input type="hidden" name="point_mb_id" value="admin,tubeweb1,tubeweb3">
		</td>
		<td class="tal">tubeweb3</td>
		<td class="tal">세글만</td>
		<td>일반회원</td>
		<td class="tar">1,580</td>
		<td class="tar">123</td>
		<td><span class="fc_00f">정상</span></td>
	</tr>
		</tbody>
	</table>
</div>
<div class="mart10 fc_red">※ [주의] 포인트 차감금액이 현재 잔액보다 클경우 차감되지 않습니다.</div>

<div class="btn_confirm">
	<input type="submit" value="포인트적용" class="btn_large" accesskey="s">
	<a href="http://demofran.com/admin/member.php?code=point_select_form" class="btn_large bx-white">취소</a>
</div>
</form>
</div>

</div>
</div>
<jsp:include page="../admin/layout/footer.jsp"></jsp:include>