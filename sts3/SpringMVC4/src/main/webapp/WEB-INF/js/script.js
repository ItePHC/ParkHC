/** 
 *
 */
 
 $(function(){
 	$("#myimg").attr("src","../images/f3.png");
 	
 	$("#myimg").hover(function(){
 		$(this).attr("src", "../images/f4.png");
 	}, function(){
 		$(this).attr("src","../images/f3.png");	
 	});
 });