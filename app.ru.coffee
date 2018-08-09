axis         = require 'axis'
rupture      = require 'rupture'
autoprefixer = require 'autoprefixer-stylus'
js_pipeline  = require 'js-pipeline'
css_pipeline = require 'css-pipeline'
contentful   = require 'roots-contentful'
slugify      = require 'slugify'
md           = require 'marked'

module.exports =
	output: 'public/ru'
	ignores: ['start.js','readme.md', '**/layout.*', '**/_*', '.gitignore', 'ship.*conf','**/public/**','**/img/resized/*','**/img/stack/*','*.coffee', '**/contentful-export/**']
	env: 'ru'
	locals:
		env: 'ru'
		md:require 'marked'
	extensions: [
		js_pipeline(files: ['assets/**/*.js','assets/js/*.coffee']),
		css_pipeline(files: ['assets/**/*.css','assets/css/*.styl'])

		contentful
			#access_token: 'f34cc60b7d98d36e0c5483b32cd4538fe787cc5b758ce0e8e202ce7026ae4d69' #DRAFT TOKEN
			#preview: true
			access_token: '73bcd210fd4dd20baef3fb8293fba85fc18f91e563f06c146991414739107f9e'
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
						'locale':'ru'

					}
				HomeProducts:
					id: 'homePageProducts'
					filters:{
						'locale':'ru'
					}
				About:
					id: 'aboutUsPage'
					filters:{
						'locale':'ru'
					}
				Training:
					id: 'trainingPage'
					filters:{
						'locale':'ru'
					}
				Support:
					id: 'supportPage'
					filters:{
						'locale':'ru'
					}
				Articles:
					id: 'blogPost'
					filters:{
						'locale':'ru'
						'order': '-fields.date'
					}
					path: (e) -> "articles/#{slugify(e.url)}"
					template: 'views/partials/_update.jade'
				Updates:
					id: 'updatePost'
					filters:{
						'locale':'ru'
						'order': '-fields.date'
					}
					path: (e) -> "updates/#{slugify(e.url)}"
					template: 'views/partials/_update.jade'
				ProductUpdates:
					id: 'updates'
					filters:{
						'locale':'ru'
						'order': '-fields.date'
					}
					path: (e) -> "updates/#{slugify(e.url)}"
					template: 'views/partials/_update.jade'
				InspirationUpdates:
					id: 'inspirationPost'
					filters:{
						'locale':'ru'
						'order': '-fields.date'
					}
					path: (e) -> "inspiration/#{slugify(e.url)}"
					template: 'views/partials/_update.jade'
				Navigation:
					id: 'navigation'
					filters:{
						'locale':'ru'
					}
				Footer:
					id: 'footer'
					filters:{
						'locale':'ru'
					}
				Social:
					id: 'social'
					filters:{
						'locale':'ru'
					}
				Contact:
					id: 'contactPage'
					filters:{
						'locale':'ru'
					}
				UpdatesPage:
					id: 'updatesPage'
					filters:{
						'locale':'ru'
					}
				InspirationPage:
					id: 'inspirationPage'
					filters:{
						'locale':'ru'
					}

				TOTM:
					id: 'tipOfTheMonthPost'
					filters:{
						'locale':'ru'
						'order': '-fields.date'
					}
					template: 'views/partials/_TOTM.jade'
				TOU:
					id: 'termsOfUse'
					filters:{
						'locale':'ru'
					}
				Privacy:
					id: 'privacyPolicy'
					filters:{
						'locale':'ru'
					}
				BlogCategories:
					id: 'blogCategory'
					filters:{
						'locale':'ru'
						'order': 'fields.title'
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
