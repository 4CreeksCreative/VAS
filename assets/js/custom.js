var locale = (/\/de\/|\/es\//ig.exec(window.location.pathname)) ? /\/de\/|\/es\//ig.exec(window.location.pathname)[0].substring(0,3) : ''
$(document).ready(function(){
		$('a:not(.language, .social)').each(function(i,val){
			// if($(val).is('#fbshare')){
			// 	$(val).attr('href',"https://www.facebook.com/dialog/share?"+"app_id=407590409638822"+"&display=popup"+"&href="+window.location.href)
			// }
			if($(val).attr('href') != '#' && $(val).attr('href') != undefined){
				console.log('changed '+$(val).attr('href') + ' to ' + locale+$(val).attr('href'))
				$(val).attr('href',locale+$(val).attr('href'))
			}
		})
	
})
