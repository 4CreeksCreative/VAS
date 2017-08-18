var locale = (/\/de\/|\/es\//ig.exec(window.location.pathname)) ? /\/de\/|\/es\//ig.exec(window.location.pathname)[0].substring(0,3) : ''
$(document).ready(function(){
		$('a:not(.language)').each(function(i,val){
			if($(val).attr('href') != '#'){
				console.log('changed '+$(val).attr('href') + ' to ' + locale+$(val).attr('href'))
				$(val).attr('href',locale+$(val).attr('href'))
			}
		})
	
})
