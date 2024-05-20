<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="com.cosmetic.admin.vo.GradeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="./layout/header.jsp"></jsp:include>

<%
    List<GradeVO> list = (List<GradeVO>) request.getAttribute("list");
    request.setAttribute("jsonList", new Gson().toJson(list));
%>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="wrapper">
	
<div id="snb">
	<div class="snb_header ico_config">
		<h2><i class="ionicons ion-ios-people fs40"></i>회원관리</h2>
	</div>
		<dl>
		<dt class="m10 menu_toggle">회원관리</dt>		
		<dd class="m10 "><a href="manageList.do">회원 정보관리</a></dd>		
		<dd class="m10 active"><a href="gradeList.do">회원 등급관리</a></dd>		
		<dd class="m20"><a href="pointManage.do">포인트 관리</a></dd>
		<dd class="m20"><a href="couponManage.do">쿠폰 관리</a></dd>		
		</dl>
	</div>
	<div id="content">
		<div class="breadcrumb">
			<span>HOME</span> <i class="ionicons ion-ios-arrow-right"></i> 회원관리 <i class="ionicons ion-ios-arrow-right"></i> 회원 등급관리		
		</div>
	
		<div class="s_wrap">
			<h1>회원 등급관리</h1>
			<h2>세부설정</h2>

			<div class="tbl_head01">
				<form action="gradeUpdate.do" method="POST">
					<table>
						<colgroup>
							<col class="w70">
							<col class="w170">
							<col class="w130">
							<col class="w150">
							<col class="w150">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">등급</th>
								<th scope="col">등급명</th>
								<th scope="col">적립율</th>
								<th scope="col">누적금액</th>
								<th scope="col">비고</th>
							</tr>
						</thead>
						<tbody class="list">
							<%
								if(list.size()==0){
							%>  
								<tr>
									<td colspan="5">게시판이 존재하지 않습니다.</td>
								</tr>
							<%
								}else{
									for(GradeVO gdv : list){
							%>      
								<tr class="list0">
									<td class="bold">
										<span><%=gdv.getGrdNo()%></span>
										<input type="hidden" name="grdNo" value="<%=gdv.getGrdNo()%>" class="frm_input wfull">
									</td>
									<td>
										<input type="text" name="grdName" value="<%=gdv.getGrdName()%>" class="frm_input wfull">
									</td>
									<td>
										<input type="text" name="grdAccr" value="<%=gdv.getGrdAccr()%>" class="frm_input w70">%
									</td>
									<td>
										<input type="text" name="grdPrice" value="<%=gdv.getGrdPrice()%>" class="frm_input w70">
									</td>
									<td></td>
								</tr>
							<%
									} // for문 종료
								}
							%>
						</tbody>
					</table>
					<div class="btn_confirm">
						<input type="submit" value="저장" class="btn_large">
					</div>
				</form> <!-- 폼 태그 닫기 -->
			</div>
		</div>
	</div>

	<jsp:include page="./layout/footer.jsp"></jsp:include>
</div>
</body>