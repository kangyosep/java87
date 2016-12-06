$(function(){
	gnb()
	web()	
})




function gnb(){
	
/*	$("#header>h1>a").mouseover(function(){
		$(this).child('img').attr('src','images/logo_gr.svg');
	});*/
    
    var $list = $(".sub")
	var th = $list.height()
	var isPlay = true;
    
    $list.hide();
	
	$(".hvr-sweep-to-left").click(function(){
   		
        if(isPlay){
			$(this).next().slideDown().show();
		}
        else if(!isPlay){
			$list.slideUp();
		}
        
        isPlay = !isPlay
		return false;		
    });


}


function web() {

	
}	