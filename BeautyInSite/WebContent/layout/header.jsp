<%@page import="com.cosmetic.member.account.vo.AccountVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="author" content="샘플샵, TubeWeb">
  <meta name="description" content="샘플샵 - PHP 웹솔루션 전문 개발업체">
  <meta name="keywords" content="PHP, 쇼핑몰솔루션, 독립형쇼핑몰, 입점형쇼핑몰, 독립몰, 입점몰, 몰인몰, 분양쇼핑몰, 분양몰, 프랜차이즈몰, 홈빌더">
  <!-- Open Graph -->
  <meta property="og:type" content="website">
  <meta property="og:title" content="샘플샵 - PHP 웹솔루션 전문 개발업체">
  <meta property="og:description" content="샘플샵 - PHP 웹솔루션 전문 개발업체">
  <meta property="og:url" content="http://demofran.com">
  <meta property="og:site_name" content="행복을 주는 쇼핑몰!">
  <meta property="og:image"
    content="http://demofran.com/data/banner/PC6g1NMhDVSjEVxesJjMAkWQDTmpsr.jpg?v=20240105210140">
  <meta property="og:locale" content="ko_KR">
  <meta name="robots" content="index,follow">
  <title>Document</title>
</head>

<title>샘플샵 - PHP 웹솔루션 전문 개발업체</title>
<link rel="stylesheet" href="/assets/css/reset.css">
<link rel="stylesheet" href="/assets/css/basic.css">
<link rel="stylesheet" href="/assets/css/button.css">
<link rel="stylesheet" href="/assets/css/default.css">
<link rel="stylesheet" href="/assets/css/ionicons.css">
<link rel="stylesheet" href="/assets/css/slick.css">
<link rel="stylesheet" href="/assets/theme/basic/style.css">
<link rel="stylesheet" href="/css/source/sweetalert2.min.css">
<link rel="stylesheet" href="/css/source/animate.min.css">
<link rel="stylesheet" href="/css/animated.css">
<link rel="shortcut icon" href="http://demofran.com/data/banner/JnLfWUSUyR6sXJP5n3Re4Fvdc93k93.ico" type="image/x-icon">
<link href="https://cdn.jsdelivr.net/npm/fontawesome-6-pro@6.4.0/css/all.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Diphylleia&family=Hi+Melody&family=Noto+Sans+KR:wght@200;300;400;500&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">  

<script>
  var tb_url = "/BeautyInSite";
  var tb_bbs_url = "main/";
  var tb_shop_url = "http://demofran.com/shop";
  var tb_mobile_url = "http://demofran.com/m";
  var tb_mobile_bbs_url = "http://demofran.com/m/bbs";
  var tb_mobile_shop_url = "http://demofran.com/m/shop";
  var tb_is_member = "0";
  var tb_is_mobile = "";
  var tb_cookie_domain = "";
</script>
<script src="assets/js/jquery-3.5.1.min.js"></script>
<script src="assets/js/jquery-ui-1.10.3.custom.js"></script>
<script src="assets/js/common.js"></script>
<script src="assets/js/slick.js"></script>
<script src="js/source/sweetalert2.all.min.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

<script>
$(function(){
	AOS.init();
})
</script>
</head>

