var locale = (/\/de\/|\/es\//ig.exec(window.location.pathname)) ? /\/de\/|\/es\//ig.exec(window.location.pathname)[0].substring(0,3) : ''
$(document).ready(function(){
		$('a:not(.language, .social, .lb-next, .lb-prev)').each(function(i,val){
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