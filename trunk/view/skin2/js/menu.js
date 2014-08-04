function mainmenu(){
$(" #ben-main-nav ul ").css({display: "none"}); // Opera Fix
$(" #ben-main-nav li").hover(function(){
		$(this).find('ul:first').css({visibility: "visible",display: "none"}).show(400);
		},function(){
		$(this).find('ul:first').css({visibility: "hidden"});
		});
}

$(document).ready(function(){					
	mainmenu();
	fixlayout();
});
$(function(){
	
	$(window).resize(function(e) {
		fixlayout();
    });	
});
function fixlayout()
{
	if($(this).width()<1000)
		$('.ben-sidebar').hide();
	else
		$('.ben-sidebar').show();
}