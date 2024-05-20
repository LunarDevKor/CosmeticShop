<%@page import="com.cosmetic.member.account.vo.AccountVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../../layout/header.jsp"/>
<% AccountVO accVO = (AccountVO) session.getAttribute("LOGIN_USER"); %>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			<script>
			$(function(){
				// 상단메뉴 따라다니기
				var elem1 = $("#hd_banner").height() + $("#tnb").height() + $("#hd_inner").height();
				var elem2 = $("#hd_banner").height() + $("#tnb").height() + $("#hd").height();
				var elem3 = $("#gnb").height();
				$(window).scroll(function () {
					if($(this).scrollTop() > elem1) {
						$("#gnb").addClass('gnd_fixed');
						$("#hd").css({'padding-bottom':elem3})
					} else if($(this).scrollTop() < elem2) {
						$("#gnb").removeClass('gnd_fixed');
						$("#hd").css({'padding-bottom':'0'})
					}
				});
			});
			</script>
		</div>

			</div>

	<div id="container">

<!-- 퀵메뉴 우측날개 시작 { -->
<div id="qcr">
	<ul>
		<li class="tit">최근 본 상품</li>
		<li>
						<p class="dn c1">
				<a href="http://demofran.com/shop/view.php?index_no=20"><img src="http://demofran.com/data/goods/1516934486/thumb-30323_NcEq6PgZABZ4yTEDMfbc7CMZjFb4w8_60x60.jpg" width="60" height="60"></a>
			</p>
						<p class="dn c1">
				<a href="http://demofran.com/shop/view.php?index_no=11"><img src="http://demofran.com/data/goods/1483411200/thumb-mUTbYFV6RKVvmYLLdFAjpB7zQp5DHR_60x60.jpg" width="60" height="60"></a>
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
	var itemQty = 2; // 총 아이템 수량
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
		<p class="eng">MY PAGE</p>
		<p class="kor">마이페이지</p>
	</div>
	<div class="aside_name">관리자</div>
	<ul class="aside_bx">
		<li>포인트 <span><a href="http://demofran.com/shop/point.php">0</a>P</span></li>
	</ul>
	<dl class="aside_my">
		<dt>주문현황</dt>
		<dd><a href="http://demofran.com/shop/orderinquiry.php">주문/배송조회</a></dd>
		<dt>쇼핑통장</dt>
		<dd><a href="http://demofran.com/shop/point.php">포인트조회</a></dd>
				<dd><a href="http://demofran.com/shop/gift.php">쿠폰인증</a></dd>
						<dd><a href="http://demofran.com/shop/coupon.php">쿠폰관리</a></dd>
				<dt>관심상품</dt>
		<dd><a href="http://demofran.com/shop/cart.php">장바구니</a></dd>
		<dd><a href="http://demofran.com/shop/wish.php">내가 찜한상품</a></dd>
		<dt>회원정보</dt>
		<dd><a href="http://demofran.com/bbs/member_confirm.php?url=register_form.php">회원정보수정</a></dd>
		<dd class="marb5"><a href="http://demofran.com/bbs/leave_form.php">회원탈퇴</a></dd>
	</dl>
</aside>
<!-- } 좌측메뉴 끝 -->

