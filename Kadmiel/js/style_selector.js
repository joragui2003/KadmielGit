var $layout, $layout_style, $skin, $bg;

var SS = window.SS || {};

SS.trigger = function(){
	$('#ss_trigger').live('click', function(){
		$('#style_selector').toggleClass('active');
		
		if(!$('#style_selector').hasClass('active')){
			$('#style_selector').animate({'left' : -200}, 120);	
		}
		else{
			$('#style_selector').animate({'left' : 0}, 120);	
		}
		
		
		return false;
	});
}

SS.html = function(){
	$html = ' \
	<div id="style_selector"> \
		<div id="ss_head"> \
			Style Selector \
			<a href="#" id="ss_trigger"><span>open</span></a> \
		</div> \
		 \
		<div id="ss_body"> \
			<div class="ss_box" style="display:none"> \
				<h4>Layout Style</h4> \
				<a href="#" class="btn_ss ss_layout ss_default" data-layout="wide">Wide</a> \
				<a href="#" class="btn_ss right ss_layout" data-layout="boxed">Boxed</a> \
			</div> \
			 \
			<div class="ss_box"> \
				<h4>Layout Color Style</h4> \
				<a href="#" class="btn_ss ss_layout_style ss_default" data-layout="white">White</a> \
				<a href="#" class="btn_ss right ss_layout_style" data-layout="dark">Dark</a> \
			</div> \
			 \
			<div class="ss_box skins"> \
				<h4>Skin</h4> \
				<ul> \
					<li class="light-orange"><a href="#" class="ss_skin light-orange ss_default" data-skin="light-orange"></a></li> \
					<li class="light-cyan"><a href="#" class="ss_skin light-cyan" data-skin="light-cyan"></a></li> \
					<li class="aqua"><a href="#" class="ss_skin aqua" data-skin="aqua"></a></li> \
					<li class="light-green"><a href="#" class="ss_skin light-green" data-skin="light-green"></a></li> \
					<li class="lemon last"><a href="#" class="ss_skin lemon" data-skin="lemon"></a></li> \
					 \
					<li class="red"><a href="#" class="ss_skin red" data-skin="red"></a></li> \
					<li class="purple"><a href="#" class="ss_skin purple" data-skin="purple"></a></li> \
				</ul> \
			</div> \
		</div> \
		 \
	</div> \
	';
	$('body').append($html);
}





SS.showBackgrounds = function(){
	$('.ss_bgs').find('a').each(function(){
		$folder = $(this).parents('.ss_bgs').attr('data-style');
		$bg = $(this).attr('data-bg');
		
		if($bg && $bg != 'none')
		{
			if($bg.charAt(0) != '_')
			{
				$(this).parent('li').css('background-image', 'url(images/'+$folder+'/patterns/'+$bg+')');	
			}
		}
		
	});
}


