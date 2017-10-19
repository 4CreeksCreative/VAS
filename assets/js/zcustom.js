
// --------- CUSTOM LOCALE LINK MANIPULATION

var locale = (/\/de\/|\/es\//ig.exec(window.location.pathname)) ? /\/de\/|\/es\//ig.exec(window.location.pathname)[0].substring(0,3) : ''
$(document).ready(function(){
		$('a:not(.language, .social, .lb-next, .lb-prev)').each(function(i,val){
			if(!(/^(#)\w+$|^(#)+$|(http)|\/de\/|\/es\/|\/\/|(contentful)/ig).test($(val).attr('href')) && $(val).attr('href') != undefined){
				//console.log('changed '+$(val).attr('href') + ' to ' + locale+$(val).attr('href'))
				$(val).attr('href',locale+$(val).attr('href'))
			}
		})
		$('#contact-form').attr('action',locale+$('#contact-form').attr('action'))

		$('#share-icons a.facebook').attr('href', 'https://www.facebook.com/dialog/share?app_id=407590409638822&display=popup&href='+window.location.href+'&quote='+encodeURIComponent($('#page-description').attr('content')))
		$('#share-icons a.twitter').attr('href', 'https://twitter.com/home?status='+window.location.href)
		$('#share-icons a.linkedin').attr('href', 'https://www.linkedin.com/shareArticle?mini=true&url='+window.location.href+'&title='+$('#updatetitle').text()+'&summary='+$('#featuredtext').text()+'&source='+window.location.href)
		$('#share-icons a.email').attr('href', 'mailto:?subject=' + encodeURIComponent($('#page-title').attr('content')) + '&body=' + encodeURIComponent('Check out this article on VAS.com') + '%0D%0A' + encodeURIComponent($('#page-description').attr('content'))+ '%0D%0A' + window.location.href)
		//console.log('current page = '+ window.location.pathname)
		$('header a').each(function(i,val){

			var regex = new RegExp('(^'+window.location.pathname+'$)','ig')

			if(regex.test($(val).attr('href'))){
				$(val).addClass('currentPage')
				//console.log('added currentPage class to '+ $(val).attr('href'))
			}
		})
})

// --------- CUSTOM FORM VALIDATION

$('form.form-email.custom-script').submit(function(e){
	var body          = $('body'),
			thisForm      = $(e.target).closest('form'),
			formAction    = typeof thisForm.attr('action') !== typeof undefined ? thisForm.attr('action') : "",
			submitButton  = thisForm.find('button[type="submit"], input[type="submit"]'),
			error         = 0,
			originalError = thisForm.attr('original-error'),
			captchaUsed   = thisForm.find('div.recaptcha').length ? true:false,
			successRedirect, formError, formSuccess, errorText, successText;

		body.find('.form-error, .form-success').remove();
		submitButton.attr('data-text', submitButton.text());
		errorText = thisForm.attr('data-error') ? thisForm.attr('data-error') : "Please fill all fields correctly";
		successText = thisForm.attr('data-success') ? thisForm.attr('data-success') : "Thanks, we'll be in touch shortly";
		thisForm.append('<div class="form-error" style="display: none;">' + errorText + '</div>');
		thisForm.append('<div class="form-success" style="display: none;">' + successText + '</div>');
		formError = body.find('.form-error');
		formSuccess = body.find('.form-success');
		thisForm.addClass('attempted-submit');


	if (mr.forms.validateFields($('form.form-email.custom-script')) !== 1) return
	else e.preventDefault(); mr.forms.showFormError(formSuccess, formError, 1000, 5000, 500);

})


// --------- CUSTOM JOB ENTRY SEARCH
$(document).on('click','#job-search-btn',function(){
	function newRegex(string) {
		if (string != null){
			return new RegExp(string, 'ig')
		}
		else {
			return false
		}
	}
	var query = {
		text:$('#jobQuery').val() == '' ? null : $('#jobQuery').val(),
		class:[
			$('#jobLocation').val() == '*' ? null : $('#jobLocation').val(),
			$('#jobCategory').val() == '*' ? null : $('#jobCategory').val()
		]
	},
		regex = ''
	$.each(query.class,function(i,val){
		if (regex != '' && val != null){
			regex += '|('+val+')'
		}
		else if (val != null) {
			regex = '('+val+')'
		}
	})
	if(regex != ''){
		regex = newRegex(regex)
		$('.job-post').hide()
		$('.job-post').each(function(i,val){
			if(regex.test($(val).attr('class'))){
				$(val).show()
			}
		})
	}
	else {
		$('.job-post').show()
	}

	// $('.job-post').hide()
	// var show = true
	// var allCats = true
	// $('.job-post').each(function(j,val2){
	// 	$.each(query.class,function(i,val){
	// 		if(val != null){
	// 			show = false
	// 			allCats = false
	// 			if($(val2).hasClass(val)){
	// 				$(val2).show();
	// 			}
	// 		}
	// 	})
	// 	if(query.text != null && allCats){
	// 		show = false
	// 		$('.job-post').each(function(i,val){
	// 			if($(val).find('#item-title').html().search(newRegex('('+query.text+')')) != -1){
	// 				$(val).show();
	// 			}
	// 		})
	// 	}
	// 	else if(query.text != null && !allCats){
	// 		$('.job-post').each(function(i,val){
	// 			if($(val).find('#item-title').html().search(newRegex('('+query.text+')')) === -1){
	// 				$(val).hide();
	// 			}
	// 		})
	// 	}
	// })
	//
	// if(show){
	// 	$('.job-post').show()
	// }


})
