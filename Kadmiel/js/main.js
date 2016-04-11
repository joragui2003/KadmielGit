var SITE = window.SITE || {};

var twitterInterval = false;
var $isMobile = false;



/* ==================================================
Menu
================================================== */

SITE.menu = function(){
	$('#nav').onePageNav({
		filter: ':not(.external)'
	});
	
	selectnav('nav', // element to show on mobile
	{
	  label: '- Navigation Menu - ', // first label
	  nested: true,
	  indent: '- '
	});


	$header_animation = false;
	$(window).scroll(function(){
		if($(window).scrollTop() > $(window).height())
		{
			if(!$header_animation)
			{
				$header_animation = true;
				$('header').not('.visible').stop(true, true).slideDown(300, function(){
					$header_animation = false;
				});
			}
		}	
		
		else
		{
			if(!$header_animation)
			{
				$header_animation = true;
				$('header').not('.visible').stop(true, true).slideUp(100, function(){
					$header_animation = false;
				});
			}
		}
		
	});
}



/* ==================================================
Homepage
================================================== */

SITE.homepage = {};

SITE.homepage.fixHeight = function(){
		
	$slideImg = $('#homepage ul.slides img.bg');
	
	var $imgwidth = $slideImg.width();
	var $imgheight = $slideImg.height();
	
	var $imgwidth = 1000;
	var $imgheight = 676;
	
	var $winwidth = $(window).width();
	var $winheight = $(window).height();
	
	var $widthratio = $winwidth / $imgwidth;
	var $heightratio = $winheight / $imgheight;
	
	var $widthdiff = $heightratio * $imgwidth;
	var $heightdiff = $widthratio * $imgheight;
	
	//$('#homepage, #homepage ul.slides, #homepage ul.slides li').css('height', $winheight);
	$('#homepage,  #homepage ul.slides li').css('height', $winheight);
	
	if($heightdiff > $winheight) {
		$slideImg.css({
			width: $winwidth+'px',
			height: $heightdiff+'px'
		});
		} else {
		$slideImg.css({
			width: $widthdiff+'px',
			height: $winheight+'px'
		});		
	}
	
	$('#homepage_area').removeClass('loading');
}

SITE.homepage.slider = function(){
	// init flexslider
	// if you want see all values for the slider please visit http://www.woothemes.com/flexslider/
	$('#hp_slider').flexslider({
		animation: "slide",             //String: Select your animation type, "fade" or "slide"
		easing: "swing",                //{NEW} String: Determines the easing method used in jQuery transitions. jQuery easing plugin is supported!
		direction: "horizontal",        //String: Select the sliding direction, "horizontal" or "vertical"
		reverse: false,                 //{NEW} Boolean: Reverse the animation direction
		animationLoop: true,            //Boolean: Should the animation loop? If false, directionNav will received "disable" classes at either end
		smoothHeight: false,            //{NEW} Boolean: Allow height of the slider to animate smoothly in horizontal mode
		startAt: 0,                     //Integer: The slide that the slider should start on. Array notation (0 = first slide)
		slideshow: false,               //Boolean: Animate slider automatically
		slideshowSpeed: 7000,           //Integer: Set the speed of the slideshow cycling, in milliseconds
		animationSpeed: 200,            //Integer: Set the speed of animations, in milliseconds
		randomize: false,               //Boolean: Randomize slide order
		prevText: '<span class="icon-arrow-simple-left icon-white">prev</span>',
		nextText: '<span class="icon-arrow-simple-right icon-white">next</span>'
	});
}


SITE.homepage.init = function(){
	this.fixHeight();
	this.slider();


	$('.go_down a').live('click', function(){
		$target = $($(this).attr('href')).offset().top+10;
		
		$('body, html').animate({scrollTop : $target}, 500);
		return false;
	});
	  
	if(!$isMobile)
	{
		$(window).smartresize(function(){
			SITE.homepage.fixHeight();
		});
	}
	else
	{
		$(window).bind('orientationchange', function(e){
			SITE.homepage.fixHeight();
		});
	}
	  
}	

