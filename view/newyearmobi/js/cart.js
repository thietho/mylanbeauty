function Cart()
{
	this.load = function()
	{
		//$("#sitebarcartlist").load(HTTP_SERVER+"?route=sitebar/cart/getList");
			
		$.ajax({
			url: HTTP_SERVER+"?route=addon/cart/getCount",
			cache: false,
			success: function(html){
				$("#cartcout").html(html);
				
			}
		});
	}
	this.add = function(mediaid)
	{
		
		$.mobile.loading( "show", {
	            text: "Loading",
	            textVisible: true,
	            theme: 'b',
	            textonly: false,
	            html: processing
	    });
		$.get(HTTP_SERVER+"?route=addon/cart/add&mediaid="+mediaid,
			
			function(data){
				
				if(data == "true")
				{
					$("#warring").load(HTTP_SERVER+"?route=common/warring/cart&mediaid="+mediaid,function(){
						setTimeout('$.mobile.loading( "hide" );',3000);
					});
					
					cart.load()
					
				}
				//$.mobile.loading( "hide" );
			}
		);
	}
	
	this.update = function(mediaid,qty)
	{
		$.get(HTTP_SERVER+"?route=addon/cart/update&mediaid="+mediaid+"&qty="+qty,
			function(data){
				if(data == "true")
				{
					$("#sitebarcartlist").load(HTTP_SERVER+"?route=sitebar/cart/getList");
					$("#addoncartlist").load(HTTP_SERVER+"?route=addon/cart/getList");
				}
				
			}
		);
	}
	
	this.remove = function(mediaid)
	{
		$.get(HTTP_SERVER+"?route=addon/cart/remove&mediaid="+mediaid,
			function(data){
				if(data == "true")
				{
					$("#sitebarcartlist").load(HTTP_SERVER+"?route=sitebar/cart/getList");
					$("#addoncartlist").load(HTTP_SERVER+"?route=addon/cart/getList");
				}
				
			}
		);
	}
}

var cart = new Cart();
$(document).ready(function(e) {
    cart.load();
});