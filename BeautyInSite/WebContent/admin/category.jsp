<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="com.cosmetic.admin.category.vo.CategoryVO"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="./layout/header.jsp"/>
<div id="wrapper">
	
<div id="snb">
	<div class="snb_header ico_config">
		<h2><i class="fa fa-sitemap"></i>카테고리 관리</h2>
	</div>
		<dl>
		<dt class="c10 menu_toggle">카테고리 관리</dt>		<dd class="c10 active"><a href="<%=request.getContextPath()%>/admin/category.do">카테고리 관리</a></dd>		
		</dl>
	</div>
	<div id="content">
		<div class="breadcrumb">
			<span>HOME</span> <i class="ionicons ion-ios-arrow-right"></i> 
			카테고리 관리 <i class="ionicons ion-ios-arrow-right"></i>카테고리 관리		</div>
	
<div class="s_wrap">
	<h1>카테고리 관리</h1>
	
<h2>카테고리 등록</h2>
<%-- <form name="fcategoryform" id="myForm" method="post" action="<%=request.getContextPath()%>/admin/category.do"> --%>
<form name="fcategoryform" id="myForm" method="post" action="">

<div class="tbl_frm01">
	<table>
	<colgroup>
		<col class="w140">
		<col>
	</colgroup>
	<tbody>
	<tr>
		<th scope="row">카테고리 소속</th>
		<td>
		
<select id="parent" name="parent">
<option value="">=카테고리선택=</option>
<c:forEach var="cate" items="${cateInfo}">
<option value="${cate.key}">${cate.value}</option>
</c:forEach>

</select>
<select id="comm" name="comm">
</select>


<%
	List<CategoryVO> cateList = (List<CategoryVO>) request.getAttribute("cateList");
	ObjectMapper objMapper = new ObjectMapper();
	String jsonList = objMapper.writeValueAsString(cateList);
%>
<script>
	var list = <%=jsonList%>
	
	var comm = $('#comm');
	$('#parent').on('change', function(){
		comm.empty();
		
		for(let i=0; i<list.length; i++){
			
			if(list[i].parentCode === $(this).val()){
				let opt = $('<option>')
				.text(list[i].commCodeName)
				.val(list[i].commCode);
				
				comm.append(opt);
			}
		}
	});
	
</script>

		</td>
	</tr>
	<tr>
		<th scope="row">카테고리명</th>
		<td><input type="text" name="codeName" required itemname="카테고리명" class="frm_input required" size="50"></td>
	</tr>
	</tbody>
	</table>
</div>
<div class="btn_confirm">
	<input type="submit" class="btn_large" value="저장">
</div>
</form>
<div class="sho_cate_bx mart30">
	<div class="local_frm02">
		<a href="http://demofran.com/admin/category/category_excel.php" class="btn_lsmall bx-white"><i class="fa fa-file-excel-o"></i> 카테고리 엑셀저장</a>
	</div>
	<ul>
	<c:forEach var="cate" items="${cateInfo}">
	<li>
		<div>
			<img src="../admin/img/icon/no_01_over.gif" class="vam" alt="1차">
			<b>${cate.key}</b>
			<a href="<%=request.getContextPath()%>/admin/categoryDelete.do', '${cate.key}');" class="btn_ssmall red">삭제</a>
			<a href="javascript:modok('${cate.key}','${cate.value}','','');" class="btn_ssmall">수정</a>
			<a href="#" class="detail"><b>${cate.value}</b></a> <b class="fc_255">(${cateSize[cate.key]})</b>
			<dl class="cate2_bx cateBox"></dl>
			<div id="co${cate.key}" style="display:none;"><iframe id="cos${cate.key}" frameborder="0" width="100%" height="350"></iframe></div>
		</div>
	</li>
	</c:forEach>
	</ul>
</div>

<script>

function modok(parentCode,codeName,commCode,commCodeName)
{
	console.log('code >>',commCode);
	console.log('codeName >>',commCodeName);
	if(commCode == '' && commCodeName == ''){
		document.all['cos'+parentCode].src = "admin/categoryMod.do?parentCode="+parentCode+"&codeName="+codeName;
		document.all['co'+parentCode].style.display = "";
	}else{
		document.all['cos'+commCode].src = "admin/categoryMod.do?parentCode="+parentCode+"&codeName="+codeName+"&commCode="+commCode+"&commCodeName="+commCodeName;
		document.all['co'+commCode].style.display = "";
	}
}

$(function(){
	let codeDetail = $(".detail");

	codeDetail.on('click', function(e) {
		e.preventDefault();
		let cateList = <%=jsonList%>;
		let cateBox = $(this).closest('div').find('.cateBox');
		cateBox.empty();
		
		for(let i = 0; i < cateList.length; i++) {
		    if(cateList[i].codeName === $(this).text()) {
		        let area = '<dt><img src="../admin/img/icon/no_02.gif" class="vam" alt="2차"><b>'+cateList[i].commCode+'</b>';
		        area += '<a href="admin/categoryDelete.do?commCode='+cateList[i].commCode+'" class="btn_ssmall red">삭제</a>';
		        area += '<a href="javascript:modok(\''+cateList[i].parentCode+'\',\''+cateList[i].codeName+'\',\''+cateList[i].commCode+'\',\''+cateList[i].commCodeName+'\');" class="btn_ssmall">수정</a>';
		        area += '<a href="#"><b>'+cateList[i].commCodeName+'</b></a> <b class="fc_255">(0)</b>';
		        area += '<div style="display:none;" id="co'+cateList[i].commCode+'"><iframe id="cos'+cateList[i].commCode+'" frameborder="0" width="100%" height="270"></iframe></div></dt>';
		        
		        cateBox.append(area);
		    } 
		}

	});
	
});
</script>

</div>

</div>
</div>

<jsp:include page="./layout/footer.jsp"></jsp:include>