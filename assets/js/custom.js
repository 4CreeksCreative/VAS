var locale = (/\/de\/|\/es\//ig.exec(window.location.pathname)) ? /\/de\/|\/es\//ig.exec(window.location.pathname)[0].substring(0,3) : ''
$(document).ready(function(){
		$('a:not(.language, .social)').each(function(i,val){
			if($(val).attr('href') != '#' && $(val).attr('href') != undefined){
				console.log('changed '+$(val).attr('href') + ' to ' + locale+$(val).attr('href'))
				$(val).attr('href',locale+$(val).attr('href'))
			}
		})
		$('#contact-form').attr('action',locale+$('#contact-form').attr('action'))
		
		$('#share-icons a.facebook').attr('href', '#')
		$('#share-icons a.twitter').attr('href', 'https://twitter.com/home?status='+window.location.href)
		$('#share-icons a.linkedin').attr('href', 'https://www.linkedin.com/shareArticle?mini=true&url='+window.location.href+'&title='+$('#updatetitle').text()+'&summary='+$('#featuredtext').text()+'&source='+window.location.href)
	
})