SITE.homepage.fixHeight();



/* ==================================================
Parallax
================================================== */

SITE.parallax = {};

SITE.parallax.bg = function(){
	if(!$isMobile && !$('.lt-ie9').length)
	{
		//save selectors as variables to increase performance
		var $window = $(window);
		var $firstBG = $('#px01');
		var bg1 = $("#px01 .bg");
		var $secondBG = $('#px02');
		var bg2 = $("#px02 .bg");
		var $thirdBG = $('#px03');
		var bg3 = $("#px03 .bg");
		var $fourthBG = $('#px04');
		var bg4 = $("#px04 .bg");
		
		var windowHeight = $window.height(); //get the height of the window
		
		
		//apply the class "inview" to a section that is in the viewport
		$('#px01, #px02, #px03, #px04').bind('inview', function (event, visible) {
				if (visible == true) {
				$(this).addClass("inview");
				} else {
				$(this).removeClass("inview");
				}
			});
		
		
		//function that is called for every pixel the user scrolls. Determines the position of the background
		/*arguments: 
			x = horizontal position of background
			windowHeight = height of the viewport
			pos = position of the scrollbar
			adjuster = adjust the position of the background
			inertia = how fast the background moves in relation to scrolling
		*/
		function newPos(x, windowHeight, pos, adjuster, inertia){
			return x + "% " + (-((windowHeight + pos) - adjuster) * inertia)  + "px";
		}
		
		//function to be called whenever the window is scrolled or resized
		function Move(){ 
			var pos = $window.scrollTop(); //position of the scrollbar
			var windowHeight = $window.height(); //get the height of the window
			
			if($(window).width() > 959)
			{

			//if the first section is in view...
			if($firstBG.hasClass("inview")){
				//call the newPos function and change the background position
				bg1.css({'backgroundPosition': newPos(50, windowHeight, pos, 0, 0.1)});
			}
			
			//if the second section is in view...
			if($secondBG.hasClass("inview")){
				//call the newPos function and change the background position
				bg2.css({'backgroundPosition': newPos(50, windowHeight, pos, 0, 0.1)});
			}
			
			if ($thirdBG.hasClass("inview")){
				//call the newPos function and change the background position
				bg3.css({'backgroundPosition': newPos(50, windowHeight, pos, 6000, 0.1)});
			}
			
			if ($fourthBG.hasClass("inview")){
				//call the newPos function and change the background position
				bg4.css({'backgroundPosition': newPos(50, windowHeight, pos, 6000, 0.1)});
			}
			}
		}
			
		
		$window.resize(function(){ //if the user resizes the window...
			Move(); //move the background images in relation to the movement of the scrollbar
		});		
		
		$window.bind('scroll', function(){ //when the user is scrolling...
			Move(); //move the background images in relation to the movement of the scrollbar
		});
	}
}

SITE.parallax.alignaments = function(){
	$('.parallax_content').each(function(){
		$h = $(this).height();
		$h_parallax = $(this).parents('.parallax').height();
		
		$(this).css('margin-top', ($h_parallax-$h)/2);
		
	});
}

SITE.parallax.init = function(){
	this.bg();
	this.alignaments();
	
	
	if(!$isMobile)
	{
		$(window).smartresize(function(){
			SITE.parallax.alignaments();	
		});
	}
	else
	{
		$(window).bind('orientationchange', function(e){
			SITE.parallax.alignaments();	
		});
	}
}



/* ==================================================
Progress Bar
================================================== */

SITE.progressBar = function(){
	$('.progress_bar .progress').each(function(){
		$progress = $(this).attr('data-progress');
		$(this).find('span').animate({ width : $progress+'%', 'opacity' : 1}, 500);	  // set yout speed in ms eg.500
	});
}




/* ==================================================
Animate List (Testimonial/Twitter)
================================================== */

