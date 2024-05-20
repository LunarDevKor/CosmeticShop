<%@page import="com.cosmetic.member.account.vo.AccountVO"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.Reader"%>
<%@page import="java.sql.Clob"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	AccountVO accVO = (AccountVO) session.getAttribute("LOGIN_USER");
%>
<jsp:include page="../../layout/header.jsp"/>

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

<div id="con_lf">
	<h2 class="pg_tit">
		<span>찜한상품</span>
		<p class="pg_nav">HOME<i>&gt;</i>마이페이지<i>&gt;</i>찜한상품</p>
	</h2>

	<p class="pg_cnt">
		<em>${wishList.size()}개</em>의 상품이 보관되어 있습니다.
	</p>

	<form name="fwishlist" id="fwishlist" method="post">
	<input type="hidden" name="act" value="multi">
	<input type="hidden" name="sw_direct">

	<div class="tbl_head02 tbl_wrap">
		<table>
		<colgroup>
			<col width="50">
			<col width="80">
			<col>
			<col width="100">
			<col width="60">
		</colgroup>
		<thead>
		<tr>
			<th scope="col">선택</th>
			<th scope="col">이미지</th>
			<th scope="col">상품정보</th>
			<th scope="col">가격</th>
			<th scope="col">삭제</th>
		</tr>
		</thead>
		<tbody>
	<c:forEach var="wish" items="${wishList}">
		<tr>
			<td class="tac">
				<input type="checkbox" name="chk_gs_id[0]" value="1" onclick="out_cd_check(this, 'no');">
				<input type="hidden" name="gs_id[0]" value="21">
			</td>
			<td class="tac"><a href="<%=request.getContextPath()%>/prodDetail.do?prodNo=${wish['PROD_NO']}"><img src="${wish['PROD_IMG']}" width="70" height="70"></a></td>
			<td class="td_name">
				<a href="<%=request.getContextPath()%>/prodDetail.do?prodNo=${wish['PROD_NO']}">[브랜드명] ${wish['PROD_NAME']}</a>
				<p class="fc_999">${wish['PROD_CONTENT']}</p>
			</td>			
			<td class="tar"><span class="mpr">${wish['PROD_PRICE']}<span>원</span></span></td>
			<td class="tac"><a href="#" class="btn_small bx-red delete-wish" data-pNo ="${wish['PROD_NO']}">삭제</a></td>
		</tr>
		
		</c:forEach>
		</tbody>
		</table>
	</div>
	
	<div class="btn_confirm">		
		<button type="submit" class="btn_large wset" onclick="return fwishlist_check(document.fwishlist,'direct_buy');">주문하기</button>
		<button type="submit" class="btn_large bx-white" onclick="return fwishlist_check(document.fwishlist,'');">장바구니 담기</button>
	</div>
	</form>
</div>
		</div>
	</div>
<script src="js/toast.js"></script>
<script>
let deleteBtn = document.querySelectorAll(".delete-wish");

for(let i = 0; i < deleteBtn.length; i++){
	deleteBtn[i].addEventListener('click', function(){
		let xhr = new XMLHttpRequest();
		
		xhr.open('POST', 'deleteWish.do', true)
		
		console.log(this.dataset.pNo);
		
		let data = {
			prodNo : this.dataset.pno
		};
		
		xhr.setRequestHeader('Content-Type', 'application/json');
		
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				Toast.fire({
					icon: 'success',
					title: '성공적으로 삭제되었습니다'
				});
				
				setTimeout(() => {
					location.href='wishList.do';
				}, 1100);
			}
		}
		
		xhr.send(JSON.stringify(data));
		
		event.preventDefault();
	});
}

</script>

<jsp:include page="../../layout/footer.jsp"/>

