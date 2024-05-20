<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<jsp:include page="../../layout/header.jsp"/>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>


</style>

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
	var itemQty = 1; // 총 아이템 수량
	var itemShow = 3; // 한번에 보여줄 아이템 수량
	var Flag = 1; // 페이지
	var EOFlag = parseInt(itemQty/itemShow); // 전체 리스트를 나눠 페이지 최댓값을 구하고
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
		<span>자주묻는 질문</span>
		<p class="pg_nav">HOME<i>&gt;</i>고객센터<i>&gt;</i>자주묻는 질문</p>
	</h2>

	
	<div class="faq-box">
      <ul>
        <!-- 1 -->
        <li>
          <div class="question-box">
            <p><span class="faq_no">TOP 01&nbsp;&nbsp; </span> <span> 주문한 상품은 언제 배송되나요?</span></p>

          </div>
          <div class="answer-box">
           	온라인몰에서 주문하신 상품은 주문일 기준 3일~5일 이내(주말 및 공휴일 제외)로 배송됩니다. <br>

			※ 도서산간, 제주도 지역의 경우 5~7일 이내 배송됩니다.<br>
			※ 브랜드 세일 기간에는 주문량 폭주로 인해 주문일로부터 5~7일 이내 배송됩니다.<br>
			※ 예약배송 상품의 경우, 지정된 배송일에 배송됩니다.
          </div>
        </li>
        <!-- 2 -->
        <li>
          <div class="question-box">
            <p><span class="faq_no">TOP 02&nbsp;&nbsp; </span> <span>뷰티인 사이트 종이봉투도 함께 보내주실 수 있나요?</span></p>
          </div>
          <div class="answer-box">
           	현재 온라인몰은 종이봉투를 취급하고 있지 않은 점 양해 부탁 드립니다. 
          </div>
        </li>
        <!-- 3 -->
        <li>
          <div class="question-box">
            <p><span class="faq_no">TOP 03&nbsp;&nbsp; </span> <span>주문내역은 어디에서 확인할 수 있나요?</span></p>
            <!-- <span>+</span> -->
          </div>
          <div class="answer-box">
           	 주문 내역확인은 마이페이지내 주문내역에서 확인 가능하며 주문 취소도 신청 가능합니다.
          </div>
        </li>        
        <!-- 4 -->
        <li>
          <div class="question-box">
            <p><span class="faq_no">TOP 04&nbsp;&nbsp; </span> <span>포인트 적립 또는 사용 불가한 상품도 있나요?</span></p>
          </div>
          <div class="answer-box">
          	일부 상품 구매 시, 뷰티인사이트의 내부 정책에 따라 Beauty in Site 포인트 적립/사용이 제한될 수 있습니다. <br>
			*쇼핑백 및 선물 포장 용품 구매, 선불카드/상품권 등 유가증권(현금성자산) 구매 등<br>
			<br>
			또한, 뷰티인사이트 비회원이시거나, 1천원 미만 결제시에는 포인트 적립이 불가합니다.

          </div>
        </li>        
        <!-- 5 -->
        <li>
          <div class="question-box">
            <p><span class="faq_no">TOP 05&nbsp;&nbsp; </span> <span>뷰티인사이트 탈퇴후 재가입이 가능한가요?</span></p>

          </div>
          <div class="answer-box">
            [뷰티인사이트 회원 탈퇴]<br>
			뷰티인사이트 회원 탈퇴하신 경우, 바로 재가입이 가능합니다.
          </div>
        </li>        
        <!-- 6 -->
        <li>
          <div class="question-box">
            <p><span class="faq_no">TOP 06&nbsp;&nbsp; </span> <span>뷰티인사이트 포인트 적립 및 사용하고싶어요</span></p>

          </div>
          <div class="answer-box">
            [포인트 적립 방법]<br>
			포인트 적립은 회원님의 회원정보로 적립되며,적립의 기준은 회원님께서 실제 지불하신 금액 기준으로 계산되어 적립됩니다. (포인트 결제금액은 제외)<br>
			온라인몰에서 구매 시 포인트는 고객님의 회원 ID로 자동 적립 됩니다.<br>
			배송완료 후에도 적립이 되지 않으셨다면 뷰티인사이트 온라인몰 고객센터(1234-5678)로 문의해주시면 신속하게 처리 도와드리겠습니다.<br>
			<br>
			[포인트 사용 방법]<br>
			포인트 사용을 위해서는 최소 1,000포인트 이상 보유하여햐 하며, 이 때 10포인트 단위로 사용 가능합니다.<br>
			단, 10,000포인트 이상 사용 할 경우 회원님께서 지정한 비밀번호 4자리 입력 후 사용 가능합니다.<br>
			포인트의 사용 순서는 회원이 보유 중인 사용 가능한 포인트에서 소멸일자가 빠른 포인트부터 우선적으로 차감됩니다. 
          </div>
        </li>        
        <!-- 7 -->
        <li>
          <div class="question-box">
            <p><span class="faq_no">TOP 07&nbsp;&nbsp; </span> <span>주문한 상품의 옵션을 변경하고 싶어요.</span></p>
 
          </div>
          <div class="answer-box">
          	  주문하신 상품의 옵션 변경은 불가하며, 변경을 원하실 경우 취소 후 재주문해주셔야 합니다. 
          </div>
        </li>        
        <!-- 8 -->
        <li>
          <div class="question-box">
            <p><span class="faq_no">TOP 08&nbsp;&nbsp; </span> <span>반품은 언제까지 가능한가요?</span></p>
    
          </div>
          <div class="answer-box">
           	 반품은 상품을 수령하신 날짜를 기준으로 15일 이내에 가능합니다. <br>
			 다만 상품의 불량, 배송 오류 등 당사의 실수로 인한 반품인 경우, 30일 이내 신청이 가능합니다.
          </div>
        </li>        
        <!-- 9 -->
        <li>
          <div class="question-box">
            <p><span class="faq_no">TOP 09&nbsp;&nbsp; </span> <span>반품할때 비용이 드나요?</span></p>
     
          </div>
          <div class="answer-box">
                           반품 시 지불하셔야 하는 반품비용은 회수비 2,500원입니다. <br>
			단, 매장반품의 경우 별도 회수비용 없이 반품가능합니다.<br>
			<br>
			※ 추가비용이 발생하는 경우<br>
			 - 도서산간: +2,500원 (5,000원)<br>
			 - 제주도:  +2,500원 (5,000원)<br>
			 - 제주도의 도서산간 지역:  +7,000원 (9,500원)<br>
			 - 무료배송이었으나 부분적인 반품으로 인해 무료배송 조건(결제금액 2만원 이상)이 깨진 경우<br>
			   :  면제받으셨던 초기 배송비 2,500원 추가 발생<br>
			   *  오늘드림 배송 옵션 별 상이 발생 <br>
			<br>
			※ 반품비는 환불금액에서 차감처리 됩니다.<br>
			※ 업체배송 상품의 경우 업체의 규정에 따라 비용이 상이할 수 있습니다.<br>
			※ 상품의 불량, 배송 오류 등 당사의 실수로 인한 반품의 경우, 반품에 필요한 비용은 당사가 부담합니다.
          </div>
        </li>        
        <!-- 10 -->
        <li>
          <div class="question-box">
            <p><span class="faq_no">TOP 10&nbsp;&nbsp; </span> <span>탈퇴시 가지고 있던 포인트는 소멸되나요?</span></p>
      
          </div>
          <div class="answer-box">
            [뷰티인사이트 회원 탈퇴]<br>
			뷰티인사이트 회원 탈퇴 시, 회원이 보유한 포인트는 전량 소멸되며, 마이너스 포인트에 대해서는 뷰티인사이트 정책에 따라 탈퇴에 제한이 있을 수 있습니다.
          </div>
        </li>        
      </ul>
    </div>


	<script>
	
	$(".faq-box li").click(function () {
		  // 열려있는 답변 닫기
		  $(this).siblings(".hover").find(".answer-box").slideUp("300");
		  $(this).siblings(".hover").removeClass("hover");
		  // 질문을 열고 닫기
		  if ($(this).hasClass("hover")) {
		    $(this).find(".answer-box").slideUp("300");
		    $(this).removeClass("hover");
		  }
		  else {
		    $(this).find(".answer-box").slideDown("300");
		    $(this).addClass("hover");
		  }
		});

		// li안에 있는 답변박스 클릭방지
		$(".answer-box").click(function(){
		  return false;
		});
	
	
	</script>

	<ul class="faq_li">
			</ul>
		<div class="empty_list">등록된 FAQ가 없습니다.</div>
	
	<script>
	function js_faq(id){
		var $con = $("#sod_faq_con_"+id);
		if($con.is(":visible")) {
			$con.slideUp("fast");
			$(".faq_q").removeClass("active");
		} else {
			$(".faq_a:visible").slideUp("fast");
			$con.slideDown("fast");
			$(".faq_q").removeClass("active");
			$con.prev().addClass("active");
		}
	}
	</script>
</div>
		</div>
	</div>
	
<jsp:include page="../../layout/footer.jsp"/>