<div id="con_lf">
	<h2 class="pg_tit">
		<span>회원탈퇴</span>
		<p class="pg_nav">HOME<i>&gt;</i>마이페이지<i>&gt;</i>회원탈퇴</p>
	</h2>

	<div class="tbl_frm01 tbl_wrap">
		<table>
		<colgroup>
			<col width="140">
			<col>
		</colgroup>
		<tbody>
		<tr>
			<th scope="row">고객명(ID)</th>
			<td><b><%=accVO.getName()%></b> (<%=accVO.getId()%>)</td>
		</tr>
		<tr>
			<th scope="row">보유포인트</th>
			<td><b><%=accVO.getPoint()%>P</b> <span class="fc_red marl10">※ 탈퇴이후 포인트는 모두 소멸됩니다.</span></td>
		</tr>
		<tr>
			<th scope="row">E-Mail</th>
			<td><%=accVO.getEmail()%></td>
		</tr>
		<tr>
		<%
			String tel = accVO.getTel();
			String phone = tel.substring(0, 3) + "-" + tel.substring(3, 7) + "-" + tel.substring(7, tel.length()); 
		%>
			<th scope="row">핸드폰</th>
			<td><%=phone%></td>
		</tr>
		<tr>
			<th scope="row">현재비밀번호</th>
			<td>
			<input type="password" name="mb_password" id="pw" itemname="현재비밀번호" class="frm_input required" size="20" minlength="4" maxlength="20">
			</td>
		</tr>
		</tbody>
		</table>
	</div>

	<section>
		<h2 class="anc_tit">탈퇴 이유에 대해 고객님의 소중한 의견 남겨주시면 보다 나은 서비스를 위해 노력하겠습니다.</h2>
		<ul>
			<li>
				<input type="radio" name="memo" id="memo1" value="다른 ID로 변경">
				<label for="memo1">다른 ID로 변경</label>
			</li>
			<li>
				<input type="radio" name="memo" id="memo2" value="회원가입의 혜택이 적음">
				<label for="memo2">회원가입의 혜택이 적음</label>
			</li>
			<li>
				<input type="radio" name="memo" id="memo3" value="개인정보(통신 및 신용정보)의 노출 우려">
				<label for="memo3">개인정보(통신 및 신용정보)의 노출 우려</label>
			</li>
			<li>
				<input type="radio" name="memo" id="memo4" value="시스템장애 (속도저조,잦은에러등)">
				<label for="memo4">시스템장애 (속도저조,잦은에러등)</label>
			</li>
			<li>
				<input type="radio" name="memo" id="memo5" value="서비스의 불만 (늦은배송, 가격불만족, 복잡한 절차등)">
				<label for="memo5">서비스의 불만 (늦은배송, 가격불만족, 복잡한 절차등)</label>
			</li>
			<li>
				<input type="radio" name="memo" id="memo6" value="장시간의부재">
				<label for="memo6">장시간의부재</label>
			</li>
			<li>
				<input type="radio" name="memo" id="memo7" value="기타" onclick="showDiv('other');">
				<label for="memo7">기타</label> <input type="text" class="frm_input marl10" size="60" name="other" style="visibility:hidden">
			</li>
		</ul>
	</section>

	<div class="btn_confirm">
		<input type="button" value="회원탈퇴" id="leave" class="btn_large wset">
		<a href="javascript:history.go(-1);" class="btn_large bx-white">취소</a>
	</div>

</div>
<script src="js/toast.js"></script>
<script>

document.querySelector('#leave').addEventListener('click', pwChk);
let chkRadio = document.querySelectorAll('input[name="memo"]');

function pwChk() {
	let pw = document.querySelector('#pw');
	let url = '<%=request.getContextPath()%>/pwChk.do';
	
	let checked = Array.from(chkRadio).some(chk => chk.checked);
	
	if(!checked){
		Toast.fire({
			icon: 'warning',
			title: '탈퇴사유를 선택해주세요'
		})
		return false;
	}
	
	var params = new URLSearchParams();
	
	params.append('pw', pw.value);
	params.append('accNo', <%=accVO.getAccNo()%>);
	
	if(pw.value) {
		fetch(url, {
			method: 'POST',
			headers: {
				'Content-Type' : 'application/x-www-form-urlencoded'
			},
			body: params
		})
		.then(resp => resp.text())
		.then(text => {
			if(text === 'SUCCESS'){
				Swal.fire({
					title : '정말로 회원탈퇴를 진행하시겠습니까?',
					text : '다시 되돌릴 수 없습니다. 신중하세요',
					icon : 'error',
					confirmButtonColor : '#d33',
					showCancelButton : true,
					confirmButtonText : '탈퇴',
					cancelButtonText : '취소'
				}).then(result => {
					if(result.isConfirmed) {
<%-- 						location.href = '<%=request.getContextPath()%>/leave.do?accNo=<%=accVO.getAccNo()%>';		 --%>
						$.post('<%=request.getContextPath()%>/leave.do', { accNo: <%=accVO.getAccNo()%> }, function(data) {
							console.log(data);
						})
						.fail(function() {
						    console.error('회원탈퇴 실패');
						});
					}
				});
			}else{
				Toast.fire({
					icon: 'error',
					title: '비밀번호가 일치하지 않습니다'
				})
			}
		})
		.catch(err =>{
			console.error(err);
		})
	}
	else{
		Toast.fire({
			icon: 'warning',
			title: '현재 사용중인 비밀번호를 입력해주세요'
		})
		return false;
	}
}

function showDiv( id ) {
    document.all.other.style.visibility = 'hidden';
    document.all.other.value = '';
    document.all[ id ].style.visibility = 'visible';
    document.all[ id ].focus();
}
</script>
		</div>
	</div>
	
<jsp:include page="../../layout/footer.jsp"/>