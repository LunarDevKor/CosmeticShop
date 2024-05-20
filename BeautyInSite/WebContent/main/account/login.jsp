<%@page import="com.cosmetic.util.Const"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.security.SecureRandom"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../../layout/header.jsp"/>
<%
SecureRandom random=new SecureRandom(); 
String state=new BigInteger(130, random).toString();
session.setAttribute("state", state); 
%>
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
						<p class="no_item">없음</p>
					</li>
				</ul>
			</div>
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
			<!-- } 우측 퀵메뉴 끝 -->
			<div class="cont_inner">

				<p class="tit_navi">홈 <i class="ionicons ion-ios-arrow-right"></i> 로그인</p>
				<h2 class="stit">LOGIN</h2>
				<!-- <ul class="login_tab">
					<li data-tab="login_fld"><span>회원 로그인</span></li>
					<li data-tab="guest_fld"><span>비회원 주문조회</span></li>
				</ul> -->

				<form name="flogin" action="login.do" onsubmit="return flogin_submit(this);"
					method="post">
					<input type="hidden" name="url" value="register.do">

					<div class="login_wrap" id="login_fld">
						<dl class="log_inner">
							<dt>회원 로그인</dt>
							<dd class="stxt">로그인하시면 다양한 서비스와 혜택을 받으실 수 있습니다.</dd>
							<dd>
								<label for="login_id" class="sound_only">회원아이디</label>
								<input type="text" name="id" id="login_id" class="frm_input" maxLength="20" placeholder="아이디">
							</dd>
							<dd>
								<label for="login_pw" class="sound_only">비밀번호</label>
								<input type="password" name="pw" id="login_pw" class="frm_input" maxLength="20"
									placeholder="비밀번호">
							</dd>
							<dd><button type="submit" class="btn_large">로그인</button></dd>
							<dd class="log_op">
								<span><input type="checkbox" name="auto_login" id="login_auto_login"> <label
										for="login_auto_login">자동로그인</label></span>
								<span class="fr"><a href="<%=request.getContextPath()%>/findCred.do">아이디 / 비밀번호 찾기</a></span>
							</dd>
						</dl>
						<div class="sns_btn">
							<h3>SNS 계정 로그인</h3>
							<a href="#" class="bt_naver snsLogin">
							<span class="bt_ic"><img src="http://demofran.com/img/ic_naver.png" alt="Sign in with naver"></span> 네이버 로그인
							</a>
							<a href="#" class="bt_kakao snsLogin">
							<span class="bt_ic"><img src="http://demofran.com/img/ic_kakao.png" alt="Sign in with kakao"></span> 카카오톡 로그인
							</a>
						</div>
 
					</div>
				</form>

				<form name="forderinquiry" method="post" action="http://demofran.com/shop/orderinquiry.php" autocomplete="off">
					<div class="login_wrap" id="guest_fld">
						<dl class="log_inner">
							<dt>비회원 주문조회</dt>
							<dd class="stxt">
								결제 완료 후 안내해드린 주문번호와 주문 결제 시에 작성한 비밀번호를 입력해주세요.
							</dd>
							<dd>
								<label for="od_id" class="sound_only">주문번호</label>
								<input type="text" name="od_id" id="od_id" class="frm_input" placeholder="주문번호">
							</dd>
							<dd>
								<label for="od_pwd" class="sound_only">비밀번호</label>
								<input type="password" name="od_pwd" id="od_pwd" class="frm_input" placeholder="비밀번호">
							</dd>
							<dd><button type="submit" class="btn_large">확인</button></dd>
						</dl>
					</div>
				</form>

				<div class="log_bt_box">
					회원가입하시고 풍성한 혜택을 누리세요.
					<a href="register.do" class="btn_lsmall bx-white marl15">회원가입</a>
				</div>
				<script src="js/toast.js"></script>
				<script>
				let sns_btns = document.querySelectorAll('.snsLogin');
				let url = '';
				<%
				String naverId = Const.NAVER_CLIENT_ID.getVal();
				String kakaoId = Const.KAKAO_CLIENT_ID.getVal();
				%>
				for(let i = 0; i < sns_btns.length; i++){
					sns_btns[i].addEventListener('click', function(e) {
						e.preventDefault();
						console.log(sns_btns[i]);
						
					if(sns_btns[i].classList.contains('bt_naver')){
						url = 'https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=<%=naverId%>&redirect_uri=http://localhost:8888naverLogin.do&state=<%=state%>'; 
					}else{
						url = 'https://kauth.kakao.com/oauth/authorize?client_id=<%=kakaoId%>&redirect_uri=http://localhost:8888kakaoLogin.do&response_type=code';
					}
					
						location.href=url;
					});
				}
				
				</script>
				<c:if test="${result == -1}">
                    <script>
                      Swal.fire({
                        title: '계정이 존재하지 않습니다',
                        text: '회원가입을 진행하시겠습니까?',
                        icon: 'question',
                        showCancelButton: true,
                        confirmButtonText: '예',
                        cancelButtonText: '아니오'
                      }).then(result => {
                        if (result.isConfirmed) {
                          window.location.href = 'register.do';
                        } else if (result.isDismissed) {
                	<% session.removeAttribute("result"); %>
                            window.location.href = 'login.do'
                        }
                      });
                    </script>
                  </c:if>
                 <c:if test='${loginFail eq "FAILURE"}'>
                 		<script>
                 		Toast.fire({
                 			icon : 'error',
                 			title : '아이디 및 비밀번호가 일치하지 않습니다'
                 			<%session.removeAttribute("loginFail");%>
                 		})
                 		</script>
                 </c:if>
				<script>
					$(function () {
						$("#login_auto_login").click(function () {
							if (this.checked) {
								this.checked = confirm("자동로그인을 사용하시면 다음부터 회원아이디와 비밀번호를 입력하실 필요가 없습니다.\n\n공공장소에서는 개인정보가 유출될 수 있으니 사용을 자제하여 주십시오.\n\n자동로그인을 사용하시겠습니까?");
							}
						});
					});

					function flogin_submit(f) {
						if (!f.mb_id.value) {
							alert('아이디를 입력하세요.');
							f.mb_id.focus();
							return false;
						}
						if (!f.mb_password.value) {
							alert('비밀번호를 입력하세요.');
							f.mb_password.focus();
							return false;
						}

						return true;
					}

					function fguest_submit(f) {
						if (!f.od_id.value) {
							alert('주문번호를 입력하세요.');
							f.od_id.focus();
							return false;
						}
						if (!f.od_pwd.value) {
							alert('비밀번호를 입력해주세요.');
							f.od_pwd.focus();
							return false;
						}

						return true;
					}

					$(document).ready(function () {
						$(".login_tab>li:eq(0)").addClass('active');
						$("#login_fld").addClass('active');

						$(".login_tab>li").click(function () {
							var activeTab = $(this).attr('data-tab');
							$(".login_tab>li").removeClass('active');
							$(".login_wrap").removeClass('active');
							$(this).addClass('active');
							$("#" + activeTab).addClass('active');
						});
					});
				</script>
			</div>
		</div>
<jsp:include page="../../layout/footer.jsp"/>