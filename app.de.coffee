axis         = require 'axis'
rupture      = require 'rupture'
autoprefixer = require 'autoprefixer-stylus'
js_pipeline  = require 'js-pipeline'
css_pipeline = require 'css-pipeline'
contentful   = require 'roots-contentful'
slugify      = require 'slugify'
md           = require 'marked'

module.exports =
	output: 'public/de'
	ignores: ['start_app.js','readme.md', '**/layout.*', '**/_*', '.gitignore', 'ship.*conf','**/public/**','**/img/resized/*','**/img/stack/*']
	env: 'de'
	locals:
		env: 'de'
		md:require 'marked'
	extensions: [
		js_pipeline(files: ['assets/**/*.js','assets/js/*.coffee']),
		css_pipeline(files: ['assets/**/*.css','assets/css/*.styl'])

		contentful
			access_token: 'f34cc60b7d98d36e0c5483b32cd4538fe787cc5b758ce0e8e202ce7026ae4d69' #DRAFT TOKEN
			preview: true
			#access_token: '73bcd210fd4dd20baef3fb8293fba85fc18f91e563f06c146991414739107f9e'
			space_id: 'c7vdx45k3txt'
			content_types:
				##Rates:
					##id: 'loanRates'
					##template: 'views/partial/_cf_post.jade'
					##filters: { 'fields.environment[in]': ['staging', 'production'] }
					##path: (e) -> "blogging/#{e.category}/#{slugify(e.title)}"
					##write: 'data.json'
					##sort: compareFunction
					##transform: transformFunction
				##press_links:
				##  id: 'xxxxxx'
				Home:
					id: 'homePage'
					filters:{
						'locale':'de'

					}
				HomeProducts:
					id: 'homePageProductsGerman'
					filters:{
						'locale':'en-US'
					}
				About:
					id: 'aboutUsPage'
					filters:{
						'locale':'de'
					}
				Support:
					id: 'supportPageGerman'
					filters:{
						'locale':'en-US'
					}
				Updates:
					id: 'blogPostGerman'
					filters:{
						'locale':'en-US'
						'order': '-fields.date'

					}
					path: (e) -> "blog/#{slugify(e.url)}"
					template: 'views/partials/_update.jade'
				ProductUpdates:
					id: 'updatePostGerman'
					filters:{
						'locale':'en-US'
						'order': '-fields.date'
					}
					path: (e) -> "updates/#{slugify(e.url)}"
					template: 'views/partials/_update.jade'
				InspirationUpdates:
					id: 'inspirationPostGerman'
					filters:{
						'locale':'en-US'
						'order': '-fields.date'
					}
					path: (e) -> "inspiration/#{slugify(e.url)}"
					template: 'views/partials/_update.jade'
				Navigation:
					id: 'navigation'
					filters:{
						'locale':'de'
					}
				Footer:
					id: 'footer'
					filters:{
						'locale':'de'
					}
				Social:
					id: 'social'
					filters:{
						'locale':'de'
					}
				Contact:
					id: 'contactPage'
					filters:{
						'locale':'de'
					}
				UpdatesPage:
					id: 'updatesPage'
					filters:{
						'locale':'de'
					}
				InspirationPage:
					id: 'inspirationPage'
					filters:{
						'locale':'de'
					}

				TOTM:
					id: 'tipOfTheMonthGerman'
					filters:{
						'locale':'en-US'
						'order': '-fields.date'
					}
					template: 'views/partials/_TOTM.jade'
				TOU:
					id: 'termsOfUse'
					filters:{
						'locale':'de'
					}
				Privacy:
					id: 'privacyPolicy'
					filters:{
						'locale':'de'
					}
				BlogCategories:
					id: 'blogCategoryGerman'
					filters:{
						'locale':'en-US'
						'order': 'fields.title'
					}
				Jobs:
					id:'jobListing'
					filters:{
						'order':'-fields.date'
						'locale':'de'
					}
					template: 'views/partials/_job.jade'
				JobCategories:
					id:'jobCategory'
					filters:{
						'order':'fields.category'
						'locale':'de'
					}
				JobLocations:
					id:'jobLocation'
					filters:{
						'order':'fields.location'
						'locale':'de'
					}


	]

	stylus:
		use: [axis(), rupture(), autoprefixer()]
		sourcemap: true

	'coffee-script':
		sourcemap: true

	jade:
		pretty: true

	server:
		clean_urls:true
