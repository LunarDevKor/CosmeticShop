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
		<h2><i class="fa fa-comments-o"></i>고객지원</h2>
	</div>
		<dl>
		<dt class="h10 menu_toggle">고객지원</dt>		<dd class="h10 active"><a href="http://demofran.com/admin/help.php?code=qa">1:1 상담문의<em>0</em></a></dd>		<dd class="h10"><a href="http://demofran.com/admin/help.php?code=leave">회원 탈퇴내역</a></dd>		<dt class="h20 menu_toggle">FAQ 관리</dt>		<dd class="h20"><a href="http://demofran.com/admin/help.php?code=faq_group">FAQ 분류</a></dd>		<dd class="h20"><a href="http://demofran.com/admin/help.php?code=faq">FAQ 관리</a></dd>	</dl>
	</div>
	<div id="content">
		<div class="breadcrumb">
			<span>HOME</span> <i class="ionicons ion-ios-arrow-right"></i> 고객지원 <i class="ionicons ion-ios-arrow-right"></i> 1:1 상담문의		</div>
	
<div class="s_wrap">
	<h1>1:1 상담문의</h1>
	
<h2>기본검색</h2>
<form name="fsearch" id="fsearch" method="get">
<input type="hidden" name="code" value="qa">
<div class="tbl_frm01">
	<table>
	<colgroup>
		<col class="w100">
		<col>
	</colgroup>
	<tbody>
	<tr>
		<th scope="row">검색어</th>
		<td>
			<select name="sfl">
				<option value="mb_id">작성자</option>
				<option value="subject">제목</option>
			</select>
			<input type="text" name="stx" value="" class="frm_input" size="30">
		</td>
	</tr>
	</tbody>
	</table>
</div>
<div class="btn_confirm">
	<input type="submit" value="검색" class="btn_medium">
	<input type="button" value="초기화" id="frmRest" class="btn_medium grey">	
</div>
</form>

<form name="fqalist" id="fqalist" method="post" action="./help/help_qa_delete.php" onsubmit="return fqalist_submit(this);">
<input type="hidden" name="q1" value="code=qa">
<input type="hidden" name="page" value="1">

<div class="local_ov mart30">
	전체 : <b class="fc_red">0</b> 건 조회
</div>
<div class="local_frm01">
	<input type="submit" name="act_button" value="선택삭제" class="btn_lsmall bx-white" onclick="document.pressed=this.value"></div>
<div class="tbl_head01">
	<table>
	<colgroup>
		<col class="w50">
		<col class="w50">
		<col class="w100">
		<col>
		<col class="w100">
		<col class="w80">
		<col class="w60">
		<col class="w60">
	</colgroup>
	<thead>
	<tr>
		<th scope="col"><input type="checkbox" name="chkall" value="1" onclick="check_all(this.form);"></th>
		<th scope="col">번호</th>
		<th scope="col">분류</th>
		<th scope="col">제목</th>
		<th scope="col">작성자</th>
		<th scope="col">작성일</th>
		<th scope="col">답변</th>
		<th scope="col">관리</th>
	</tr>
	</thead>
	<tbody><tr><td colspan="8" class="empty_table">자료가 없습니다.</td></tr>	</tbody>
	</table>
</div>
<div class="local_frm02">
	<input type="submit" name="act_button" value="선택삭제" class="btn_lsmall bx-white" onclick="document.pressed=this.value"></div>
</form>


<script>
function fqalist_submit(f)
{
    if(!is_checked("chk[]")) {
        alert(document.pressed+" 하실 항목을 하나 이상 선택하세요.");
        return false;
    }

    if(document.pressed == "선택삭제") {
        if(!confirm("선택한 자료를 정말 삭제하시겠습니까?")) {
            return false;
        }
    }

    return true;
}
</script>
</div>

</div>
</div>
<jsp:include page="./layout/footer.jsp"></jsp:include>
