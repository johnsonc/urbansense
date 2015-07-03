<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="Description" content="Portal Admin Console" />
<title>KMHI-Dashboard</title>

<style type="text/css">
.ui-widget-overlay
  {
      background: #000 !important;
  }
</style>


     <style>
body{
	background:#333 url(images/menu/bg.jpg) repeat top left;
	font-family:Arial;
}
span.reference{
	position:fixed;
	left:10px;
	bottom:10px;
	font-size:12px;
}
span.reference a{
	color:#aaa;
	text-transform:uppercase;
	text-decoration:none;
	text-shadow:1px 1px 1px #000;
	margin-right:30px;
}
span.reference a:hover{
	color:#ddd;
}
ul.sdt_menu{
	margin-top:150px;
}
h1.title{
	text-indent:-9000px;
	background:transparent url(images/menu/title.png) no-repeat top left;
	width:633px;
	height:69px;
}
</style>

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


<!--  Accoridan -->
 <style>
#accordion-resizer {
padding: 10px;
width: 350px;
height: 220px;
}
</style>


<!--  Jquery UI Lightness Theme -->
<%-- 
<link rel="stylesheet" type="text/css"  href="<%=contextPath%>/scripts/xtern/jquery-ui-themes-1.10.4/themes/ui-lightness/jquery-ui.min.css" />
<link rel="stylesheet" type="text/css"  href="/scripts/xtern/jquery-ui-themes-1.10.4/themes/ui-lightness/jquery.ui.theme.css" />
 --%>

<!--  Jquery UI Redmond Theme -->
<link rel="stylesheet" type="text/css"  href="/scripts/xtern/jquery-ui-themes-1.11.3/themes/redmond/jquery-ui.min.css" />


<link rel="stylesheet" type="text/css"	href="/scripts/xtern/jqgrid-4.7.1/css/ui.jqgrid.css" />
 <link rel="stylesheet" type="text/css" media="screen" href="/stylesheets/style.css" />
