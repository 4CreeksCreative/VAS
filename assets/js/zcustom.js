


var locale = (/\/de\/|\/ru\/|\/es\//ig.exec(window.location.pathname)) ? /\/de\/|\/ru\/|\/es\//ig.exec(window.location.pathname)[0].substring(0,3) : ''
$(document).ready(function(){
		$('a:not(.language, .social, .lb-next, .lb-prev)').each(function(i,val){
			if(!(/^(#)\w+$|^(#)+$|(http)|\/de\/|\/ru\/|\/es\/|\/\/|(contentful)/ig).test($(val).attr('href')) && $(val).attr('href') != undefined){
				console.log('changed '+$(val).attr('href') + ' to ' + locale+$(val).attr('href'))
				$(val).attr('href',locale+$(val).attr('href'))
			}
		})
		//$('#contact-form').attr('action',locale+$('#contact-form').attr('action'))

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
	e.preventDefault();
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
	if (grecaptcha.getResponse() === ''){
		errorText = 'Please complete captcha'
	}
	if (/https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)/igm.test($('textarea').val()) === true){
		errorText = 'Please do not include URLs in the message body'
	}
	thisForm.append('<div class="form-error" style="display: none;">' + errorText + '</div>');
	thisForm.append('<div class="form-success" style="display: none;">' + successText + '</div>');
	formError = body.find('.form-error');
	formSuccess = body.find('.form-success');
	thisForm.addClass('attempted-submit');
	if (mr.forms.validateFields($('form.form-email.custom-script')) !== 1 && grecaptcha.getResponse() != '' && /https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)/igm.test($('textarea').val()) != true){
		$.post(thisForm.attr("action"), thisForm.serialize()).then(function() {});
	}
	else mr.forms.showFormError(formSuccess, formError, 1000, 5000, 500);

})




// --------- CUSTOM JOB ENTRY SEARCH
function JobSearch(){
	var query = {
		text: $('#jobQuery').val() == '' ? null : new RegExp($('#jobQuery').val(),'i'),
		location: $('#jobLocation').val() == '*' ? null : new RegExp($('#jobLocation').val(),'i'),
		category: $('#jobCategory').val() == '*' ? null : new RegExp($('#jobCategory').val(),'i'),
	}

	$('.job-post').show()

	$('.job-post').each(function(i,val){
		if (query.location != null && !(query.location).test($(val).attr('class').toString())){
			$(val).hide()
		}
		if (query.category != null && !(query.category).test($(val).attr('class').toString())){
			$(val).hide()
		}
		if (query.text != null && !(query.text).test($(val).find('#item-title').html().toString())){
			$(val).hide()
		}
	})

}
$('#jobQuery').keyup(function(e){
	if(e.which == 13 || e.keyCode == 13){
			e.preventDefault()
			JobSearch()
		}
})
// $(document).on('keydown','#jobQuery',function(e){
// 	if(e.keycode == 13){
// 		e.preventDefault()
// 		JobSearch()
// 	}
// })
$(document).on('click','#job-search-btn',function(){
	JobSearch()
})
