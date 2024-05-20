<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../layout/header.jsp" />
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

			<p class="tit_navi">
				홈 <i class="ionicons ion-ios-arrow-right"></i> 아이디/비밀번호 찾기
			</p>
			<h2 class="stit">ID & PASS</h2>
			<ul class="login_tab">
				<li data-tab="login_fld"><span>아이디 찾기</span></li>
				<li data-tab="guest_fld"><span>비밀번호 찾기</span></li>
			</ul>

			<div class="login_wrap" id="login_fld">
				<dl class="log_inner">
					<dt>아이디 찾기</dt>
					<dd class="stxt">회원가입 시 입력한 이름과 이메일을 입력해서 인증을 받아주세요</dd>
					<dd>
						<label for="login_id" class="sound_only">이름</label> <input
							type="text" name="name" id="name" class="frm_input"
							maxLength="20" placeholder="이름">
					</dd>
					<dd>
						<label for="login_pw" class="sound_only">이메일</label> 
						<input type="text" name="email" id="email" class="frm_input" maxLength="20" placeholder="이메일">
						<input type="text" class="frm_input" id="authenNum" size="8" maxlength="6">
                        <input type="button" id="emailChk" class="frm_input" value="이메일 인증"><label id="chkResult"></label>
					</dd>
					<dd>
						<button type="submit" id="findId" class="btn_large">찾기</button>
					</dd>
				</dl>
			</div>

			<div class="login_wrap" id="guest_fld">
				<dl class="log_inner">
					<dt>비밀번호 찾기</dt>
					<dd class="stxt">본인의 아이디와 회원가입 시 입력한 핸드폰 번호를 입력해서 인증을 받아주세요</dd>
					<dd>
						<label for="id" class="sound_only">아이디</label> <input type="text"
							name="id" id="id" class="frm_input" placeholder="아이디">
					</dd>
					<dd>
						<label for="phone" class="sound_only">핸드폰번호</label> 
						<input type="text" name="phone" id="phone" value="" class="frm_input" placeholder="핸드폰번호"> 
						<input type="text" class="frm_input" id="authenNumPhone" size="8" maxlength="6"> 
						<input type="button" id="phoneChk" class="frm_input" value="핸드폰 인증">
						<label id="chkResultPhone"></label>
					</dd>
					<dd>
						<button type="submit" id="searchBtn" class="btn_large">찾기</button>
					</dd>
				</dl>
			</div>

			<div class="log_bt_box">
				<label>아이디가 이미 있으신가요?<a
					href="<%=request.getContextPath()%>/login.do"
					class="btn_lsmall bx-white marl15">로그인</a></label> &nbsp;|&nbsp; <label>아이디가
					존재하지 않으신가요?<a href="<%=request.getContextPath()%>/register.do"
					class="btn_lsmall bx-white marl15">회원가입</a>
				</label>
			</div>

			<script src="js/toast.js"></script>
			<script src="js/sendEmail.js"></script>
			<script src="js/sendSMS.js"></script>
			<script>
				
				$('#searchBtn').on('click', function(){
					validateForm();
				});
				
				$('#findId').on('click', function(){
					if($('#name').val() && $('#email').val()){
				   		performAjaxRequest();
					}else{
						
						Toast.fire({
							icon: 'error',
							title: '이름 및 이메일을 입력해주세요!'
						});
					}
				});

				function findId() {
			        return new Promise((resolve, reject) => {
			            let name = $('#name').val();
			            let email = $('#email').val();

						 $.ajax({
			                url: 'findId.do',
			                type: 'POST',
			                data: {
			                    name: name,
			                    email: email
			                },
			                success: function (rst) {
			                    resolve(rst);
			                },
			                error: function (xhr, status, error) {
			                    reject('입력한 정보에 맞는 아이디를 찾을 수 없습니다!!');
			                }
			            });
			        });
				}

				function performAjaxRequest() {
		            let emailChk = $('#chkResult');
		            
				    Swal.fire({
				        title: 'Now Loading...',
				        allowOutsideClick: false,
				        didOpen: () => {
				            Swal.showLoading();
				        }
				    });
				    
				    if(emailChk.text() === '인증완료!!'){
				    	 findId()
					        .then((id) => {
					            Swal.close();

								Swal.fire({
									title: '아이디를 찾았습니다',
									html: '<p style="color:green; font-size: 16px; font-weight: bold;">'+id+'</p>'
								});
					        })
					        .catch((error) => {
					            Swal.close();
					            
								Toast.fire({
					                icon: 'error',
					                title: error
					            });
					        });
				    }else{
				    	Swal.close();
				    	
						Toast.fire({
							icon: 'warning',
							title: '이메일 인증이 필요합니다 인증 후 다시 시도해주세요'
						});
					}

				}
				
				function validateForm() {
					$('#searchBtn').preventDefault;
				    let resultPhone = document.querySelector('#chkResultPhone');
				    var accNo;

				    if (resultPhone.textContent === '인증완료!!') {
				        let id = $('#id').val();
				        let phone = $('#phone').val();

				        $.ajax({
				            url: 'findCred.do',
				            type: 'POST',
				            data: {
				                action: 'findPw',
				                id: id,
				                phone: phone
				            },
				            success: function (rst) {
				            	accNo = rst;

				                Swal.fire({
				                	icon: 'success',
				                    title: '변경하실 비밀번호를 입력해주세요',
				                    html: '<input type="password" id="pw" class="swal2-input" placeholder="비밀번호">' +
				                        '<input type="password" id="pwChk" class="swal2-input" placeholder="비밀번호확인">',
				                    showCancelButton: true,
				                    confirmButtonText: '변경',
				                    cancelButtonText: '취소',

				                    preConfirm: () => {
				                        const pw = Swal.getPopup().querySelector('#pw').value;
				                        const pwChk = Swal.getPopup().querySelector('#pwChk').value;

				                        // 비밀번호 일치 여부 검사
				                        if (pw !== pwChk) {
				                            Swal.showValidationMessage('비밀번호가 일치하지 않습니다. 다시 시도해주세요.');
				                        }

				                        return { pw: pw };
				                    }
				                }).then((result) => {
				                    if (result.isConfirmed) {
				                        const newPassword = result.value.pw;

				                        $.ajax({
				                            url: 'changePw.do',
				                            type: 'POST',
				                            data: {
				                                action: 'changePw',
				                                pw: newPassword,
				                                accNo: accNo
				                            },
				                            success: function () {
				                                Swal.fire({
				                                	icon: 'success',
				                                	title: '비밀번호가 성공적으로 변경되었습니다'
				                                }).then(() => {
				                                	location.href='login.do';
				                                });
				                            },
				                            error: function () {
				                                Swal.fire({
				                                	icon: 'error',
				                                	title: '비밀번호 수정 실패하였습니다 다시 시도해주세요'
				                                })
				                            }
				                        });
				                    }
				                });
				            },
				            error: function () {
				                Swal.fire({
				                    icon: 'error',
				                    title: '입력한 정보를 찾을 수 없습니다. 다시 시도해주세요'
				                }).then(() => {
				                    location.href = 'findCred.do';
				                });
				            }
				        });
				    } else {
				        Toast.fire({
				            icon: 'warning',
				            title: '핸드폰 인증을 먼저 진행해주세요'
				        });
				        return false;
				    }
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

	<jsp:include page="../../layout/footer.jsp" />