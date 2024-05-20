<%@page import="java.math.BigDecimal"%>
<%@page import="com.cosmetic.member.account.vo.AccountVO"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="java.sql.Clob"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.Reader"%>
<jsp:include page="../layout/header.jsp"/>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	AccountVO accVO = (AccountVO) request.getSession(false).getAttribute("LOGIN_USER");
	List<Map<String, Object>> newList = (List<Map<String, Object>>)request.getAttribute("newList");
	List<Map<String, Object>> bestList = (List<Map<String, Object>>)request.getAttribute("bestList");

%>
			
	<!-- 메인 슬라이드배너 시작 { -->
	<div id="mbn_wrap">
		<!-- <div class="mbn_img" style="background:#eeeeee url('http://demofran.com/data/banner/Q9Kb37h7rETJmvCA8R31bkkxrjUq6Z.jpg') no-repeat top center;"></div> -->
		<!-- <div class="mbn_img" style="background:#e7edfa url('http://demofran.com/data/banner/c4nVXYmE6PnNnGtz2vHLmaZdXWJtE3.jpg') no-repeat top center;"></div> -->
		<!-- <div class="mbn_img" style="background:#fee3df url('http://demofran.com/data/banner/eCx2X32v8tmnS2drdKQgCAjWYF8nfF.jpg') no-repeat top center;"></div> -->
		<div class="mbn_img" style="background:#eeeeee url('./imgSource/banner1.png') no-repeat top center;"></div>
		<div class="mbn_img" style="background:#e7edfa url('./imgSource/banner2.png') no-repeat top center;"></div>
		<div class="mbn_img" style="background:#fee3df url('./imgSource/banner3.png') no-repeat top center;"></div>
	</div>
		<script>
		$(function() {
						var txt_arr = ["1\ubc88 \ud14d\uc2a4\ud2b8","2\ubc88 \ud14d\uc2a4\ud2b8","3\ubc88 \ud14d\uc2a4\ud2b8"];

			$('#mbn_wrap').slick({
				autoplay: true,
				autoplaySpeed: 4000,
				dots: true,
				fade: true,
				customPaging: function(slider, i) {
					return "<span>"+txt_arr[i]+"</span>";
				} 
			});
			/* $('#mbn_wrap .slick-dots li').css('width', '33.333333333333%'); */
			$('#mbn_wrap .slick-dots li').css('display', 'none');});
		</script>
		<!-- } 메인 슬라이드배너 끝 -->


	<div id="container">