SITE.animateList = function(){
	if(twitterInterval)
	{
		if(!$('.animate_list').not('.animated').length)
		{
			clearInterval(twitterInterval);
			twitterInterval = false;
		}
	}
	
	$('.animate_list').not('.animated').each(function(){
		$this = $(this);
		
		if(!$this.find('ul').length)
		return;
		
		$this.find('ul').fadeIn();
		SITE.parallax.alignaments();

		$this.addClass('animated');
		
		$this.find('li').css('opacity', 0);
		$this.find('li').eq(0).css('opacity', 1).addClass('active').show();
		
		$this.find('.btn_prev').live('click', function(){
			$animate_list = $($(this).attr('href'));
			$animate_slides = $animate_list.find('li').length;
			
			$animate_acutal = $animate_list.find('li').index($animate_list.find('li.active'));
			$animate_prev = $animate_acutal - 1;
			
			if($animate_prev < 0)
			{
				$animate_prev = $animate_slides-1;	
			}
			
			
			$animate_list.find('li.active').stop(true, true).animate({'top' : 50, 'opacity' : 0}, function(){
				$(this).removeClass('active');
				
				$animate_list.find('li').css({'top' : -50, 'opacity' : 0}).hide();
				
				$animate_list.find('li').eq($animate_prev).show().stop(true, true).animate({'top' : 0, 'opacity' : 1}).addClass('active');
			});

			return false;	
		});


		$this.find('.btn_next').live('click', function(){
			$animate_list = $($(this).attr('href'));
			$animate_slides = $animate_list.find('li').length;
			
			$animate_acutal = $animate_list.find('li').index($animate_list.find('li.active'));
			$animate_next = $animate_acutal + 1;
			
			if($animate_next >= $animate_slides)
			{
				$animate_next = 0;	
			}
			
			
			$animate_list.find('li.active').stop(true, true).animate({'top' : -50, 'opacity' : 0}, function(){
				$(this).removeClass('active');
				
				$animate_list.find('li').css({'top' : 50, 'opacity' : 0}).hide();
				
				$animate_list.find('li').eq($animate_next).show().stop(true, true).animate({'top' : 0, 'opacity' : 1}).addClass('active');
			});

			return false;	
		});
	});
}



/* ==================================================
Contact Form
================================================== */

SITE.contactForm = function(){
	
	// trigger form submit
	$("#contact_form_submitter").live('click',function() {
		
		$contact_form = $('#contact_form');
		
		// get input values
		var fields = $contact_form.serialize();

		// call service
		$.ajax({
			type: "POST", // type of request
			url: "php/contact.php", // service page invoked
			data: fields, // data values
			dataType: 'json', // type of response
			success: function(response) {

				// if everything is ok empty fields
				if(response.status){
					$('#contact_form input').val('');
					$('#contact_form textarea').val('');
				}
				
				// show response
				$('#contact_response').empty().html(response.html);
			}
		});
		return false;
	});
}



/* ==================================================
Isotope
================================================== */

SITE.portfolio = function(){
	
	// check if portfolio exists
	if($('#portfolio').length)
	{
		
		// init portfolio
		var $portfolio = $('#portfolio_items');
		$portfolio.isotope({
			resizable: false,
			masonry: { columnWidth: $portfolio.width() / 12 }
		});
		
		$portfolio.isotope({
			itemSelector : '.item',
			animationOptions: {
				duration: 100,
				easing: 'linear',
				queue: true
			}
		});
		
		
		// portfolio filters behavior
		var $optionSets = $('#portfolio_filters'),
		$optionLinks = $optionSets.find('a');
		
		$optionLinks.click(function(){
			var $this = $(this);
			if ( $this.hasClass('selected') ) {
				return false;
			}
			var $optionSet = $this.parents('#portfolio_filters');
			$optionSet.find('.active').removeClass('active');
			$this.addClass('active');
			var options = {},
			key = $optionSet.attr('data-filter-key'),
			value = $this.attr('data-filter-value');
			value = value === 'false' ? false : value;
			options[ key ] = value;
			if ( key === 'layoutMode' && typeof changeLayoutMode === 'function' ) {
				changeLayoutMode( $this, options )
			} else {
				$portfolio.isotope( options );
			}
			return false;
		});
		
		if(!$isMobile)
		{
			$(window).smartresize(function(){
				$portfolio.isotope({
					masonry: { columnWidth: $portfolio.width() / 12 }
				});
			});
		}
		else
		{
			$(window).bind('orientationchange', function(e){
				$portfolio.isotope({
					masonry: { columnWidth: $portfolio.width() / 12 }
				});
			});
		}

		
		
		$(window).load(function(){
			$('#portfolio_filters a').eq(0).click();
		});

	}
}