</head>
<body>
	<jsp:include page="common/header.jsp" />
	<!--  
	<div id="portaladminmenu"></div>
	<div id="breadcrumb"></div>
	<div id="portalmessage"></div>
	<div id="content"></div>
 	-->
 	
	<!-- external JS includes -->

	<!--  Jquery -->
	<script type="text/javascript"	src="/scripts/xtern/jquery-2.1.3.min.js"></script>
	<script type="text/javascript"	src="/scripts/xtern/jquery-ui-1.11.3/jquery-ui.min.js"></script>

	<!--  Jqgrid -->
	<script type="text/javascript"	src="/scripts/xtern/jqgrid-4.7.1/js/jquery.jqGrid.min.js"></script>
	<script type="text/javascript"	src="/scripts/xtern/jqgrid-4.7.1/js/i18n/grid.locale-en.js"></script>
	<script type="text/javascript"	src="/scripts/xtern/jqgrid-4.7.1/plugins/jquery.contextmenu.js"></script>
	<script type="text/javascript"	src="/scripts/xtern/jqgrid-4.7.1/plugins/jquery.tablednd.js"></script>
	<!--  Jqgrid plugin-multiselect -->
	<script type="text/javascript"	src="/scripts/xtern/jqgrid-4.7.1/plugins/ui.multiselect.js"></script>
	<script type="text/javascript">
	$.jgrid.no_legacy_api = true;
	$.jgrid.useJSON = true;
	var contextPath = "<%=request.getContextPath()%>";
	</script>
	
	<script type="text/javascript" src="/scripts/jquery.easing.1.3.js"></script>
	
	<script type="text/javascript" src="/scripts/kmhi/starter.js"></script>
	<script type="text/javascript" src="/scripts/kmhi/pharmacyGrid.js"></script>
	
	<script type="text/javascript" src="/scripts/kmhi/pharmacyGoogleChart.js"></script>
	
	<!-- <script type="text/javascript" src="https://www.google.com/jsapi"></script> -->
	<script type="text/javascript" src="https://www.google.com/jsapi?autoload={'modules':[{'name':'visualization','version':'1.1','packages':['corechart','gauge']}]}"></script>
 
	
	
	   <script type="text/javascript">
            $(function() {
				/**
				* for each menu element, on mouseenter, 
				* we enlarge the image, and show both sdt_active span and 
				* sdt_wrap span. If the element has a sub menu (sdt_box),
				* then we slide it - if the element is the last one in the menu
				* we slide it to the left, otherwise to the right
				*/
                $('#sdt_menu > li').bind('mouseenter',function(){
					var $elem = $(this);
					$elem.find('img')
						 .stop(true)
						 .animate({
							'width':'170px',
							'height':'170px',
							'left':'0px'
						 },400,'easeOutBack')
						 .andSelf()
						 .find('.sdt_wrap')
					     .stop(true)
						 .animate({'top':'140px'},500,'easeOutBack')
						 .andSelf()
						 .find('.sdt_active')
					     .stop(true)
						 .animate({'height':'170px'},300,function(){
						var $sub_menu = $elem.find('.sdt_box');
						if($sub_menu.length){
							var left = '170px';
							if($elem.parent().children().length == $elem.index()+1)
								left = '-170px';
							$sub_menu.show().animate({'left':left},200);
						}	
					});
				}).bind('mouseleave',function(){
					var $elem = $(this);
					var $sub_menu = $elem.find('.sdt_box');
					if($sub_menu.length)
						$sub_menu.hide().css('left','0px');
					
					$elem.find('.sdt_active')
						 .stop(true)
						 .animate({'height':'0px'},300)
						 .andSelf().find('img')
						 .stop(true)
						 .animate({
							'width':'0px',
							'height':'0px',
							'left':'85px'},400)
						 .andSelf()
						 .find('.sdt_wrap')
						 .stop(true)
						 .animate({'top':'25px'},500);
				});
            });
        </script>
        
        	<script type="text/javascript">
		$(function() {
			$( "#tabs" ).tabs();
		 	//$( "#accordion" ).accordion();
		});
		 
		</script>
		
		 <script>
			$(function() {
			
			$( "#accordion" ).accordion({
			//heightStyle: "fill",
			heightStyle: "content",
			collapsible: true
			});
			
			$( "#accordionGeo" ).accordion({
				heightStyle: "fill",
				//heightStyle: "content",
				collapsible: true
			});
			
			
			});
			$(function() {
			$( "#accordion-resizer" ).resizable({
			minHeight: 540,
			minWidth: 900,
			resize: function() {
			$( "#accordion" ).accordion( "refresh" );
			}
			});
			});
		</script>
	
	<script>
			$(function() {
			$( "input[type=submit], button" )
			.button()
			.click(function( event ) {
			event.preventDefault();
			});
			});
	</script>

	
	<div class="content">
		<!-- 	<h1 class="title">Slide Down Box Menu with jQuery and CSS3</h1> -->
			<ul id="sdt_menu" class="sdt_menu">
				<li>
					<a href="#">
						<img src="images/menu/2.jpg" alt=""/>
						<span class="sdt_active"></span>
						<span class="sdt_wrap">
							<span class="sdt_link">About</span>
							<span class="sdt_descr">...</span>
						</span>
					</a>
				</li>
				<li>
					<a href="#">
						<img src="images/menu/1.jpg" alt=""/>
						<span class="sdt_active"></span>
						<span class="sdt_wrap">
							<span class="sdt_link">Dashboard</span>
							<span class="sdt_descr">Click to find more</span>
						</span>
					</a>
					<div class="sdt_box">
							<a href="#">Charts</a>
							<!-- <a href="#">Illustrations</a>
							<a href="#">Photography</a> -->
					</div>
				</li>
				
				 
				<li>
					<a href="#">
						<img src="images/menu/6.jpg" alt=""/>
						<span class="sdt_active"></span>
						<span class="sdt_wrap">
							<span class="sdt_link">Projects</span>
							<span class="sdt_descr">Click to find more</span>
						</span>
					</a>
					<div class="sdt_box">
						<a href="#">Kumbh Mela</a>
					</div>
				</li>
			</ul>
		</div>
		
		
		<br><br><br><br>
		
		<div id="tabs">
			<ul>
			<li><a href="#tabs-1">Viewer</a></li>
			<li><a href="#tabs-2">Visualizer</a></li>
			<li><a href="#tabs-3">Maps</a></li>
			</ul>
			<div id="tabs-1">
			<p>
			
			
			
			<!--  Pharmacy Grid Start -->
					<button onclick="pharmacyGridStarter()">Load Pharmacy Grid </button>
					<div id="pharmacyGrid">
						<table id="list47"></table>
						<div id="plist47"></div>
						<br />
					</div>
				<!--  Pharmacy Grid End -->

			
			</p>
			</div>
			<div id="tabs-2">
			<p>
			
			
			<div id="accordion">
				<h3>Area Chart</h3>
				<div>
				<p>
				
				 <!--  AREA Chart -->
				<button onclick="pharmacyGoogleChartStarter('AREA')">Pharmacy Google Chart-AREA </button>
				 <div id="pharmacy_chart_div_AREA" style="width: 900px; height: 500px;"></div>
				  
				
				</p>
				</div>
				<h3>Bar Chart</h3>
				<div>
				<p>
				
				
				 <!--  BAR Chart -->
				 <button onclick="pharmacyGoogleChartStarter('BAR')">Pharmacy Google Chart-BAR </button>
				 <div id="pharmacy_chart_div_BAR" style="width: 900px; height: 500px;"></div>
				 
				</p>
				</div>
				<h3>Line Curve</h3>
				<div>
				<p>
				
				
						 <!--  LINE CURVE Chart -->
				 <button onclick="pharmacyGoogleChartStarter('LINECURVE')">Pharmacy Google Chart-LINECURVE </button>
				 <div id="pharmacy_chart_div_LINECURVE" style="width: 900px; height: 500px;"></div>
			
				</p>
				
				<!-- <ul><li>List item one</li>				<li>List item two</li>		<li>List item three</li>	</ul> -->			
				
				</div>
				<h3>Pie Chart</h3>
				<div>
				
				<!--  PIE Chart -->
				 <button onclick="pharmacyGoogleChartStarter('PIE')">Pharmacy Google Chart-PIE </button>
				 <div id="pharmacy_chart_div_PIE" style="width: 900px; height: 500px;"></div>
			
				 
				</p>
				<p>
				
				
				
				</p>
				</div>
				
				
				<h3>Gauge Chart</h3>
				<div>
				
				<!--  GAUGE Chart -->
				 <button onclick="pharmacyGoogleChartStarter('GAUGE')">Pharmacy Google Chart-GAUGE </button>

				 <div id="resizable" class="ui-widget-content">
					  <h3 class="ui-widget-header">Bandra</h3>
					  <div id="pharmacy_chart_div_GAUGE1" style="width: 900px; height: 150px;"></div>
				</div>
				
				<div id="resizable" class="ui-widget-content">
					  <h3 class="ui-widget-header">Santacruz</h3>
					  <div id="pharmacy_chart_div_GAUGE2" style="width: 900px; height: 150px;"></div>
				</div>
				
				</p>
				<p>
				</p>
				</div>
				
				
				
				<h3>Multi Column Chart</h3>
				<div>
				
				 <button onclick="pharmacyGoogleChartStarter('MULTICOLUMN')">Pharmacy Google Chart-MULTICOLUMN </button>
				 
				 <div id="resizable" class="ui-widget-content">
					  <h3 class="ui-widget-header">Humidity,Tempurature & Concentration Levels</h3>
					  <div id="pharmacy_chart_div_MULTICOLUMN" style="width: 900px; height: 250px;"></div>
				</div>
				
				</p>
				<p>
				</p>
				</div>
					 
	 
			</div>
			
			</p>
			</div>
			<div id="tabs-3">
				<p>
				<!-- <h3 class="docs">Resize the outer container:</h3> -->
					<div id="accordionGeo">
						<h3>Geo Chart</h3>
						<div>
						<p>
							<!--  GEO Chart -->
							 <button onclick="pharmacyGoogleChartStarter('GEO')">Pharmacy Google Chart-GEO </button>
							 <div id="pharmacy_chart_div_GEO" style="width: 900px; height: 500px;"></div>
						</p>
						</div>
					</div>
				</p>
			</div>
		</div>
					
		
</body>
</html>