<div class="cont_wrap">
	<!-- 베스트 쇼핑특가 및 배너 시작 { -->
	<div class="best_wrap">
		<!-- <div class="bnr1"><img src="http://demofran.com/data/banner/Wu8kdNjC5zMm6HRzVtzmZ8tg1CRfb6.jpg" width="280" height="400"></div> -->
		<div class="bnr2" data-aos="fade-right" data-aos-once="true" data-aos-duration="800"><img src="./imgSource/mini3.png" width="710" height="195"></div>
		<div class="bnr3" data-aos="fade-right" data-aos-once="true" data-aos-duration="800"><img src="./imgSource/mini4.png" width="710" height="195"></div>
		<div class="best_rol_slide">
			<h2>베스트셀러</h2>
						<div class="best_rol">
					
				<%
				
				if(bestList.size() ==0 ){
				%>		
				
				
					<p> 신상품 내역이 없습니다.</p>
				
				
				<%
				}else{
					
				
					for(Map<String, Object> bm : bestList) {
						
				 %>
				<dl>
					<dd class="sale">Best</dd>					
					<a href="prodDetail.do?prodNo=<%=bm.get("PROD_NO")%>">
						<dt class="pimg"><img src="<%=bm.get("PROD_IMG") %>" width="190" height="190"></dt>
						<dd class="pname"><%=bm.get("PROD_NAME")%></dd>
						<dd class="price"><!-- <span class="spr">46,000<span>원</span></span> --><span class="mpr"><%=bm.get("PROD_PRICE") %><span>원</span></span></dd>
					</a>
					<dd class="ic_bx"><span onclick="javascript:itemlistwish('16');" id="16" class="16 zzim"></span> <a href="http://demofran.com/shop/view.php?index_no=16" target="_blank" class="nwin"></a></dd>
				</dl>
				<%
					}
				}

				%>
<!-- 								<dl>
					<dd class="sale">Best%</dd>					<a href="http://demofran.com/shop/view.php?index_no=14">
						<dt class="pimg"><img src="http://demofran.com/data/goods/1483411431/thumb-95S2lNwQks3caPhpLyDPjPWygyeCsC_190x190.jpg" width="190" height="190"></dt>
						<dd class="pname">Mathey-Tissot 심플 서류가방+백팩 블랙세트</dd>
						<dd class="price"><span class="spr">176,000<span>원</span></span><span class="mpr">70,000<span>원</span></span></dd>
					</a>
					<dd class="ic_bx"><span onclick="javascript:itemlistwish('14');" id="14" class="14 zzim"></span> <a href="http://demofran.com/shop/view.php?index_no=14" target="_blank" class="nwin"></a></dd>
				</dl>
								<dl>
					<dd class="sale">Best%</dd>					<a href="http://demofran.com/shop/view.php?index_no=13">
						<dt class="pimg"><img src="http://demofran.com/data/goods/1483411346/thumb-cgv31q6CGaR3YASGhNQGY2XR4m4NKJ_190x190.jpg" width="190" height="190"></dt>
						<dd class="pname">[에스로체] 20인치 PC 캐리어 ER-CSM2-15320</dd>
						<dd class="price"><span class="spr">162,000<span>원</span></span><span class="mpr">63,900<span>원</span></span></dd>
					</a>
					<dd class="ic_bx"><span onclick="javascript:itemlistwish('13');" id="13" class="13 zzim"></span> <a href="http://demofran.com/shop/view.php?index_no=13" target="_blank" class="nwin"></a></dd>
				</dl>
								<dl>
					<dd class="sale">Best%</dd>					<a href="http://demofran.com/shop/view.php?index_no=12">
						<dt class="pimg"><img src="http://demofran.com/data/goods/1483411284/thumb-NcEq6PgZABZ4yTEDMfbc7CMZjFb4w8_190x190.jpg" width="190" height="190"></dt>
						<dd class="pname">[벨카리노] 안틱캐주얼 투타임 블랙 남녀공용 손목시계 [BC97042B]</dd>
						<dd class="price"><span class="spr">85,000<span>원</span></span><span class="mpr">60,060<span>원</span></span></dd>
					</a>
					<dd class="ic_bx"><span onclick="javascript:itemlistwish('12');" id="12" class="12 zzim"></span> <a href="http://demofran.com/shop/view.php?index_no=12" target="_blank" class="nwin"></a></dd>
				</dl>
								<dl>
					<dd class="sale">Best%</dd>					<a href="http://demofran.com/shop/view.php?index_no=11">
						<dt class="pimg"><img src="http://demofran.com/data/goods/1483411200/thumb-mUTbYFV6RKVvmYLLdFAjpB7zQp5DHR_190x190.jpg" width="190" height="190"></dt>
						<dd class="pname">[폴리폴리] 미니 레이디버블 가죽 시계 WF16R009SPS</dd>
						<dd class="price"><span class="spr">275,000<span>원</span></span><span class="mpr">218,000<span>원</span></span></dd>
					</a>
					<dd class="ic_bx"><span onclick="javascript:itemlistwish('11');" id="11" class="11 zzim"></span> <a href="http://demofran.com/shop/view.php?index_no=11" target="_blank" class="nwin"></a></dd>
				</dl>
								<dl>
					<dd class="sale">Best%</dd>					<a href="http://demofran.com/shop/view.php?index_no=10">
						<dt class="pimg"><img src="http://demofran.com/data/goods/1483411092/thumb-Dqpxzw59F3Pzg9PrtDe9tSmaUCF7tu_190x190.jpg" width="190" height="190"></dt>
						<dd class="pname">선인장 자수패치 반팔T</dd>
						<dd class="price"><span class="spr">16,000<span>원</span></span><span class="mpr">10,080<span>원</span></span></dd>
					</a>
					<dd class="ic_bx"><span onclick="javascript:itemlistwish('10');" id="10" class="10 zzim"></span> <a href="http://demofran.com/shop/view.php?index_no=10" target="_blank" class="nwin"></a></dd>
				</dl>
								<dl>
					<dd class="sale">Best</dd>					<a href="http://demofran.com/shop/view.php?index_no=9">
						<dt class="pimg"><img src="http://demofran.com/data/goods/1483411007/thumb-t7kcVYkeZQqHe4Thc3VU2Yf4VGzyHw_190x190.jpg" width="190" height="190"></dt>
						<dd class="pname">대박난 의류 시즌오프와 신상의 만남</dd>
						<dd class="price"><span class="spr">13,200<span>원</span></span><span class="mpr">11,000<span>원</span></span></dd>
					</a>
					<dd class="ic_bx"><span onclick="javascript:itemlistwish('9');" id="9" class="9 zzim"></span> <a href="http://demofran.com/shop/view.php?index_no=9" target="_blank" class="nwin"></a></dd>
				</dl> -->
							</div>
					</div>
				<script>
		$(document).ready(function(){
			$('.best_rol').slick({
				autoplay: true,
				dots: false
			});
		});
		</script>
			</div>
	<!-- } 베스트 쇼핑특가 및 배너 끝 -->