/* ==================================================
Twitter Widget
================================================== */

SITE.twitter = function(){
	
	// check if twitter_list exists
	if($('#twitter_list').length){
		
		$('#twitter_list').tweet({
			join_text: '',
			username: "StarsThemes", // your Twitter ID
			count: 3, // tweets limit
			view_text: "View on Twitter", // alt text,
			avatar_size: 80,
			template: '<div class="image"><div class="mask">{avatar}<span class="icon-social-twitter icon-white"></span></div></div><div class="text"><p>{text}</p><span class="author">{time}</span></div>'
		});	
		
		$('.twitter_area').removeClass('animated');
		
		twitterInterval = setInterval('SITE.animateList()', 1000);
	}
}



/* ==================================================
Map
================================================== */

SITE.map = {};
SITE.map.trigger = function(){
	$('#map_trigger').live('click', function(){
		
		$('.map').slideToggle(200, function(){
			
			$this = $('#map_trigger');
			
			$this.parents('.map-btn').toggleClass('active');
			
			if($this.parents('.map-btn').hasClass('active'))
			{
				$this.text('CLOSE MAP');	
			}
			else
				$this.text('OPEN MAP');	
		});
		
		
		return false;	
	});
}

SITE.map.createMap = function(){
	$map = $('.map');
	$map_id = $map.attr('id'); // get map id
	$map_lat = $map.attr('data-mapLat'); // set latitude by attribute data-mapLat
	$map_lon = $map.attr('data-mapLon'); // set longitude by attribute data-mapLon
	$map_zoom = parseInt($map.attr('data-mapZoom')); // set zoom by attribute data-mapZoom
	$map_title = $map.attr('data-mapTitle'); // set marker title by attribute data-mapTitle
	
	
	var latlng = new google.maps.LatLng($map_lat, $map_lon); // get map center by coords
	var options = { 
		scrollwheel: false, // enable/disable mouse scroll wheel
		zoom: $map_zoom, // set zoom
		center: latlng, // set center of the map
		mapTypeId: google.maps.MapTypeId.ROADMAP // set type of map
	};
	
	map = new google.maps.Map(document.getElementById($map_id), options); // create map

	// add marker
	var marker = new google.maps.Marker({
		position: latlng, // set marker position
		map: map, // add marker to map
		title: $map_title // set marker title
	});
	
	google.maps.event.trigger(map, "resize"); 
	map.setCenter(latlng);
}

SITE.map.loading = function(){
	$('.map').slideUp();
}

SITE.map.init = function(){
	if($('.map').length)
	{
		this.trigger();
		this.createMap();
		
		setTimeout('SITE.map.loading()', 1000); // hide map on page loaded
	}
}



/* ==================================================
Detect Device
================================================== */

SITE.detectDevice = function(){
	if( /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ) {
		$isMobile = true;
		$('body').addClass('mobile');
	}
}



/* ==================================================
Team Section
================================================== */

SITE.team = function(){
	$('.team_single .image').on('mouseover', function(){
		$(this).find('.mask').addClass('active');
	
		return false;	
	}).on('mouseleave', function(){
		$(this).find('.mask').removeClass('active');	

		return false;	
	});
}



