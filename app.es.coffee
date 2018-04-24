axis         = require 'axis'
rupture      = require 'rupture'
autoprefixer = require 'autoprefixer-stylus'
js_pipeline  = require 'js-pipeline'
css_pipeline = require 'css-pipeline'
contentful   = require 'roots-contentful'
slugify      = require 'slugify'
md           = require 'marked'

module.exports =
	output: 'public/es'
	ignores: ['start_app.js','readme.md', '**/layout.*', '**/_*', '.gitignore', 'ship.*conf','**/public/**','**/img/resized/*','**/img/stack/*']
	env: 'es'
	locals:
		env: 'es'
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
						'locale':'es'

					}
				HomeProducts:
					id: 'homePageProducts'
					filters:{
						'locale':'es'
					}
				About:
					id: 'aboutUsPage'
					filters:{
						'locale':'es'
					}
				Support:
					id: 'supportPage'
					filters:{
						'locale':'es'
					}
				Updates:
					id: 'blogPost'
					filters:{
						'locale':'es'
						'order': '-fields.date'
					}
					path: (e) -> "blog/#{slugify(e.url)}"
					template: 'views/partials/_update.jade'
				ProductUpdates:
					id: 'updates'
					filters:{
						'locale':'es'
						'order': '-fields.date'
					}
					path: (e) -> "updates/#{slugify(e.url)}"
					template: 'views/partials/_update.jade'
				InspirationUpdates:
					id: 'inspirationPost'
					filters:{
						'locale':'es'
						'order': '-fields.date'
					}
					path: (e) -> "inspiration/#{slugify(e.url)}"
					template: 'views/partials/_update.jade'
				Navigation:
					id: 'navigation'
					filters:{
						'locale':'es'
					}
				Footer:
					id: 'footer'
					filters:{
						'locale':'es'
					}
				Social:
					id: 'social'
					filters:{
						'locale':'es'
					}
				Contact:
					id: 'contactPage'
					filters:{
						'locale':'es'
					}
				UpdatesPage:
					id: 'updatesPage'
					filters:{
						'locale':'es'
					}
				InspirationPage:
					id: 'inspirationPage'
					filters:{
						'locale':'es'
					}

				TOTM:
					id: 'tipOfTheMonthPost'
					filters:{
						'locale':'es'
						'order': '-fields.date'
					}
					template: 'views/partials/_TOTM.jade'
				TOU:
					id: 'termsOfUse'
					filters:{
						'locale':'es'
					}
				Privacy:
					id: 'privacyPolicy'
					filters:{
						'locale':'es'
					}
				BlogCategories:
					id: 'blogCategory'
					filters:{
						'locale':'es'
						'order': 'fields.title'
					}
				Jobs:
					id:'jobListing'
					filters:{
						'order':'-fields.date'
						'locale':'es'
					}
					template: 'views/partials/_job.jade'
				JobCategories:
					id:'jobCategory'
					filters:{
						'order':'fields.category'
						'locale':'es'
					}
				JobLocations:
					id:'jobLocation'
					filters:{
						'order':'fields.location'
						'locale':'es'
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