SS.controls = function(){
	$('.ss_layout').live('click', function(){
		$layout = $(this).attr('data-layout');
		
		$('#wrap').removeClass().addClass($layout);
		
		
		$('.ss_layout').removeClass('active');
		$(this).addClass('active');
		
		
		if($layout == 'boxed')
		{
			$('body').removeClass();
			$('#ss_bg_boxed a').eq(0).click();	
			$('#ss_bg_boxed').show();	
			$('#ss_bg_dark, #ss_bg_white').hide();	
		}
		else if(!$layout_style || $layout_style == 'white') 
		{
			$('#ss_bg_dark, #ss_bg_boxed').hide();	
			$('.ss_layout_style').eq(0).click();
		}
			
		else if($layout_style == 'dark') 
		{
			$('#ss_bg_white, #ss_bg_boxed').hide();	
			$('.ss_layout_style').eq(1).click();
		}
			
		
		SS.setCookie('layout', $layout);
		return false;
	});
	
	
	$('.ss_layout_style').live('click', function(){
		$layout_style = $(this).attr('data-layout');
		
		$('.ss_layout_style').removeClass('active');
		$(this).addClass('active');
		
		$('head link[data-name=layout]').attr('href', 'css/layout/'+$layout_style+'.css');
			
		if($layout_style == 'dark')
		{
			if($layout != 'boxed')
			{
				$('#ss_bg_dark a').eq(0).click();	
				$('#ss_bg_dark').show();	
				$('#ss_bg_white, #ss_bg_boxed').hide();	
			}
		}
		else
		{
			if($layout != 'boxed')
			{
				$('#ss_bg_white a').eq(0).click();	
				$('#ss_bg_white').show();	
				$('#ss_bg_dark, #ss_bg_boxed').hide();	
			}
		}

		SS.setCookie('layoutStyle', $layout_style);
		return false;
	});
	
	$('.ss_skin').live('click', function(){
		$skin = $(this).attr('data-skin');
		
		$('head link[data-name=skin]').attr('href', 'css/skins/'+$skin+'.css');
		
		$('.ss_skin').removeClass('active');
		$(this).addClass('active');

		SS.setCookie('skin', $skin);
		return false;	
	});
	
	
	$('.ss_bg').live('click', function(){
		
		$('body').removeClass();

		$bg = $(this).attr('data-bg');

		if($bg.charAt(0) == '_')
		{
			$bg = '';	
		}
		else
		{
			$bg = $bg.split('.png').join('');
			$('body').addClass($layout+' bg_'+$layout_style+' '+$bg);
		}
		

		$('.ss_bg').removeClass('active');
		$(this).addClass('active');

		SS.setCookie('bg', $bg);
		return false;	
	});
}



SS.readCookies = function(){
	
	$layout = SS.readCookie('layout');
	if($layout)
	{
		$('#wrap').addClass($layout);
		$('.ss_layout').removeClass('active');
		$('div.ss_bgs').hide();

		if($layout == 'boxed')
		{
			$('body').removeClass();
			$('#ss_bg_boxed').show();	
			$('.ss_layout').eq(1).addClass('active');
		}
		else
		{
			$('.ss_layout').eq(0).addClass('active');
		}
	}
	
	else{
		$('a.ss_default').addClass('active');
		$('div.ss_bgs').hide();
		$('div.ss_default').show();
	}


	$layout_style = SS.readCookie('layoutStyle');
	if($layout_style)
	{

		$('head link[data-name=layout]').attr('href', 'css/layout/'+$layout_style+'.css');
		$('.ss_layout_style').removeClass('active');
		$('.ss_layout_style[data-layout="'+$layout_style+'"]').addClass('active');
		
		if($layout != 'boxed')
		{
			if($layout_style == 'dark')
			{
				$('#ss_bg_dark').show();	
				$('#ss_bg_white').hide();	
			}
			else
			{
				$('#ss_bg_white').show();	
				$('#ss_bg_dark').hide();	
			}
		}
	}



	$skin = SS.readCookie('skin');
	if($skin)
	{
		$('head link[data-name=skin]').attr('href', 'css/skins/'+$skin+'.css');
		$('.ss_skin').removeClass('active');
		$('.ss_skin[data-skin="'+$skin+'"]').addClass('active');
	}
	else{
		$('a.ss_skin.ss_default').addClass('active');
	}
	
	
	$bg = SS.readCookie('bg');
	if($bg)
	{
		$('body').addClass($layout+' bg_'+$layout_style+' '+$bg);
		$('.ss_bg').removeClass('active');
		$('.ss_bg[data-bg="'+$bg+'.png"]').addClass('active');
	}
	else
	{
		$('.ss_bgs').each(function(){
			$(this).find('.ss_bg').eq(0).addClass('active');
		});
	}
	
	
}


SS.setCookie = function(cookie, value)
{
	$.cookie(cookie, value);
}

SS.readCookie = function(cookie)
{
	return $.cookie(cookie);
}



SS.init = function(){
	SS.trigger();
	SS.html();
	SS.showBackgrounds();
	SS.readCookies();
	SS.controls();
}



SS.init();