/* ==================================================
Lightbox/prettyPhoto
================================================== */

SITE.lightbox = function(){
	$('a[data-rel]').each(function() {
        $(this).attr('rel', $(this).data('rel'));
    });
 	
	// init lightbox
	// if you want see all values for the lightbox please visit http://www.no-margin-for-errors.com/projects/prettyphoto-jquery-lightbox-clone/documentation/
 	$('a[rel^="lightbox"]').prettyPhoto({
		theme: 'pp_default', 				// pp_default / light_rounded / dark_rounded / light_square / dark_square / facebook		
		animation_speed: 'fast', 			// fast/slow/normal
		slideshow: 5000, 					// false OR interval time in ms
		autoplay_slideshow: false, 			// true/false
		opacity: 0.80, 						// Value between 0 and 1
		show_title: true, 					// true/false
		allow_resize: true, 				// Resize the photos bigger than viewport. true/false
		default_width: 500,
		default_height: 344,
		counter_separator_label: '/', 		// The separator for the gallery counter 1 "of" 2.
		horizontal_padding: 20, 			// The padding on each side of the picture.
		hideflash: false, 					// Hides all the flash object on a page, set to TRUE if flash appears over prettyPhoto.
		wmode: 'opaque', 					// Set the flash wmode attribute.
		autoplay: true, 					// Automatically start videos: True/False
		modal: false, 						// If set to true, only the close button will close the window.
		deeplinking: false, 				// Allow prettyPhoto to update the url to enable deeplinking. 
		overlay_gallery: false, 			// If set to true, a gallery will overlay the fullscreen image on mouse over. 
		keyboard_shortcuts: true, 			// Set to false if you open forms inside prettyPhoto.
		social_tools: false, 				// show/hide social tools.
	});
	
	$('#portfolio_items .mask, .mask').live('click', function(){
		$(this).next('a').click();
	});
		
	$('#portfolio_items .item a[data-rel="parent"], .item a[data-rel="parent"]').click( function() {
		window.open( $(this).attr('href') );
		return false;
	});

}



/* ==================================================
Back Slide
================================================== */

SITE.backsection = function(){
	// trigger backsection click
	$('.backsection a').live('click', function(){
		$target = $($(this).attr('href')).offset().top;
		
		$('body, html').animate({scrollTop : $target}, 500);
		return false;
	});
}



/* ==================================================
Accordion
================================================== */

SITE.accordion = function(){
	$accordion_trigger = $('.accordion_trigger');
	
	$accordion_trigger.live('click', function(){
		$accordion_target =  $(this).parent('.accordion_container').find('.accordion_content');
		if( $accordion_target.is(':hidden') ) 
		{
			$(this).parents('.accordion').find('.accordion_content').slideUp();
			$accordion_trigger.removeClass('active');
			$(this).addClass('active');
			$accordion_target.slideDown(300); // set yout speed in ms eg.300
		}
		else{
			$(this).removeClass('active');
			$accordion_target.slideUp(300); // set yout speed in ms eg.300
		}
		return false;
	});
}



/* ==================================================
Toggle
================================================== */

SITE.toggle = function(){
	$toggle_trigger = $('.toggle_trigger');
	
	$toggle_trigger.live('click', function(){
		$toggle_target =  $(this).parent('.toggle_container').find('.toggle_content');
		if( $toggle_target.is(':hidden') ) 
		{
			$(this).addClass('active');
			$toggle_target.slideDown(300); // set yout speed in ms eg.300
		}
		else{
			$(this).removeClass('active');
			$toggle_target.slideUp(300); // set yout speed in ms eg.300
		}
		return false;
	});
}



/* ==================================================
Tabs
================================================== */

