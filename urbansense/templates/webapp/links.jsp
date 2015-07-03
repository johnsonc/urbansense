<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="Description" content="Portal Admin Console" />
<title>KMHI-Dashboard</title>

<%
	String contextPath = request.getContextPath();
	request.setAttribute("contextPath", contextPath);
%>
<script type="text/javascript" src="<%=contextPath%>/scripts/kmhi/starter.js"></script>
<script type="text/javascript" src="<%=contextPath%>/scripts/kmhi/pharmacyGrid.js"></script>

<script type="text/javascript" src="<%=contextPath%>/scripts/kmhi/pharmacyGoogleChart.js"></script>

<!-- <script type="text/javascript" src="https://www.google.com/jsapi"></script> -->
<script type="text/javascript" src="https://www.google.com/jsapi?autoload={'modules':[{'name':'visualization','version':'1.1','packages':['corechart']}]}"></script>
 

<!--  Pharmacy Grid CSS -->
<style type="text/css">
input.ui-pg-input {
	width: auto;
	padding: 0px;
	margin: 0px;
	line-height: 14px
}

select.ui-pg-selbox {
	width: auto;
	padding: 0px;
	margin: 0px;
	line-height: 18px
}
</style>


</head>
<body>

<!--  Pharmacy Grid Start -->
	<button onclick="pharmacyGridStarter()">Pharmacy Grid load </button>
	<div id="pharmacyGrid">
		<table id="list47"></table>
		<div id="plist47"></div>
		<br />
	</div>
<!--  Pharmacy Grid End -->


<!--  Google Map Start -->
	
	 <!--  AREA Chart -->
	<button onclick="pharmacyGoogleChartStarter('AREA')">Pharmacy Google Chart-AREA </button>
	 <div id="pharmacy_chart_div_AREA" style="width: 900px; height: 500px;"></div>
	  
	 <!--  BAR Chart -->
	 <button onclick="pharmacyGoogleChartStarter('BAR')">Pharmacy Google Chart-BAR </button>
	 <div id="pharmacy_chart_div_BAR" style="width: 900px; height: 500px;"></div>
	 
	 <!--  LINE CURVE Chart -->
	 <button onclick="pharmacyGoogleChartStarter('LINECURVE')">Pharmacy Google Chart-LINECURVE </button>
	 <div id="pharmacy_chart_div_LINECURVE" style="width: 900px; height: 500px;"></div>

 	<!--  PIE Chart -->
	 <button onclick="pharmacyGoogleChartStarter('PIE')">Pharmacy Google Chart-PIE </button>
	 <div id="pharmacy_chart_div_PIE" style="width: 900px; height: 500px;"></div>

 	<!--  GEO Chart -->
	 <button onclick="pharmacyGoogleChartStarter('GEO')">Pharmacy Google Chart-GEO </button>
	 <div id="pharmacy_chart_div_GEO" style="width: 900px; height: 500px;"></div>
	 
	 	 
<!--   Google Map  End -->



</body>
</html>