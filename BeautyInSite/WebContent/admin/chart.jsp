<%@page import="com.google.gson.Gson"%>
<%@page import="com.cosmetic.admin.vo.ChartVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="./layout/header.jsp" />
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		String code = request.getParameter("code");
	%>

	<div id="wrapper">

		<div id="snb">
			<div class="snb_header ico_config">
				<h2>
					<i class="fa fa-bar-chart"></i>통계분석
				</h2>
			</div>
			<dl>
				<dt class="v20 menu_toggle">주문통계</dt>
				<dd class="v20 <%="daily".equals(code) ? "active" : ""%>">
					<a href="admin/index.do?code=daily">일별 주문통계</a>
				</dd>
				<dd class="v20 <%="month".equals(code) ? "active" : ""%>">
					<a href="admin/index.do?code=month">월별 주문통계</a>
				</dd>
				<dd class="v20 <%="cate".equals(code) ? "active" : ""%>">
					<a href="admin/index.do?code=cate">카테고리별 주문통계</a>
				</dd>
				<dd class="v20 <%="prod".equals(code) ? "active" : ""%>">
					<a href="admin/index.do?code=prod">최다구매상품</a>
				</dd>
				<dd class="v20 <%="buy".equals(code) ? "active" : ""%>">
					<a href="admin/index.do?code=buy">최다구매상품</a>
				</dd>
			</dl>
		</div>
		<div id="content">
			<div class="breadcrumb">
				<span>HOME</span> <i class="ionicons ion-ios-arrow-right"></i> 통계분석
				<i class="ionicons ion-ios-arrow-right"></i> 일별 주문통계
			</div>

			<div class="s_wrap">
				<h1>일별 주문통계</h1>

				<canvas id="salesChart" width="800" height="400"></canvas>
			</div>

		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script>
	//Chart.js 초기화
	const ctx = document.getElementById('salesChart').getContext('2d');
	</script>
<%

	List<ChartVO> chartList = (List<ChartVO>) request.getAttribute("chartList");
	List<ChartVO> buyerList = (List<ChartVO>) request.getAttribute("buyerList");
	
%>
<% if(chartList != null){ %>
<script>
const chartData = <%=new Gson().toJson(chartList)%>

const labels = chartData.map(item => item.purchaseDate);
const values = chartData.map(item => item.prodPrice);
const count = chartData.map(item => item.salesCount);

console.log(labels);
console.log(values);
console.log(count);

const salesChart = new Chart(ctx, {
    type: 'bar',  // 적절한 차트 유형 선택
    data: {
        labels: labels,
        datasets: [
            {
                label: '매출액',
                data: values,
                backgroundColor: 'rgba(75, 192, 192, 0.7)', // 투명도 조절
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 1
            },
            {
                label: '판매횟수',
                data: count,
                backgroundColor: 'rgba(192, 75, 75, 0.7)', // 투명도 조절
                borderColor: 'rgba(192, 75, 75, 1)',
                borderWidth: 1
            }
        ]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        },
    }
});
</script>
<% }else if(buyerList != null) {
%>
<script>
var buyerData = [];
var imgPromises = [];

<%
for (int i = 0; i < buyerList.size(); i++) {
%>
    buyerData.push({
        name: '<%=buyerList.get(i).getName()%>',
        salesCount: <%=buyerList.get(i).getSalesCount()%>,
        prodPrice: <%=buyerList.get(i).getProdPrice()%>
    });

<%
}
%>
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: buyerData.map(data => data.name),
            datasets: [{
                label: '구매횟수',
                data: buyerData.map(data => data.salesCount),
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                borderColor: 'rgba(75, 192, 192, 1)',
                maxBarThickness: 50,
                borderWidth: 1
            },
            {
                label: '구매금액',
                data: buyerData.map(data => data.prodPrice),
                backgroundColor: 'rgba(255, 99, 132, 0.2)',
                borderColor: 'rgba(255, 99, 132, 1)',
                maxBarThickness: 50,
                borderWidth: 1
            }]
        }
    });
</script>
<%		
	} 
%>

	<jsp:include page="./layout/footer.jsp" />