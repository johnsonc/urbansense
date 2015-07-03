<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <head>
        <title>Slide Down Box Menu with jQuery and CSS3</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="description" content="Slide Down Box Menu with jQuery and CSS3" />
        <meta name="keywords" content="jquery, css3, sliding, box, menu, cube, navigation, portfolio, thumbnails"/>
		<link rel="shortcut icon" href="../favicon.ico" type="image/x-icon"/>
        <link rel="stylesheet" href="stylesheets/style.css" type="text/css" media="screen"/>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        
		<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
		

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
    </head>

    <body>
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
			<li><a href="#tabs-1">Grids</a></li>
			<li><a href="#tabs-2">Charts</a></li>
			<li><a href="#tabs-3">Maps</a></li>
			</ul>
			<div id="tabs-1">
			<p>Grids
			
			
			</p>
			</div>
			<div id="tabs-2">
			<p>
			
			
			<div id="accordion">
				<h3>Section 1</h3>
				<div>
				<p>
				Mauris mauris ante, blandit et, ultrices a, suscipit eget, quam. Integer
				ut neque. Vivamus nisi metus, molestie vel, gravida in, condimentum sit
				amet, nunc. Nam a nibh. Donec suscipit eros. Nam mi. Proin viverra leo ut
				odio. Curabitur malesuada. Vestibulum a velit eu ante scelerisque vulputate.
				</p>
				</div>
				<h3>Section 2</h3>
				<div>
				<p>
				Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet
				purus. Vivamus hendrerit, dolor at aliquet laoreet, mauris turpis porttitor
				velit, faucibus interdum tellus libero ac justo. Vivamus non quam. In
				suscipit faucibus urna.
				</p>
				</div>
				<h3>Section 3</h3>
				<div>
				<p>
				Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis.
				Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero
				ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis
				lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.
				</p>
				<ul>
				<li>List item one</li>
				<li>List item two</li>
				<li>List item three</li>
				</ul>
				</div>
				<h3>Section 4</h3>
				<div>
				<p>
				Cras dictum. Pellentesque habitant morbi tristique senectus et netus
				et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in
				faucibus orci luctus et ultrices posuere cubilia Curae; Aenean lacinia
				mauris vel est.
				</p>
				<p>
				Suspendisse eu nisl. Nullam ut libero. Integer dignissim consequat lectus.
				Class aptent taciti sociosqu ad litora torquent per conubia nostra, per
				inceptos himenaeos.
				</p>
				</div>
			</div>
			
			
			</p>
			</div>
			<div id="tabs-3">
			<p>Mauris eleifend est et turpis. Duis id erat. Suspendisse potenti. Aliquam vulputate, pede vel vehicula accumsan, mi neque rutrum erat, eu congue orci lorem eget lorem. Vestibulum non ante. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce sodales. Quisque eu urna vel enim commodo pellentesque. Praesent eu risus hendrerit ligula tempus pretium. Curabitur lorem enim, pretium nec, feugiat nec, luctus a, lacus.</p>
			<p>Duis cursus. Maecenas ligula eros, blandit nec, pharetra at, semper at, magna. Nullam ac lacus. Nulla facilisi. Praesent viverra justo vitae neque. Praesent blandit adipiscing velit. Suspendisse potenti. Donec mattis, pede vel pharetra blandit, magna ligula faucibus eros, id euismod lacus dolor eget odio. Nam scelerisque. Donec non libero sed nulla mattis commodo. Ut sagittis. Donec nisi lectus, feugiat porttitor, tempor ac, tempor vitae, pede. Aenean vehicula velit eu tellus interdum rutrum. Maecenas commodo. Pellentesque nec elit. Fusce in lacus. Vivamus a libero vitae lectus hendrerit hendrerit.</p>
			</div>
		</div>
					
		
		
		
		
		
		
        <div>
            <span class="reference">
                <a href="">Copyright-Kumbmela</a>
				<a href="">Footer</a>
            </span>
		</div>

        <!-- The JavaScript -->
      <!--   <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script> -->
		
		<script src="//code.jquery.com/jquery-1.10.2.js"></script> 
		<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
		
		<script type="text/javascript" src="scripts/jquery.easing.1.3.js"></script>
		
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
		 	$( "#accordion" ).accordion();
		});
		 
		</script>
		
		
		
    </body>
</html>