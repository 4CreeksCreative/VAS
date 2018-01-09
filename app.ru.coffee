axis         = require 'axis'
rupture      = require 'rupture'
autoprefixer = require 'autoprefixer-stylus'
js_pipeline  = require 'js-pipeline'
css_pipeline = require 'css-pipeline'
contentful   = require 'roots-contentful'
slugify      = require 'slugify'

module.exports =
	output: 'public/ru'
	ignores: ['start_app.js','readme.md', '**/layout.*', '**/_*', '.gitignore', 'ship.*conf','**/public/**','**/img/resized/*','**/img/stack/*']
	env: 'ru'
	locals:
		env: 'ru'
	extensions: [
		js_pipeline(files: ['assets/**/*.js','assets/js/*.coffee']),
		css_pipeline(files: ['assets/**/*.css','assets/css/*.styl'])

		contentful
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
				Support:
					id: 'supportPage'
					filters:{
						'locale':'ru'
					}
				Updates:
					id: 'blogPost'
					filters:{
						'locale':'ru'
						'order': '-fields.date'
					}
					path: (e) -> "blog/#{slugify(e.url)}"
					template: 'views/partials/_update.jade'
				ProductUpdates:
					id: 'updates'
					filters:{
						'locale':'ru'
						'order': '-sys.createdAt'
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