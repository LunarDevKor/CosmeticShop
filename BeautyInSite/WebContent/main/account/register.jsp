<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../layout/header.jsp" />
<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        input.invalid {
            border-color: red;
        }

        .err-msg {
            color: red;
        }
    </style>
    <link rel="stylesheet" href="css/animated.css">
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
            $(function() {
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
                $('#up').click(function() {
                    if (Flag == 1) {
                        alert('목록의 처음입니다.');
                    } else {
                        Flag--;
                        $('.c' + Flag).css('display', 'block');
                        $('.c' + (Flag + 1)).css('display', 'none');
                    }
                    $('#stv_pg').text(Flag + '/' + EOFlag); // 페이지 값 재설정
                })
                $('#down').click(function() {
                    if (Flag == EOFlag) {
                        alert('더 이상 목록이 없습니다.');
                    } else {
                        Flag++;
                        $('.c' + Flag).css('display', 'block');
                        $('.c' + (Flag - 1)).css('display', 'none');
                    }
                    $('#stv_pg').text(Flag + '/' + EOFlag); // 페이지 값 재설정
                });

                $(window).scroll(function() {
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
                $("#anc_up").click(function() {
                    $("html, body").animate({
                        scrollTop: 0
                    }, 400);
                });

                // 하위로이동
                $("#anc_dw").click(function() {
                    $("html, body").animate({
                        scrollTop: $(document).height()
                    }, 400);
                });

                // 좌/우 퀵메뉴 높이 자동조절
                var Theight = $("#header").height() - $("#gnb").height();
                var ptop = 20;
                $("#qcr, #qcl").css({
                    'top': ptop + 'px'
                });

                $(window).scroll(function() {
                    if ($(this).scrollTop() > Theight) {
                        $("#qcr, #qcl").css({
                            'position': 'fixed',
                            'top': '67px',
                            'z-index': '999'
                        });
                    } else {
                        $("#qcr, #qcl").css({
                            'position': 'absolute',
                            'top': ptop + 'px'
                        });
                    }
                });
            });
        </script>
        <!-- } 우측 퀵메뉴 끝 -->
        <div class="cont_inner">

            <!-- 회원정보 입력/수정 시작 { -->
            <h2 class="pg_tit">
                <span>회원가입</span>
                <p class="pg_nav">
                    HOME<i>&gt;</i>회원가입
                </p>
            </h2>

            <script src="assets/js/jquery.register_form.js"></script>

            <form name="fregisterform" id="fregisterform" action="register.do" onsubmit="return fregisterform_submit(this);" method="post" autocomplete="off" enctype="multipart/form-data">
                <input type="hidden" name="w" value=""> <input type="hidden" name="agree" value="1"> <input type="hidden" name="agree2" value="1"> <input type="hidden" name="mb_recommend" id="reg_mb_recommend" value="admin"> <input type="hidden" name="cert_type" value=""> <input type="hidden" name="cert_no" value=""> <input type="hidden" name="naverId" value="${naverProfile['id']}"> <input type="hidden" name="kakaoId" value="${kakaoProfile['id']}">
                <h3>사이트 이용정보 입력</h3>
                <div class="tbl_frm01 tbl_wrap">
                    <table>
                        <colgroup>
                            <col class="w140">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><label for="id">아이디</label></th>
                                <td><input type="text" name="id" id="id" required class="frm_input required" placeholder="아이디" data-info="영문 대/소문자 또는 숫자를 포함한 4-12 글자 내로 입력하세요." size="20" maxlength="20"> <span id="idErr" class="err-msg"></span>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><label for="pw">비밀번호</label></th>
                                <td><input type="password" name="pw" id="pw" required class="frm_input required" placeholder="비밀번호" data-info="특수문자를 포함한 영문 대/소문자 또는 숫자  8-20 글자 내로 입력하세요." size="20" maxlength="20"> <span id="pwErr" class="err-msg"></span></td>
                            </tr>
                            <tr>
                                <th scope="row"><label for="reg_mb_password_re">비밀번호
                                        확인</label></th>
                                <td><input type="password" name="mb_password_re" id="pwChk" required class="frm_input required" placeholder="비밀번호 확인" size="20" maxlength="20"> <span id="pwChkErr" class="err-msg"></span></td>
                            </tr>
                            <tr>
                                <th scope="row"><label for="mb_profileImg">프로필 이미지</label>
                                    <div id="imagePreview" style="border: 1px solid white; border-radius: 25%; overflow: hidden; width: 100px; height: 100px;">
                                        <img id="preview" style="width: 100%; height: 100%;" src="img/default_profile.png" alt="미리보기">
                                    </div>
                                </th>
                                <td><input type="file" name="profileImg" id="mb_profileImg" onchange="prevProfileImg()"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <h3 class="mart30">개인정보 입력</h3>
                <div class="tbl_frm01 tbl_wrap">
                    <table>
                        <colgroup>
                            <col class="w140">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><label for="reg_mb_name">이름</label></th>
                                <td><input type="text" name="name" 
                                <c:choose> 
                               <c:when test="${naverProfile['id'] != null}">
                                        value="${naverProfile['name']}"
                                    </c:when>
                                    <c:when test="${kakaoProfile['id'] != null}">
                                        value="${kakaoProfile['name']}"
                                    </c:when>
                                    <c:otherwise>
                                        value=""
                                    </c:otherwise>
                                    </c:choose>
                                
                                required class="frm_input required" placeholder="이름" data-info="2-5글자 내 한글 이름 입력해주세요" size="20"> <span id="nameErr" class="err-msg"></span></td>
                            </tr>
                            <tr>
                                <th scope="row"><label for="reg_mb_name">성별</label></th>
                                <td>
                                    <c:choose>

                                        <c:when test='${naverProfile["gender"] eq "M" or kakaoProfile["gender"] eq "male"}'>
                                            <label><input type="radio" required class="frm_input required" name="gender" value="0" checked>남성</label>
                                            <label><input type="radio" required class="frm_input required" name="gender" value="1">여성</label>
                                        </c:when>
                                        <c:when test='${naverProfile["gender"] eq "F" or kakaoProfile["gender"] eq "female"}'>
                                            <label><input type="radio" required class="frm_input required" name="gender" value="0">남성</label>
                                            <label><input type="radio" required class="frm_input required" name="gender" value="1" checked>여성</label>
                                        </c:when>
                                        <c:otherwise>
                                            <label><input type="radio" required class="frm_input required" name="gender" value="0">남성</label>
                                            <label><input type="radio" required class="frm_input required" name="gender" value="1">여성</label>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><label for="birth">생년월일</label></th>
                                <td><input type="text" name="ssn" required class="frm_input required" id="birth" 
                                
                                	<c:choose> 
                               <c:when test="${naverProfile['id'] != null}">
                                        value="${naverProfile['birth']}"
                                    </c:when>
                                    <c:when test="${kakaoProfile['id'] != null}">
                                        value="${kakaoProfile['birth']}"
                                    </c:when>
                                    <c:otherwise>
                                        value=""
                                    </c:otherwise>
                                    </c:choose>
                                
                                size="20" maxlength="6" placeholder="생년월일" data-info="생년월일이 올바르지 않습니다 ex:(YYMMDD)">
                                    <span id="birthErr" class="err-msg"></span></td>
                            </tr>
                            <tr>
                                <th scope="row"><label for="phone">휴대폰번호</label></th>
                                <td><input type="text" name="tel" 
                               	<c:choose> 
                               <c:when test="${naverProfile['id'] != null}">
                                        value="${naverProfile['phone']}"
                                    </c:when>
                                    <c:when test="${kakaoProfile['id'] != null}">
                                        value="${kakaoProfile['phone']}"
                                    </c:when>
                                    <c:otherwise>
                                        value=""
                                    </c:otherwise>
                                    </c:choose>
                                
                                id="phone" required class="frm_input required" placeholder="휴대폰번호" size="20" maxlength="11" data-info="'-' 제외하고 입력해주세요"> <span id="phoneErr" class="err-msg"></span> <span class="frm_info">
                                        <input type="text" class="frm_input" id="authenNumPhone" size="8" maxlength="6"> <input type="button" id="phoneChk" class="frm_input" value="핸드폰 인증"><label id="chkResultPhone"></label>
                                    </span></td>
                            </tr>
                            <tr>
                                <th scope="row"><label for="email">E-mail</label></th>
                                <td><input type="text" name="email" <c:choose>
                                    <c:when test="${naverProfile['id'] != null}">
                                        value="${naverProfile['email']}"
                                    </c:when>
                                    <c:when test="${kakaoProfile['id'] != null}">
                                        value="${kakaoProfile['email']}"
                                    </c:when>
                                    <c:otherwise>
                                        value=""
                                    </c:otherwise>
                                    </c:choose>
                                    id="email" required class="frm_input required"
                                    placeholder="이메일" data-info="ex:(example@gmail.com)" size="40"
                                    maxlength="100"> <span id="emailErr" class="err-msg"></span>
                                    <span class="frm_info"> <input type="text" class="frm_input" id="authenNum" size="8" maxlength="6">
                                        <input type="button" id="emailChk" class="frm_input" value="이메일 인증"><label id="chkResult"></label>
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">주소</th>
                                <td><label for="reg_mb_zip" class="sound_only">우편번호</label>
                                    <input type="text" name="zipCode" value="" id="sample6_postcode" required class="frm_input required" size="8" maxlength="5">
                                    <button type="button" class="btn_small" onclick="sample6_execDaumPostcode();">주소검색</button> <br>
                                    <input type="text" name="addr1" value="" id="sample6_address" required class="frm_input required frm_address" size="60">
                                    <label for="sample6_address">기본주소</label><br> <input type="text" name="addr2" value="" id="sample6_detailAddress" required class="frm_input frm_address" size="60"> <label for="sample6_detailAddress">상세주소</label><br> <input type="text" name="addr3" value="" id="sample6_extraAddress" class="frm_input frm_address" size="60"> <label for="sample6_extraAddress">참고항목</label><br></td>
                            </tr>
                        </tbody>
                    </table>
                    <h3>피부선택(Optional)</h3>
                    <div class="tbl_frm01 tbl_wrap">
                        <table>
                            <colgroup>
                                <col class="w140">
                                <col>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><label for="4">피부타입</label></th>
                                    <td><label><input type="radio" name="skType" value="지성" id="1" class="frm_input required">지성</label> <label><input type="radio" name="skType" value="건성" id="2" class="frm_input required">건성</label> <label><input type="radio" name="skType" value="중성" id="3" class="frm_input required">중성</label> <label><input type="radio" name="skType" value="복합성" id="4" class="frm_input required">복합성</label></td>
                                </tr>
                                <tr>
                                    <th scope="row" rowspan="4"><label for="">피부고민</label></th>
                                    <td><label><input type="checkbox" name="trouble" value="ATOPI">아토피</label> <label><input type="checkbox" name="trouble" value="MINGAM">민감성</label> <label><input type="checkbox" name="trouble" value="SCNE">여드름</label></td>
                                </tr>
                                <tr>
                                    <td><label><input type="checkbox" name="trouble" value="MIBAEG">미백/잡티</label> <label><input type="checkbox" name="trouble" value="PIGI">피지/블랙헤드</label> <label><input type="checkbox" name="trouble" value="DARK">다크서클</label></td>
                                </tr>
                                <tr>
                                    <td><label><input type="checkbox" name="trouble" value="DRY">속건조</label> <label><input type="checkbox" name="trouble" value="JULEUM">주름/탄력</label> <label><input type="checkbox" name="trouble" value="HONGJO">홍조</label> <label><input type="checkbox" name="trouble" value="GAGJIL">각질</label></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="btn_confirm">
                    <input type="submit" value="회원가입" id="btn_submit" class="btn_large wset" accesskey="s"> <a href="main/index.do" class="btn_large bx-white">취소</a>
                </div>
            </form>
			<% 
			session.removeAttribute("naverProfile");
			session.removeAttribute("kakaoProfile");
			%>
            <script src="js/toast.js"></script>
            <script src="js/isValid.js"></script>
            <script src="js/sendEmail.js"></script>
            <script src="js/sendSMS.js"></script>
            <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
            <script>
                function sample6_execDaumPostcode() {
                    new daum.Postcode({
                        oncomplete: function(data) {
                            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                            var addr = ''; // 주소 변수
                            var extraAddr = ''; // 참고항목 변수

                            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                                addr = data.roadAddress;
                            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                                addr = data.jibunAddress;
                            }

                            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                            if (data.userSelectedType === 'R') {
                                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                if (data.bname !== '' &&
                                    /[동|로|가]$/g.test(data.bname)) {
                                    extraAddr += data.bname;
                                }
                                // 건물명이 있고, 공동주택일 경우 추가한다.
                                if (data.buildingName !== '' &&
                                    data.apartment === 'Y') {
                                    extraAddr += (extraAddr !== '' ? ', ' +
                                        data.buildingName :
                                        data.buildingName);
                                }
                                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                if (extraAddr !== '') {
                                    extraAddr = ' (' + extraAddr + ')';
                                }
                                // 조합된 참고항목을 해당 필드에 넣는다.
                                document
                                    .getElementById("sample6_extraAddress").value = extraAddr;

                            } else {
                                document
                                    .getElementById("sample6_extraAddress").value = '';
                            }

                            // 우편번호와 주소 정보를 해당 필드에 넣는다.
                            document.getElementById('sample6_postcode').value = data.zonecode;
                            document.getElementById("sample6_address").value = addr;
                            // 커서를 상세주소 필드로 이동한다.
                            document.getElementById(
                                "sample6_detailAddress").focus();
                        }
                    }).open();
                }

                function prevProfileImg() {
                    let fileInput = document.getElementById('mb_profileImg');
                    let prev = document.getElementById('immagePreview');
                    let prevImg = document.getElementById('preview');

                    var file = fileInput.files[0];

                    if (file) {
                        let reader = new FileReader();

                        reader.onload = function(e) {
                            prevImg.src = e.target.result;
                        };

                        reader.readAsDataURL(file);

                        prev.style.display = 'block';
                    } else {
                        prevImg.src = '';
                        prev.style.display = 'none';
                    }
                }
            </script>
            <!-- } 회원정보 입력/수정 끝 -->
        </div>
    </div>
    <jsp:include page="../../layout/footer.jsp" />