</div>

<!-- 카테고리별 베스트 시작 {-->
<div class="cont_wrap">
	
		<div class="wide_bn mart40" data-aos="fade-up" data-aos-once="true" data-aos-duration="800" ><img src="./imgSource/mini1.png" width="1000" height="200"></div>
	</div>


<!-- 신상품 시작 { -->
<div class="cont_wrap mart60" 
	data-aos="flip-left"
	data-aos-easing="ease-out-cubic"
	data-aos-delay="200"
	data-aos-duration="1000"
	data-aos-acnhor-plcacement="top-center"
	data-aos-once="true">
     
	<h2 class="mtit"><span>신상품</span></h2>
	<div class="pr_desc wli4 mart5">
<ul>

<%
	 if(newList.size() == 0){
%>
		<tr>
			<td colspan="5"> 신상품 내역이 없습니다.</td>
		</tr>
<%
	 }else{
		for(Map<String, Object> nm : newList) {
			BigDecimal accr = ((BigDecimal)nm.get("GRD_ACCR"))
		            .multiply((BigDecimal)nm.get("PROD_PRICE"))
		            .divide(BigDecimal.valueOf(100));
	
%>
<li>
<a href="prodDetail.do?prodNo=<%=nm.get("PROD_NO")%>">
<dl>
<dt>
	<img src="<%=nm.get("PROD_IMG")%>" width="235" height="235">
</dt>
<dd class="pname"><%=nm.get("PROD_NAME") %></dd>
<dd class="price"><!-- <span class="spr">가격<span>원</span></span> --><span class="mpr"><%=nm.get("PROD_PRICE") %><span>원</span></span></dd>
<dd class="petc">
<span class="fbx_small fbx_bg6"><%=accr%>p 적립</span>
<span class="fbx_small fbx_bg4">무료배송</span>
</dd>
</dl>
</a>
<p class="ic_bx"><span onclick='javascript:itemlistwish("21")' id="21" class="21 zzim"></span> <a href="http://demofran.com/shop/view.php?index_no=21" target="_blank" class="nwin"></a></p>
</li>
<%
		}
	 }
%>
</ul>
</div>
</div>
<!-- } 신상품 끝 -->

<!-- 큰 배너 배경 및 문구 시작 { -->
<div class="mask_bn" style="background:url('http://demofran.com/data/banner/eDgCtJytyjdaAt6s3NpC4ZGE1UZV74.jpg') no-repeat fixed center;background-size:cover;">
<p>
<span>최대 30% 혜택! <br>오직 BEAUTY IN SITE 에서만</span>
</p>
</div><!-- } 큰 배너 배경 및 문구 끝 -->

<!-- 인기상품 시작 { -->
<div class="cont_wrap mart60"
	data-aos="flip-right"
	data-aos-easing="ease-out-cubic"
	data-aos-duration="1000"
	data-aos-once="true">
	<h2 class="mtit"><span>베스트셀러</span></h2>
	<div class="pr_desc wli3 mart5">
<ul>

<%
	if(bestList.size() == 0) {
	
%>
		<tr>
			<td colspan="5"> 베스트상품 내역이 없습니다.</td>
		</tr>
<%
	}else{
		for(Map<String, Object> bm : bestList) {
			BigDecimal accr = ((BigDecimal)bm.get("GRD_ACCR"))
		            .multiply((BigDecimal)bm.get("PROD_PRICE"))
		            .divide(BigDecimal.valueOf(100));
		
%>
<li>
<a href="prodDetail.do?prodNo=<%=bm.get("PROD_NO")%>">
<dl>
<dt>
<img src="<%=bm.get("PROD_IMG")%>" width="315" height="315"></dt>
<dd class="pname"><%=bm.get("PROD_NAME") %></dd>
<dd class="price"><!-- <span class="spr">39,600<span>원</span></span> --><span class="mpr"><%=bm.get("PROD_PRICE") %><span>원</span></span></dd>
<dd class="petc">
<span class="fbx_small fbx_bg6"><%=accr%>p 적립</span>
<span class="fbx_small fbx_bg4">무료배송</span>
</dd>
</dl>
</a>
<p class="ic_bx"><span onclick='javascript:itemlistwish("21")' id="21" class="21 zzim"></span> <a href="http://demofran.com/shop/view.php?index_no=21" target="_blank" class="nwin"></a></p>
</li>
<%
		}
	}
%>
<!-- <li>
<a href="http://demofran.com/shop/view.php?index_no=20">
<dl>
<dt><img src="http://demofran.com/data/goods/1516934486/thumb-30323_NcEq6PgZABZ4yTEDMfbc7CMZjFb4w8_315x315.jpg" width="315" height="315"></dt>
<dd class="pname">Guy Laroche 토리노 지퍼 동전 카드케이스 GL-9300-TR-NY</dd>
<dd class="price"><span class="spr">33,700<span>원</span></span><span class="mpr">29,520<span>원</span></span></dd>
<dd class="petc">
<span class="fbx_small fbx_bg6">1,480P 적립</span>
<span class="fbx_small fbx_bg4">무료배송</span>
</dd>
</dl>
</a>
<p class="ic_bx"><span onclick='javascript:itemlistwish("20")' id="20" class="20 zzim"></span> <a href="http://demofran.com/shop/view.php?index_no=20" target="_blank" class="nwin"></a></p>
</li>
<li>
<a href="http://demofran.com/shop/view.php?index_no=19">
<dl>
<dt><img src="http://demofran.com/data/goods/1516934485/thumb-10228_95S2lNwQks3caPhpLyDPjPWygyeCsC_315x315.jpg" width="315" height="315"></dt>
<dd class="pname">[루이까또즈] 넥타이 네이비 LW705ST03-N-75</dd>
<dd class="price"><span class="spr">46,800<span>원</span></span><span class="mpr">38,730<span>원</span></span></dd>
<dd class="petc">
<span class="fbx_small fbx_bg6">1,940P 적립</span>
<span class="fbx_small fbx_bg4">무료배송</span>
</dd>
</dl>
</a>
<p class="ic_bx"><span onclick='javascript:itemlistwish("19")' id="19" class="19 zzim"></span> <a href="http://demofran.com/shop/view.php?index_no=19" target="_blank" class="nwin"></a></p>
</li>
<li>
<a href="http://demofran.com/shop/view.php?index_no=16">
<dl>
<dt><img src="http://demofran.com/data/goods/1483411597/thumb-l7xUjCx1dy5Tp6GlLAy2zMlRLHhxGx_315x315.jpg" width="315" height="315"></dt>
<dd class="pname">Guy Laroche 사피아노 핸들 카드케이스 GL-9307-OR</dd>
<dd class="price"><span class="spr">46,000<span>원</span></span><span class="mpr">36,720<span>원</span></span></dd>
<dd class="petc">
<span class="fbx_small fbx_bg6">1,840P 적립</span>
<span class="fbx_small fbx_bg4">무료배송</span>
</dd>
</dl>
</a>
<p class="ic_bx"><span onclick='javascript:itemlistwish("16")' id="16" class="16 zzim"></span> <a href="http://demofran.com/shop/view.php?index_no=16" target="_blank" class="nwin"></a></p>
</li>
<li>
<a href="http://demofran.com/shop/view.php?index_no=10">
<dl>
<dt><img src="http://demofran.com/data/goods/1483411092/thumb-Dqpxzw59F3Pzg9PrtDe9tSmaUCF7tu_315x315.jpg" width="315" height="315"></dt>
<dd class="pname">선인장 자수패치 반팔T</dd>
<dd class="price"><span class="spr">16,000<span>원</span></span><span class="mpr">10,080<span>원</span></span></dd>
<dd class="petc">
<span class="fbx_small fbx_bg6">310P 적립</span>
<span class="fbx_small fbx_bg4">무료배송</span>
</dd>
</dl>
</a>
<p class="ic_bx"><span onclick='javascript:itemlistwish("10")' id="10" class="10 zzim"></span> <a href="http://demofran.com/shop/view.php?index_no=10" target="_blank" class="nwin"></a></p>
</li>
<li>
<a href="http://demofran.com/shop/view.php?index_no=9">
<dl>
<dt><img src="http://demofran.com/data/goods/1483411007/thumb-t7kcVYkeZQqHe4Thc3VU2Yf4VGzyHw_315x315.jpg" width="315" height="315"></dt>
<dd class="pname">대박난 의류 시즌오프와 신상의 만남</dd>
<dd class="price"><span class="spr">13,200<span>원</span></span><span class="mpr">11,000<span>원</span></span></dd>
<dd class="petc">
<span class="fbx_small fbx_bg6">1,100P 적립</span>
<span class="fbx_small fbx_bg4">무료배송</span>
</dd>
</dl>
</a>
<p class="ic_bx"><span onclick='javascript:itemlistwish("9")' id="9" class="9 zzim"></span> <a href="http://demofran.com/shop/view.php?index_no=9" target="_blank" class="nwin"></a></p>
</li> -->
</ul>
</div>
</div>
<!-- } 인기상품 끝 -->

<!-- 중간 배너영역 시작 { -->
<!-- <ul class="mmd_bn mart60">
	<li class="bnr1"><img src="http://demofran.com/data/banner/jfrGcAfEHjxUSJudVWJSzX2ZuErmJZ.jpg" width="480" height="290"></li>
	<li class="bnr2"><img src="http://demofran.com/data/banner/Hmgye7tWqqelSug53Fql3c7tMhKQ96.jpg" width="200" height="290"></li>
	<li class="bnr3"><img src="http://demofran.com/data/banner/ASChUd9h6Vl5UxlsHhqzETzy7NnRsm.jpg" width="690" height="200"></li>
	<li class="bnr4"><img src="http://demofran.com/data/banner/zxBj8DMqbQG364XuKMxSaUSx9RLm7M.jpg" width="300" height="500"></li>
</ul> -->
<!-- } 중간 배너영역 끝 -->

<!-- 추천상품 시작 { -->
<!--<div class="cont_wrap mart60">
	<h2 class="mtit"><span>추천상품</span></h2>
	 <div class="pr_desc wli5 mart5">
<ul>
<li>
<a href="http://demofran.com/shop/view.php?index_no=21">
<dl>
<dt><img src="http://demofran.com/data/goods/1516934487/thumb-79666_Dqpxzw59F3Pzg9PrtDe9tSmaUCF7tu_190x190.jpg" width="190" height="190"></dt>
<dd class="pname">[루이까또즈] 우븐 숄 머플러 인디라 와인 SA-2HW362WI</dd>
<dd class="price"><span class="spr">39,600<span>원</span></span><span class="mpr">31,560<span>원</span></span></dd>
<dd class="petc">
<span class="fbx_small fbx_bg6">1,580P 적립</span>
<span class="fbx_small fbx_bg4">무료배송</span>
</dd>
</dl>
</a>
<p class="ic_bx"><span onclick='javascript:itemlistwish("21")' id="21" class="21 zzim"></span> <a href="http://demofran.com/shop/view.php?index_no=21" target="_blank" class="nwin"></a></p>
</li>
<li>
<a href="http://demofran.com/shop/view.php?index_no=20">
<dl>
<dt><img src="http://demofran.com/data/goods/1516934486/thumb-30323_NcEq6PgZABZ4yTEDMfbc7CMZjFb4w8_190x190.jpg" width="190" height="190"></dt>
<dd class="pname">Guy Laroche 토리노 지퍼 동전 카드케이스 GL-9300-TR-NY</dd>
<dd class="price"><span class="spr">33,700<span>원</span></span><span class="mpr">29,520<span>원</span></span></dd>
<dd class="petc">
<span class="fbx_small fbx_bg6">1,480P 적립</span>
<span class="fbx_small fbx_bg4">무료배송</span>
</dd>
</dl>
</a>
<p class="ic_bx"><span onclick='javascript:itemlistwish("20")' id="20" class="20 zzim"></span> <a href="http://demofran.com/shop/view.php?index_no=20" target="_blank" class="nwin"></a></p>
</li>
<li>
<a href="http://demofran.com/shop/view.php?index_no=19">
<dl>
<dt><img src="http://demofran.com/data/goods/1516934485/thumb-10228_95S2lNwQks3caPhpLyDPjPWygyeCsC_190x190.jpg" width="190" height="190"></dt>
<dd class="pname">[루이까또즈] 넥타이 네이비 LW705ST03-N-75</dd>
<dd class="price"><span class="spr">46,800<span>원</span></span><span class="mpr">38,730<span>원</span></span></dd>
<dd class="petc">
<span class="fbx_small fbx_bg6">1,940P 적립</span>
<span class="fbx_small fbx_bg4">무료배송</span>
</dd>
</dl>
</a>
<p class="ic_bx"><span onclick='javascript:itemlistwish("19")' id="19" class="19 zzim"></span> <a href="http://demofran.com/shop/view.php?index_no=19" target="_blank" class="nwin"></a></p>
</li>
<li>
<a href="http://demofran.com/shop/view.php?index_no=16">
<dl>
<dt><img src="http://demofran.com/data/goods/1483411597/thumb-l7xUjCx1dy5Tp6GlLAy2zMlRLHhxGx_190x190.jpg" width="190" height="190"></dt>
<dd class="pname">Guy Laroche 사피아노 핸들 카드케이스 GL-9307-OR</dd>
<dd class="price"><span class="spr">46,000<span>원</span></span><span class="mpr">36,720<span>원</span></span></dd>
<dd class="petc">
<span class="fbx_small fbx_bg6">1,840P 적립</span>
<span class="fbx_small fbx_bg4">무료배송</span>
</dd>
</dl>
</a>
<p class="ic_bx"><span onclick='javascript:itemlistwish("16")' id="16" class="16 zzim"></span> <a href="http://demofran.com/shop/view.php?index_no=16" target="_blank" class="nwin"></a></p>
</li>
<li>
<a href="http://demofran.com/shop/view.php?index_no=14">
<dl>
<dt><img src="http://demofran.com/data/goods/1483411431/thumb-95S2lNwQks3caPhpLyDPjPWygyeCsC_190x190.jpg" width="190" height="190"></dt>
<dd class="pname">Mathey-Tissot 심플 서류가방+백팩 블랙세트</dd>
<dd class="price"><span class="spr">176,000<span>원</span></span><span class="mpr">70,000<span>원</span></span></dd>
<dd class="petc">
<span class="fbx_small fbx_bg6">3,500P 적립</span>
<span class="fbx_small fbx_bg4">무료배송</span>
</dd>
</dl>
</a>
<p class="ic_bx"><span onclick='javascript:itemlistwish("14")' id="14" class="14 zzim"></span> <a href="http://demofran.com/shop/view.php?index_no=14" target="_blank" class="nwin"></a></p>
</li>
<li>
<a href="http://demofran.com/shop/view.php?index_no=13">
<dl>
<dt><img src="http://demofran.com/data/goods/1483411346/thumb-cgv31q6CGaR3YASGhNQGY2XR4m4NKJ_190x190.jpg" width="190" height="190"></dt>
<dd class="pname">[에스로체] 20인치 PC 캐리어 ER-CSM2-15320</dd>
<dd class="price"><span class="spr">162,000<span>원</span></span><span class="mpr">63,900<span>원</span></span></dd>
<dd class="petc">
<span class="fbx_small fbx_bg6">3,200P 적립</span>
<span class="fbx_small fbx_bg4">무료배송</span>
</dd>
</dl>
</a>
<p class="ic_bx"><span onclick='javascript:itemlistwish("13")' id="13" class="13 zzim"></span> <a href="http://demofran.com/shop/view.php?index_no=13" target="_blank" class="nwin"></a></p>
</li>
<li>
<a href="http://demofran.com/shop/view.php?index_no=12">
<dl>
<dt><img src="http://demofran.com/data/goods/1483411284/thumb-NcEq6PgZABZ4yTEDMfbc7CMZjFb4w8_190x190.jpg" width="190" height="190"></dt>
<dd class="pname">[벨카리노] 안틱캐주얼 투타임 블랙 남녀공용 손목시계 [BC97042B]</dd>
<dd class="price"><span class="spr">85,000<span>원</span></span><span class="mpr">60,060<span>원</span></span></dd>
<dd class="petc">
<span class="fbx_small fbx_bg6">3,010P 적립</span>
<span class="fbx_small fbx_bg4">무료배송</span>
</dd>
</dl>
</a>
<p class="ic_bx"><span onclick='javascript:itemlistwish("12")' id="12" class="12 zzim"></span> <a href="http://demofran.com/shop/view.php?index_no=12" target="_blank" class="nwin"></a></p>
</li>
<li>
<a href="http://demofran.com/shop/view.php?index_no=11">
<dl>
<dt><img src="http://demofran.com/data/goods/1483411200/thumb-mUTbYFV6RKVvmYLLdFAjpB7zQp5DHR_190x190.jpg" width="190" height="190"></dt>
<dd class="pname">[폴리폴리] 미니 레이디버블 가죽 시계 WF16R009SPS</dd>
<dd class="price"><span class="spr">275,000<span>원</span></span><span class="mpr">218,000<span>원</span></span></dd>
<dd class="petc">
<span class="fbx_small fbx_bg4">무료배송</span>
</dd>
</dl>
</a>
<p class="ic_bx"><span onclick='javascript:itemlistwish("11")' id="11" class="11 zzim"></span> <a href="http://demofran.com/shop/view.php?index_no=11" target="_blank" class="nwin"></a></p>
</li>
<li>
<a href="http://demofran.com/shop/view.php?index_no=10">
<dl>
<dt><img src="http://demofran.com/data/goods/1483411092/thumb-Dqpxzw59F3Pzg9PrtDe9tSmaUCF7tu_190x190.jpg" width="190" height="190"></dt>
<dd class="pname">선인장 자수패치 반팔T</dd>
<dd class="price"><span class="spr">16,000<span>원</span></span><span class="mpr">10,080<span>원</span></span></dd>
<dd class="petc">
<span class="fbx_small fbx_bg6">310P 적립</span>
<span class="fbx_small fbx_bg4">무료배송</span>
</dd>
</dl>
</a>
<p class="ic_bx"><span onclick='javascript:itemlistwish("10")' id="10" class="10 zzim"></span> <a href="http://demofran.com/shop/view.php?index_no=10" target="_blank" class="nwin"></a></p>
</li>
<li>
<a href="http://demofran.com/shop/view.php?index_no=9">
<dl>
<dt><img src="http://demofran.com/data/goods/1483411007/thumb-t7kcVYkeZQqHe4Thc3VU2Yf4VGzyHw_190x190.jpg" width="190" height="190"></dt>
<dd class="pname">대박난 의류 시즌오프와 신상의 만남</dd>
<dd class="price"><span class="spr">13,200<span>원</span></span><span class="mpr">11,000<span>원</span></span></dd>
<dd class="petc">
<span class="fbx_small fbx_bg6">1,100P 적립</span>
<span class="fbx_small fbx_bg4">무료배송</span>
</dd>
</dl>
</a>
<p class="ic_bx"><span onclick='javascript:itemlistwish("9")' id="9" class="9 zzim"></span> <a href="http://demofran.com/shop/view.php?index_no=9" target="_blank" class="nwin"></a></p>
</li>
</ul>
</div>
</div> -->
<!-- } 추천상품 끝 -->
			</div>
			
<script src="js/toast.js"></script>


<c:choose>
<c:when test='${not empty msg && msg eq "SUCCESS"}'>
<script>
Toast.fire({
  icon: 'success',
  title: '작업이 성공적으로 수행되었습니다'
    <% session.removeAttribute("msg"); %>
})
      </script>
</c:when>
<c:when test='${msg eq "FAILURE"}'>
<script>
Toast.fire({
  icon: 'error',
  title: '작업이 실패하였습니다'
    <% session.removeAttribute("msg"); %>
})
      </script>
</c:when>
</c:choose>

<c:choose>
<c:when test='${logout eq "SUCCESS"}'>
  <script>
    Toast.fire({
      title: '로그아웃이 성공적으로 수행되었습니다',
      text: '이용해주셔서 감사합니다',
      icon: 'success'
    })
    
    setTimeout(function(){
    	location.href='index.do';
    },1500);
  </script>
</c:when>
<c:when test='${logout eq "FAILURE"}'>
  <script>
    Swal.fire({
      title: '로그인 상태가 아닙니다',
      text: '로그인 후 다시 시도하여 주십시오',
      icon: 'error'
    }).then((result) => {
      if (result.isConfirmed) {
        window.location.href = 'main.do';
      }
    });
  </script>
</c:when>
</c:choose>

<jsp:include page="../layout/footer.jsp"/>