var locale = window.location.pathname.substring(0,3)
$(document).ready(function(){
	
	$('a:not(.language)').each(function(i,val){
		console.log('changed '+$(val).attr('href') + ' to ' + locale+$(val).attr('href'))
		$(val).attr('href',locale+$(val).attr('href'))


})
})
