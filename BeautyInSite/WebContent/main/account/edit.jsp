<%@page import="com.cosmetic.member.account.vo.SkinVO"%>
<%@page import="com.cosmetic.member.account.vo.AccountVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../layout/header.jsp"/>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.custom-file-upload {
  border: 1px solid #ccc;
  display: inline-block;
  padding: 3px 7px;
  cursor: pointer;
  margin: 5px 0px 0px 12px;
}

.custom-file-upload:hover {
  background-color: #f5f5f5;
}

#selectedFileName {
  margin-left: 10px;
  
}
.edit_title {
	font-size: 25px;
}
</style>
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

				<!-- 회원정보 입력/수정 시작 { -->
				<h2 class="pg_tit">
					<span>회원정보 수정</span>
					<p class="pg_nav">마이 페이지<i>&gt;</i>회원정보 수정</p>
				</h2>

			<script src="assets/js/jquery.register_form.js"></script>
				<%
					AccountVO accVO = (AccountVO) session.getAttribute("LOGIN_USER"); 
					SkinVO skVO = (SkinVO) request.getAttribute("skVO");
				%>
				<form name="fregisterform" id="editForm" action="<%=request.getContextPath() %>/edit.do" method="post" autocomplete="off" enctype="multipart/form-data">
                <input type="hidden" name="accNo" value="<%=accVO.getAccNo()%>">
                <h4 class="mart30 edit_title">기본정보</h4>
                <div class="tbl_frm01 tbl_wrap">
                    <table>
                        <colgroup>
                            <col class="w140">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><label for="mb_profileImg">프로필 이미지</label></th>
                            	<td>
                                <div id="imagePreview" style="border: 1px solid white; border-radius: 25%; overflow: hidden; width: 100px; height: 100px;">
                                <img id="preview" style="width: 100%; height: 100%;" src="data:image/jpg;base64,<%=accVO.getImgProfile() %>" alt="미리보기">
                                <input type="hidden" name="imgProfile" value="<%=accVO.getImgProfile()%>">
                                </div>
                                <label for="fileInput" class="custom-file-upload"> 파일 선택
	                           	<input type="file" name="profileImg" id="fileInput" style="display:none;"onchange="prevProfileImg()">
	                           	</label>
	                           	<td>
                            </tr>
                            <tr>
                                <th scope="row"><label for="id">아이디</label></th>
                                <td colspan="2">
                             	<input type="text" name="id" id="id" value="<%=accVO.getId()%>" required class="frm_input required" readonly>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <h4 class="mart30 edit_title">개인정보</h4>
                <div class="tbl_frm01 tbl_wrap">
                    <table>
                        <colgroup>
                            <col class="w140">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><label for="reg_mb_name">이름</label></th>
                                <td><input type="text" name="name" value="<%=accVO.getName() %>" required class="frm_input required" readonly>
                            </tr>
                            <tr>
                                <th scope="row"><label for="reg_mb_name">성별</label></th>
                                <td>
                                	<c:choose>
                                	<c:when test='${LOGIN_USER.gender eq "0"}'>
                                    	<p>남성</p>
                                	</c:when>
									<c:otherwise>
                                    	<p>여성</p>
									</c:otherwise>                                	
                                	</c:choose>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><label for="birth">생년월일</label></th>
                                <td><input type="text" name="ssn" required class="frm_input required" id="birth" value="<%=accVO.getSsn()%>" readonly>
                            </tr>
                            <tr>
                                <th scope="row"><label for="phone">휴대폰번호</label></th>
                                <td><input type="text" name="tel" value="<%=accVO.getTel()%>"
                                id="phone" required class="frm_input required" placeholder="휴대폰번호" size="20" maxlength="11" data-info="'-' 제외하고 입력해주세요">
                            </tr>
                            <tr>
                                <th scope="row"><label for="email">E-mail</label></th>
                                <td><input type="text" name="email" value="<%=accVO.getEmail() %>"
                                    id="email" required class="frm_input required"
                                    placeholder="이메일" data-info="ex:(example@gmail.com)" size="40"
                                    maxlength="100">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">주소</th>
                                <td><label for="reg_mb_zip" class="sound_only">우편번호</label>
                                    <input type="text" name="zipCode" value="<%=accVO.getZipCode() %>" id="sample6_postcode" required class="frm_input required" size="8" maxlength="5">
                                    <button type="button" class="btn_small" onclick="sample6_execDaumPostcode();">주소검색</button> <br>
                                    <input type="text" name="addr1" value="<%=accVO.getAddr1() %>" id="sample6_address" required class="frm_input required frm_address" size="60">
                                    <label for="sample6_address">기본주소</label><br> <input type="text" name="addr2" value="<%=accVO.getAddr2() %>" id="sample6_detailAddress" required class="frm_input frm_address" size="60"> <label for="sample6_detailAddress">상세주소</label><br> 
                                    <input type="hidden" name="addr3" value="" id="sample6_extraAddress" class="frm_input frm_address" size="60"></td>
                            </tr>
                        </tbody>
                    </table>
                    <h4 class="mart30 edit_title">피부타입 수정</h4>
                    <div class="tbl_frm01 tbl_wrap">
                        <table>
                            <colgroup>
                                <col class="w140">
                                <col>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><label for="4">피부타입</label></th>
                                    <td>
                                    <label><input type="radio" name="skType" value="지성" id="1" class="frm_input required">지성</label>
                                    <label><input type="radio" name="skType" value="건성" id="2" class="frm_input required">건성</label>
                                    <label><input type="radio" name="skType" value="중성" id="3" class="frm_input required">중성</label>
                                    <label><input type="radio" name="skType" value="복합성" id="4" class="frm_input required">복합성</label>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" rowspan="4"><label for="">피부고민</label></th>
                                    <td>
                                     <label><input type="checkbox" name="trouble" value="ATOPI">아토피</label>
                                     <label><input type="checkbox" name="trouble" value="MINGAM">민감성</label>
                                     <label><input type="checkbox" name="trouble" value="SCNE">여드름</label>
                                     </td>
                                </tr>
                                <tr>
                                    <td>
                                    <label><input type="checkbox" name="trouble" value="MIBAEG">미백/잡티</label>
                                    <label><input type="checkbox" name="trouble" value="PIGI">피지/블랙헤드</label>
                                    <label><input type="checkbox" name="trouble" value="DARK">다크서클</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    <label><input type="checkbox" name="trouble" value="DRY">속건조</label>
                                    <label><input type="checkbox" name="trouble" value="JULEUM">주름/탄력</label>
                                    <label><input type="checkbox" name="trouble" value="HONGJO">홍조</label>
                                    <label><input type="checkbox" name="trouble" value="GAGJIL">각질</label>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <h4 class="mart30 edit_title">비밀번호 확인</h4>
                        <div class="tbl_frm01 tbl_wrap">
                        <table>
                         <tr>
                               <th scope="row"><label for="pw">비밀번호</label></th>
                               <td><input type="password" name="pw" id="pw" required class="frm_input required" placeholder="비밀번호"></td>
                         </tr>
                        </table>
                        </div>
                    </div>
                </div>

                <div class="btn_confirm">
                    <input type="button" value="수정하기" onclick="pwChk()" id="btn_submit" class="btn_large wset" accesskey="s"> 
                    <a href="<%=request.getContextPath() %>/main/index.do" class="btn_large bx-white">취소</a>
                </div>
            </form>
            
				<script src="js/toast.js"></script>
				<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
				<script>
				
					function pwChk(){
						
					    let pw = document.querySelector('#pw').value;
					    
					    if(pw === ''){
					    	Toast.fire({
					    		icon: 'warning',
					    		title: '현재 비밀번호를 입력해주세요!'
					    	})
					    	return false;
					    }
					    let accNo = <%=accVO.getAccNo()%>;
					    
					    $.ajax({
					    	url: '<%=request.getContextPath()%>/pwChk.do',
							type: 'POST',
							data: {
								pw: pw,
								accNo: accNo
							},
							success: function(rst) {
								if(rst === 'SUCCESS'){
									Toast.fire({
										icon: 'success',
										title: '비밀번호 일치!'
									})
									
									setTimeout(function(){
										$('#editForm').submit();
									}, 1100);
								}else{
									Toast.fire({
										icon: 'error',
										title: '비밀번호 불일치!'
									})
								}
							},
							error: function(xhr){
								console.log(xhr.status);
							}
					    });
					}
				
					let myType = '<%=skVO.getSkType()%>';
					let skType = document.querySelectorAll('input[name="skType"]');
					
					let myTrouble = [
						{	
							ATOPI : '<%=skVO.getAtopi()%>',
							MINGAM : '<%=skVO.getMingam()%>',
							SCNE : '<%=skVO.getScne()%>',
							MIBAEG : '<%=skVO.getMibaeg()%>',
							PIGI : '<%=skVO.getPigi()%>',
							DARK : '<%=skVO.getDark()%>',
							DRY : '<%=skVO.getDry()%>',
							JULEUM : '<%=skVO.getJuleum()%>',
							HONGJO : '<%=skVO.getHongjo()%>',
							GAGJIL : '<%=skVO.getGagjil()%>'
						}
					];
					let skTrouble = document.querySelectorAll('input[name="trouble"]');
					
					for(let i=0; i < skTrouble.length; i++){
						if(skTrouble[i].value in myTrouble[0]){
							if(myTrouble[0][skTrouble[i].value] === 'Y'){
								skTrouble[i].checked = true;
							}else{
								skTrouble[i].checked = false;								
							}
						}else{
							skTrouble[i].checked = false;
						}
					}
					
					
					skType.forEach(function(type){
						if(type.value === myType){
							type.checked = true;
						}else{
							type.checked = false;
						}
					});
					
					

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
				                if(data.userSelectedType === 'R'){
				                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
				                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
				                        extraAddr += data.bname;
				                    }
				                    // 건물명이 있고, 공동주택일 경우 추가한다.
				                    if(data.buildingName !== '' && data.apartment === 'Y'){
				                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				                    }
				                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				                    if(extraAddr !== ''){
				                        extraAddr = ' (' + extraAddr + ')';
				                    }
				                    // 조합된 참고항목을 해당 필드에 넣는다.
				                    document.getElementById("sample6_extraAddress").value = extraAddr;
				                
				                } else {
				                    document.getElementById("sample6_extraAddress").value = '';
				                }

				                // 우편번호와 주소 정보를 해당 필드에 넣는다.
				                document.getElementById('sample6_postcode').value = data.zonecode;
				                document.getElementById("sample6_address").value = addr;
				                // 커서를 상세주소 필드로 이동한다.
				                document.getElementById("sample6_detailAddress").focus();
				            }
				        }).open();
				    }
					
					function prevProfileImg() {
	                    let fileInput = document.getElementById('fileInput');
	                    let prev = document.getElementById('imagePreview');
	                    let prevImg = document.getElementById('preview');

	                    var file = fileInput.files[0];

	                    if (file) {
	                        let reader = new FileReader();

	                        reader.onload = function(e) {
	                            prevImg.src = e.target.result;
	                        };

	                        reader.readAsDataURL(file);
	                    } else {
	                        prevImg.src = '';
	                    }
	                }
				</script>
				<!-- } 회원정보 입력/수정 끝 -->
			</div>
		</div>
		<jsp:include page="../../layout/footer.jsp"/>