<body><!-- 팝업레이어 시작 { -->
  <div id="hd_pop">
    <h2>팝업레이어 알림</h2>
    <span class="sound_only">팝업레이어 알림이 없습니다.</span>
  </div>

  <script>
    $(function () {
      $(".hd_pops_reject").click(function () {
        var id = $(this).attr('class').split(' ');
        var ck_name = id[1];
        var exp_time = parseInt(id[2]);
        var cookie_domain = '';
        $("#" + id[1]).css("display", "none");
        set_cookie(ck_name, 1, exp_time, cookie_domain);
      });
      $('.hd_pops_close').click(function () {
        var idb = $(this).attr('class').split(' ');
        $('#' + idb[1]).css('display', 'none');
      });
    });
  </script>
  <!-- } 팝업레이어 끝 -->
  <div id="wrapper">
    <div id="header">
      <!-- <div id="hd_banner">
        <p
          style="background:#F2877F url(http://demofran.com/data/banner/szEreKjpPshELPSNnS8esg8RXvRd5T.jpg) no-repeat center;height:70px;">
          <a href="/shop/listtype.php?type=4" target="_self"></a>
        </p> <img src="http://demofran.com/img/bt_close.gif" id="hd_close">
      </div> -->
      <div id="tnb">
        <div id="tnb_inner">
          <ul class="fr">
          	<% AccountVO accVO = (AccountVO) session.getAttribute("LOGIN_USER"); 
          		if(accVO == null){
          	%>
            <li><a href="login.do">로그인</a></li>
            <li><a href="register.do">회원가입</a></li>
            <%
          		} else {
            %>
            <li><a href="logout.do">로그아웃</a></li>
            <%
            	}
            %>
            <li><a href="mypage.do">마이페이지</a></li>
            <li><a href="cartList.do">장바구니<span class="ic_num" id="cartCnt">0</span></a></li>
            <li><a href="orderhistory.do">주문/배송조회</a></li>
            <li><a href="notice.do">고객센터</a></li>
            <%
            	if(accVO != null && "1".equals(accVO.getAuth())){
            %>
            <li><a href="admin/index.do" style="color:red;">관리자</a></li>
            
            <%
            	}
            %>
          </ul>
        </div>
      </div>
      <div id="hd">
        <!-- 상단부 영역 시작 { -->
        <div id="hd_inner">
          <!-- <div class="hd_bnr">
            <span><img src="http://demofran.com/data/banner/6hTUUw67mkPz6ZJkf74TBdDBk2bqZG.gif" width="160"
                height="60"></span>
          </div> -->
          <h1 class="hd_logo">
            <a href="index.do"><img
                src="imgSource/LOGO.png"></a>
          </h1>
          <div id="hd_sch">
            <fieldset class="sch_frm">
              <legend>사이트 내 전체검색</legend>
              <form name="fsearch" id="fsearch" method="" action="prodSearch.do"
                onsubmit="return fsearch_submit(this);" autocomplete="off">
<!--                 <input type="hidden" name="hash_token" value="3a44141e291bbae65c7db2e7df2356b2"> -->
                <input type="text" name="search" class="sch_stx" maxlength="20" placeholder="검색어를 입력해주세요">
                <button type="submit" class="sch_submit fa fa-search" value="검색"></button>
              </form>
              <script>
                function fsearch_submit(f) {
                  if (!f.ss_tx.value) {
                    alert('검색어를 입력하세요.');
                    return false;
                  }
                  return true;
                }
              </script>
            </fieldset>
          </div>
        </div>
        <div id="gnb">
          <div id="gnb_inner">
            <div class="all_cate">
              <span class="allc_bt"><i class="fa-solid fa-bars"></i> 전체카테고리</span>
              <div class="con_bx">
                <ul>
                  <li class="c_box">
                    <a href="cateList.do?&amp;cate=A01" class="cate_tit">스킨케어</a>
                    <ul>
                      <li><a href="cateList.do?&amp;cate=1001">스킨/케어</a></li>
                      <li><a href="cateList.do?&amp;cate=1002">크림</a></li>
                      <li><a href="cateList.do?&amp;cate=1003">로션</a></li>
                      <li><a href="cateList.do?&amp;cate=1004">에센스/세럼/앰플</a></li>
                      <li><a href="cateList.do?&amp;cate=1005">미스트/오일</a></li>
                      <li><a href="cateList.do?&amp;cate=1006">스킨케어세트</a></li>
                    </ul>
                  </li>
                  <li class="c_box">
                     <a href="cateList.do?&amp;cate=A05" class="cate_tit">미용소품</a>
                    <ul>
                      <li><a href="cateList.do?&amp;cate=1041">메이크업소품</a></li>
                    <li><a href="cateList.do?&amp;cate=1042">스킨케어소품</a></li>
                      <li><a href="cateList.do?&amp;cate=1043">아이소품</a></li>
                      <li><a href="cateList.do?&amp;cate=1044">헤어/바디소품</a></li>
                      <li><a href="cateList.do?&amp;cate=1045">미용가전</a></li>
                      <li><a href="cateList.do?&amp;cate=1046">미용관리</a></li>
                      <li><a href="cateList.do?&amp;cate=1047">미용잡화</a></li>
                    </ul>
                  </li>
                  <li class="c_box">
                    <a href="cateList.do?&amp;cate=A07" class="cate_tit">헤어케어</a>
                    <ul>
                     <li><a href="cateList.do?&amp;cate=1061">샴푸/린스</a></li>
                      <li><a href="cateList.do?&amp;cate=1062">트리트먼트/팩</a></li>
                     <li><a href="cateList.do?&amp;cate=1063">헤어에센스</a></li>
                      <!-- <li><a href="http://demofran.com/shop/list.php?ca_id=003004">유아동의류</a></li>
                      <li><a href="http://demofran.com/shop/list.php?ca_id=003005">유아동신발/잡화</a></li> -->
                    </ul>
                  </li>
                  <li class="c_box">
                    <a href="cateList.do?&amp;cate=A08" class="cate_tit">바디케어</a>
                    <ul>
                      <li><a href="cateList.do?&amp;cate=1071">로션/오일</a></li>
                      <li><a href="cateList.do?&amp;cate=1072">샤워/입욕</a></li>
                      <li><a href="cateList.do?&amp;cate=1073">핸드케어</a></li>
                    </ul>
                  </li>
                  <li class="c_box">
                    <a href="cateList.do?&amp;cate=A02"class="cate_tit">클렌징</a>
                    <ul>
                      <li><a href="cateList.do?&amp;cate=1010">클렌징폼/젤</a></li>
                      <li><a href="cateList.do?&amp;cate=1011">오일/밤</a></li>
                      <li><a href="cateList.do?&amp;cate=1012">워터/티슈/밀크</a></li>
                      <li><a href="cateList.do?&amp;cate=1013">필링/스크럽</a></li>
                      <li><a href="cateList.do?&amp;cate=1014">립&아이리무버</a></li>
                    </ul>
                  </li>
                </ul>
                <ul>
                  <li class="c_box">
                    <a href="cateList.do?&amp;cate=A06" class="cate_tit">맨즈케어</a>
                    <ul>
                       <li><a href="cateList.do?&amp;cate=1051">스킨케어</a></li>
                       <li><a href="cateList.do?&amp;cate=1052">메이크업</a></li>
                       <li><a href="cateList.do?&amp;cate=1053">쉐이빙</a></li>
                       <li><a href="cateList.do?&amp;cate=1054">헤어케어</a></li>
                       <li><a href="cateList.do?&amp;cate=1055">바디케어</a></li>
                       <li><a href="cateList.do?&amp;cate=1056">프래그런스/라이프</a></li>
                    </ul>
                  </li>
                  <li class="c_box">
                    <a href="cateList.do?&amp;cate=A03" class="cate_tit">선케어</a>
                    <ul>
                     <li><a href="cateList.do?&amp;cate=1021">선블록</a></li>
                     <li><a href="cateList.do?&amp;cate=1022">태닝/애프터선</a></li>
                      <!-- <li><a href="http://demofran.com/shop/list.php?ca_id=007003">골프클럽/의류/용품</a></li>
                      <li><a href="http://demofran.com/shop/list.php?ca_id=007004">등산/아웃도어</a></li>
                      <li><a href="http://demofran.com/shop/list.php?ca_id=007005">캠핑/낚시</a></li>
                      <li><a href="http://demofran.com/shop/list.php?ca_id=007006">구기/라켓</a></li>
                      <li><a href="http://demofran.com/shop/list.php?ca_id=007007">자전거/보드</a></li>
                      <li><a href="http://demofran.com/shop/list.php?ca_id=007008">자동차용품/블랙박스</a></li>
                      <li><a href="http://demofran.com/shop/list.php?ca_id=007009">타이어/오일/부품</a></li>
                      <li><a href="http://demofran.com/shop/list.php?ca_id=007010">공구/안전/산업용품</a></li> -->
                    </ul>
                  </li>
                  <li class="c_box">
                   <a href="cateList.do?&amp;cate=A04" class="cate_tit">메이크업</a>
                    <ul>
                      <li><a href="cateList.do?&amp;cate=1031">립메이크업</a></li>
                      <li><a href="cateList.do?&amp;cate=1032">베이스메이크업</a></li>
                      <li><a href="cateList.do?&amp;cate=1033">아이메이크업</a></li>
                      <!-- <li><a href="http://demofran.com/shop/list.php?ca_id=006004">생활/미용가전</a></li>
                      <li><a href="http://demofran.com/shop/list.php?ca_id=006005">카메라</a></li>
                      <li><a href="http://demofran.com/shop/list.php?ca_id=006008">휴대폰</a></li>
                      <li><a href="http://demofran.com/shop/list.php?ca_id=006006">음향기기</a></li>
                      <li><a href="http://demofran.com/shop/list.php?ca_id=006007">게임</a></li>
                      <li><a href="http://demofran.com/shop/list.php?ca_id=006009">태블릿</a></li>
                      <li><a href="http://demofran.com/shop/list.php?ca_id=006010">노트북/PC</a></li>
                      <li><a href="http://demofran.com/shop/list.php?ca_id=006011">모니터/프린터</a></li>
                      <li><a href="http://demofran.com/shop/list.php?ca_id=006012">PC주변기기</a></li>
                      <li><a href="http://demofran.com/shop/list.php?ca_id=006013">저장장치</a></li> -->
                    </ul>
                  </li>
                  <li></li>
                  <li></li>
                </ul>
              </div>
              <script>
                $(function () {
                  $('.all_cate .allc_bt').click(function () {
                    if ($('.all_cate .con_bx').css('display') == 'none') {
                      $('.all_cate .con_bx').show();
                      $(this).html('<i class="ionicons ion-ios-close-empty"></i> 전체카테고리');
                    } else {
                      $('.all_cate .con_bx').hide();
                      $(this).html('<i class="fa fa-bars"></i> 전체카테고리');
                    }
                  });
                });
              </script>
            </div>
            <div class="gnb_li">
              <ul>
                <!-- <li><a href="list.do">쇼핑특가</a></li> -->
                <li><a href="bestList.do">베스트셀러</a></li>
                <li><a href="newList.do">신상품</a></li>
                <!-- <li><a href="list.do">인기상품</a></li> -->
                <li><a href="recommendList.do">추천상품</a></li>
                <li><a href="brandlist.do">브랜드샵</a></li>
                <!-- <li><a href="list.do">기획전</a></li> -->
                <!-- <li><a href="list.do">타임세일</a></li> -->
              </ul>
            </div>
          </div>
        </div>
        <!-- } 상단부 영역 끝 -->
        <script>
          $(function () {
            // 상단메뉴 따라다니기
            var elem1 = $("#hd_banner").height() + $("#tnb").height() + $("#hd_inner").height();
            var elem2 = $("#hd_banner").height() + $("#tnb").height() + $("#hd").height();
            var elem3 = $("#gnb").height();
            $(window).scroll(function () {
              if ($(this).scrollTop() > elem1) {
                $("#gnb").addClass('gnd_fixed');
                $("#hd").css({ 'padding-bottom': elem3 })
              } else if ($(this).scrollTop() < elem2) {
                $("#gnb").removeClass('gnd_fixed');
                $("#hd").css({ 'padding-bottom': '0' })
              }
            });
          });
        </script>
      </div>
      
      <div id="container">

			<!-- 퀵메뉴 우측날개 시작 { -->
			<!-- <div id="qcr">
				<ul>
					<li class="tit">최근 본 상품</li>
					<li>
						<p class="no_item">없음</p>
					</li>
				</ul>
			</div> -->
			<!-- } 퀵메뉴 우측날개 끝 -->

			<div class="qbtn_bx">
				<button type="button" id="anc_up">TOP</button>
				<button type="button" id="anc_dw">DOWN</button>
			</div>

			<script>
				$(function () {
					var itemQty = 0; // 총 아이템 수량
					var itemShow = 3; // 한번에 보여줄 아이템 수량
					var Flag = 1; // 페이지
					var EOFlag = parseInt(itemQty / itemShow); 
					// 전체 리스트를 나눠 페이지 최댓값을 구하고
					var itemRest = parseInt(itemQty % itemShow); // 나머지 값을 구한 후
					if (itemRest > 0) // 나머지 값이 있다면
					{
						EOFlag++; // 페이지 최댓값을 1 증가시킨다.
					}
					$('.c' + Flag).css('display', 'block');
					$('#stv_pg').text(Flag + '/' + EOFlag); // 페이지 초기 출력값
					$('#up').click(function () {
						if (Flag == 1) {
							alert('목록의 처음입니다.');
						} else {
							Flag--;
							$('.c' + Flag).css('display', 'block');
							$('.c' + (Flag + 1)).css('display', 'none');
						}
						$('#stv_pg').text(Flag + '/' + EOFlag); // 페이지 값 재설정
					})
					$('#down').click(function () {
						if (Flag == EOFlag) {
							alert('더 이상 목록이 없습니다.');
						} else {
							Flag++;
							$('.c' + Flag).css('display', 'block');
							$('.c' + (Flag - 1)).css('display', 'none');
						}
						$('#stv_pg').text(Flag + '/' + EOFlag); // 페이지 값 재설정
					});

					$(window).scroll(function () {
						var pos = $("#ft").offset().top - $(window).height();
						if ($(this).scrollTop() > 0) {
							$(".qbtn_bx").fadeIn(300);
							if ($(this).scrollTop() > pos) {
								$(".qbtn_bx").addClass('active');
							} else {
								$(".qbtn_bx").removeClass('active');
							}
						} else {
							$(".qbtn_bx").fadeOut(300);
						}
					});

					// 퀵메뉴 상위로이동
					$("#anc_up").click(function () {
						$("html, body").animate({ scrollTop: 0 }, 400);
					});

					// 하위로이동
					$("#anc_dw").click(function () {
						$("html, body").animate({ scrollTop: $(document).height() }, 400);
					});

					// 좌/우 퀵메뉴 높이 자동조절
					var Theight = $("#header").height() - $("#gnb").height();
					var ptop = 20;
					$("#qcr, #qcl").css({ 'top': ptop + 'px' });

					$(window).scroll(function () {
						if ($(this).scrollTop() > Theight) {
							$("#qcr, #qcl").css({ 'position': 'fixed', 'top': '67px', 'z-index': '999' });
						} else {
							$("#qcr, #qcl").css({ 'position': 'absolute', 'top': ptop + 'px' });
						}
					});
				});
			</script>
			<% 
				if(accVO != null){
			%>
			<script>
				$(function() {
					updateCartCnt();
					
					setInterval(function() {
						updateCartCnt();
					}, 5000);
					
					function updateCartCnt() {
						$.ajax({
							url: 'getCartCnt.do',
							method: 'GET',
							success: function(cnt) {
								$('#cartCnt').text(cnt);
							},
							error: function(err) {
								console.error('장바구니 개수를 가져오는 중 오류...', err)
							}
						});
					}
					
				})
			</script>
			<%
				}
			%>