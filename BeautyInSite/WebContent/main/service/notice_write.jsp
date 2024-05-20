<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../../layout/header.jsp"/>
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
				<a href="http://demofran.com/shop/view.php?index_no=16"><img src="http://demofran.com/data/goods/1483411597/thumb-l7xUjCx1dy5Tp6GlLAy2zMlRLHhxGx_60x60.jpg" width="60" height="60"></a>
			</p>
						<p class="dn c1">
				<a href="http://demofran.com/shop/view.php?index_no=12"><img src="http://demofran.com/data/goods/1483411284/thumb-NcEq6PgZABZ4yTEDMfbc7CMZjFb4w8_60x60.jpg" width="60" height="60"></a>
			</p>
						<p class="dn c1">
				<a href="http://demofran.com/shop/view.php?index_no=21"><img src="http://demofran.com/data/goods/1516934487/thumb-79666_Dqpxzw59F3Pzg9PrtDe9tSmaUCF7tu_60x60.jpg" width="60" height="60"></a>
			</p>
					</li>
				<li class="stv_wrap">
			<img src="http://demofran.com/img/bt_qcr_prev.gif" id="up">
			<span id="stv_pg"></span>
			<img src="http://demofran.com/img/bt_qcr_next.gif" id="down">
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
	var itemQty = 3; // 총 아이템 수량
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

<!-- 좌측메뉴 시작 { -->
<aside id="aside">
	<div class="aside_hd">
		<p class="eng">CS CENTER</p>
		<p class="kor">고객센터</p>
	</div>
	<dl class="aside_cs">	
		<dt><a href="notice.do">공지사항</a></dt>
		<dt><a href="qnaList.do">1:1 상담문의</a></dt>		
		<dt><a href="faq.do">자주묻는질문</a></dt>		
	</dl>
</aside>
<!-- } 좌측메뉴 끝 -->

<div id="con_lf">
	<h2 class="pg_tit">
		<span>공지사항</span>
		<p class="pg_nav">HOME<i>&gt;</i>고객센터<i>&gt;</i>공지사항</p>
	</h2>

	
<form name="fboardform" id="fboardform" method="post" action="noticeWrite.do" onsubmit="return fboardform_submit(this);" autocomplete="off" enctype="MULTIPART/FORM-DATA">
<input type="hidden" name="mode" value="w">
<input type="hidden" name="boardid" value="13">
<input type="hidden" name="token" value="be89eac948cf721f2bb89a8dc828966b">
	
<div class="tbl_frm01 tbl_wrap">
	<table>
	<colgroup>
		<col class="w100">
		<col>
	</colgroup>
	<tbody>
	<tr>
		<th scope="row">이름</th>
		<td>
			관리자<input type="hidden" name="writer_s" value="관리자">		</td>
	</tr>
				<tr>
		<th scope="row">옵션</th>
		<td><input type="checkbox" name="btype" value="1"> 공지사항<input type="checkbox" name="issecret" value="Y" class="marl15"> 비밀글</td>
	</tr>
		<tr>
		<th scope="row">제목</th>
		<td><input type="text" name="noticeTitle" class="frm_input wfull"></td>
	</tr>
	<tr>
		<th scope="row">내용</th>
		<td>
		<textarea id="memo" name="noticeContent" class="smarteditor2 update_text" maxlength="65536" style="width: 100%"></textarea>
	</tbody>
	</table>
</div>
<div class="btn_confirm">
	<input type="submit" value="글쓰기" class="btn_lsmall">
	<a href="javascript:history.go(-1);" class="btn_lsmall bx-white">취소</a>
</div>
</form>

<script>
function fboardform_submit(f) {
	
	
	if(!f.subject.value) {
		alert('제목을 입력하세요.');
		f.subject.focus();
		return false;
	}

	var memo_editor_data = oEditors.getById['memo'].getIR();
oEditors.getById['memo'].exec('UPDATE_CONTENTS_FIELD', []);
if(jQuery.inArray(document.getElementById('memo').value.toLowerCase().replace(/^\s*|\s*$/g, ''), ['&nbsp;','<p>&nbsp;</p>','<p><br></p>','<div><br></div>','<p></p>','<br>','']) != -1){document.getElementById('memo').value='';}
	if(!memo_editor_data || jQuery.inArray(memo_editor_data.toLowerCase(), ['&nbsp;','<p>&nbsp;</p>','<p><br></p>','<p></p>','<br>']) != -1) { alert("내용을 입력해 주십시오."); oEditors.getById['memo'].exec('FOCUS'); return false; }

    return true;
}
</script>
	
	</div>		</div>
	</div>

<jsp:include page="../../layout/footer.jsp"/>