<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="admin/css/admin.css">
<link type="text/css" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/themes/base/jquery-ui.css" rel="stylesheet">
<link type="text/css" href="plugin/jquery-ui/style.css">
<link rel="shortcut icon" href="http://demofran.com/data/banner/JnLfWUSUyR6sXJP5n3Re4Fvdc93k93.ico" type="image/x-icon">
<link href="https://cdn.jsdelivr.net/npm/fontawesome-6-pro@6.4.0/css/all.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Diphylleia&family=Hi+Melody&family=Noto+Sans+KR:wght@200;300;400;500&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/source/sweetalert2.min.css">
<link rel="stylesheet" href="css/source/animate.min.css">
<link rel="stylesheet" href="css/animated.css">
<script>
// 자바스크립트에서 사용하는 전역변수 선언
var tb_url		 = "http://demofran.com";
var tb_bbs_url	 = "http://demofran.com/bbs";
var tb_shop_url  = "http://demofran.com/shop";
var tb_admin_url = "http://demofran.com/admin";
</script>
<script src="assets/js/jquery-3.5.1.min.js"></script>
<script src="assets/js/jquery-ui-1.10.3.custom.js"></script>
<script src="assets/js/common.js"></script>
<script src="assets/js/categorylist.js"></script>
<script src="js/source/sweetalert2.all.min.js"></script>
</head>
<body>
<header id="hd">
	<div id="hd_wrap">
		<h1>행복을 주는 쇼핑몰!</h1>
		<div id="logo"><a href="<%=request.getContextPath()%>/admin/index.do"><img src="http://demofran.com/admin/img/logo.gif" alt="행복을 주는 쇼핑몰! 관리자"></a></div>
		<div id="tnb">
			<ul>
				<li>BEAUTY IN SITE</li>
				<!-- <li>오늘:22, 어제:58, 최대:739, 전체:160861</li> -->
				<li><a href="<%=request.getContextPath()%>/admin/index.do">관리자홈</a></li>
				<li><a href="<%=request.getContextPath()%>/index.do">쇼핑몰</a></li>
				<li id="tnb_logout"><a href="<%=request.getContextPath()%>/logout.do">로그아웃</a></li>
			</ul>
		</div>

		<nav id="gnb">
			<h2>관리자 주메뉴</h2>
			<ul id="gnb_1dul">
				<li class="gnb_1dli">
					<a href="manageList.do" class="gnb_1da">회원관리</a>
				</li>
				<!-- <li class="gnb_1dli">
					<a href="http://demofran.com/admin/partner.php?code=plist" class="gnb_1da">가맹점관리</a>
				</li>
				<li class="gnb_1dli">
					<a href="http://demofran.com/admin/seller.php?code=list" class="gnb_1da">공급사관리</a>
				</li> -->
				<li class="gnb_1dli">
					<a href="<%=request.getContextPath()%>/admin/category.do" class="gnb_1da">카테고리 관리</a>
				</li>
				<!-- <li class="gnb_1dli">
					<a href="http://demofran.com/admin/goods.php?code=list" class="gnb_1da">상품관리</a>
				</li> -->
				<li class="gnb_1dli">
					<a href="<%=request.getContextPath() %>/admin/orderlist.do" class="gnb_1da">주문 및 상품관리</a>
				</li>
				<li class="gnb_1dli">
					<a href="#" class="gnb_1da">통계분석</a>
				</li>
				<!-- <li class="gnb_1dli">
					<a href="http://demofran.com/admin/help.php?code=qa" class="gnb_1da">고객지원</a>
				</li> 
				<li class="gnb_1dli">
					<a href="http://demofran.com/admin/design.php?code=banner_list" class="gnb_1da">디자인관리</a>
				</li>
				<li class="gnb_1dli">
					<a href="http://demofran.com/admin/config.php?code=default" class="gnb_1da">환경설정</a>
				</li> -->
			</ul>
		</nav>
	</div>
</header>