SITE.tabs = function(){
	$tab_trigger = $('.tabs a');

	$($tab_trigger).live('click', function(){
		$tab_target =  $($(this).attr('href'));
		if( $tab_target.is(':hidden') ) 
		{
			$(this).parents('.tabs').find('a').removeClass('active');
			$(this).addClass('active');

			$(this).parents('.tabs_area').find('.tab').removeClass('active');

			$tab_target.addClass('active');
		}
		return false;
	});
}



/* ==================================================
Alerts
================================================== */

SITE.alertMsg = function(){
	// close alert on click
	$('.alert_close').live('click', function(){
		$(this).parents('.alert').fadeOut();
		
		return false;	
	});
}



/* ==================================================
Tooltips
================================================== */

SITE.tooltips = function(){
	$('.tooltip[title]').colorTip({
		color:'black'  // default tooltip color
	});
}



/* ==================================================
Preloader
================================================== */

SITE.preload = function(){
	if($('#loader').length)
	{	
		if ( $.browser.msie ){
			$('#loader').addClass("null");
			return;
		 }
		else if($.browser.opera)
		{
			$('#loader').addClass("null");
			return;
		}
		

		disable_scroll();

		document.addEventListener("loadIncrease", function(){
			$('#loader span').text(Math.round(myPreloader.percentage));
		})
			
		myPreloader = new sPreloader({
			contentDiv: 'wrap',  			//ID of the main content DIV
			loaderDiv: 'loader', 			//ID of the loader DIV
			excludingClass: 'nopreload', 	//If you want to exculde an image from preloading, choose a class name
			logProgress: false,				//console.log the progress of the loader
			showProgress: true,				//show percent progress
			animation: 'fade',				//Animation type;  'fade' | 'none'
			animationSpeed: '0.5'			//Animation speed;  '0.5' = 500 milliseconds
		});
		
		myPreloader.start();
	}
}

SITE.preload();



/* ==================================================
Init
================================================== */

SITE.init = function(){
	SITE.detectDevice(); 			// detect device
	SITE.homepage.init(); 			// enable homepage fix height and slider
	SITE.progressBar(); 			// enable progressbar function
	SITE.menu(); 					// enable menu navigation
	SITE.animateList(); 			// enable animate list
	SITE.portfolio(); 				// enable portfolio
	SITE.parallax.init(); 			// enable parallax
	SITE.twitter(); 				// enable twitter
	SITE.contactForm(); 			// enable contact form function
	SITE.team(); 					// enable team behavior
	SITE.map.init(); 				// enable map
	SITE.lightbox(); 				// enable lightbox
	SITE.backsection(); 			// enable backsection
	SITE.accordion();	 			// enable accordion
	SITE.toggle();	 				// enable toggle
	SITE.alertMsg();				// enable alert messages
	SITE.tabs();	 				// enable tabs
	SITE.tooltips();	 			// enable tooltips
}

$(function(){
	SITE.init(); 					// init site
});




/* ==================================================
Utils
================================================== */

function preventDefault(e) {
	e = e || window.event;
	if (e.preventDefault)
	  e.preventDefault();
	e.returnValue = false;  
}

function keydown(e) {
	// left: 37, up: 38, right: 39, down: 40,
	// spacebar: 32, pageup: 33, pagedown: 34, end: 35, home: 36
	var keys = [32, 33, 34, 35, 36, 37, 38, 39, 40];
	
	for (var i = keys.length; i--;) {
		if (e.keyCode === keys[i]) {
			preventDefault(e);
			return;
		}
	}
}

function wheel(e) {
	preventDefault(e);
}


function disable_scroll() {
	if (window.addEventListener) {
	  window.addEventListener('DOMMouseScroll', wheel, false);
	}
	window.onmousewheel = document.onmousewheel = wheel;
	document.onkeydown = keydown;
}

function enable_scroll() {
	if (window.removeEventListener) {
		window.removeEventListener('DOMMouseScroll', wheel, false);
	}
	window.onmousewheel = document.onmousewheel = document.onkeydown = null;  
}
		

