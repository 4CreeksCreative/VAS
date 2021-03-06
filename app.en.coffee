axis         = require 'axis'
rupture      = require 'rupture'
autoprefixer = require 'autoprefixer-stylus'
js_pipeline  = require 'js-pipeline'
css_pipeline = require 'css-pipeline'
contentful   = require 'roots-contentful'
slugify      = require 'slugify'
md           = require 'marked'


module.exports =
	output: 'public'
	env: 'en'
	locals:
		env: 'en'
		md:require 'marked'
	ignores: ['start.js','readme.md', '**/layout.*', '**/_*', '.gitignore', 'ship.*conf','**/public/**','**/img/resized/*','**/img/stack/*','*.coffee', '**/contentful-export/**']

	extensions: [
		js_pipeline(files: ['assets/**/*.js','assets/js/*.coffee']),
		css_pipeline(files: ['assets/**/*.css','assets/css/*.styl'])

		contentful
			#access_token: 'f34cc60b7d98d36e0c5483b32cd4538fe787cc5b758ce0e8e202ce7026ae4d69' #DRAFT TOKEN
			#preview: true
			access_token: '73bcd210fd4dd20baef3fb8293fba85fc18f91e563f06c146991414739107f9e'
			space_id: 'c7vdx45k3txt'
			
			content_types:
				##Variable_name:
					##id: 'ID' ##FIND THIS ON CONTENTFUL
					##template: 'views/partial/_cf_post.jade' ##render out content based on this template
					##filters: { 'fields.environment[in]': ['staging', 'production'] } ##filter for language, etc
					##path: (e) -> "blogging/#{e.category}/#{slugify(e.title)}" ##custom path
					##write: 'data.json' ##write a JSON file with the data
				Home:
					id: 'homePage'
					filters:{
						'locale':'en-US'
					}
				HomeProducts:
					id: 'homePageProducts'
					filters:{
						'locale':'en-US'
					}
				About:
					id: 'aboutUsPage'
					filters:{
						'locale':'en-US'
					}
				Training:
					id: 'trainingPage'
					filters:{
						'locale':'en-US'
					}
				Support:
					id: 'supportPage'
					filters:{
						'locale':'en-US'
					}
				Articles:
					id: 'blogPost'
					filters:{
						'locale':'en-US'
						'order': '-fields.date'
					}
					path: (e) -> "articles/#{slugify(e.url)}"
					template: 'views/partials/_update.jade'
				Updates:
					id: 'updatePost'
					filters:{
						'locale':'en-US'
						'order': '-fields.date'
					}
					path: (e) -> "updates/#{slugify(e.url)}"
					template: 'views/partials/_update.jade'
				ProductUpdates:
					id: 'updates'
					filters:{
						'locale':'en-US'
						'order': '-fields.date'

					}
					path: (e) -> "updates/#{slugify(e.url)}"
					template: 'views/partials/_update.jade'
				InspirationUpdates:
					id: 'inspirationPost'
					filters:{
						'locale':'en-US'
						'order': '-fields.date'
					}
					path: (e) -> "inspiration/#{slugify(e.url)}"
					template: 'views/partials/_update.jade'
				Navigation:
					id: 'navigation'
					filters:{
						'locale':'en-US'
					}
				Footer:
					id: 'footer'
					filters:{
						'locale':'en-US'
					}
				Social:
					id: 'social'
					filters:{
						'locale':'en-US'
					}
				Contact:
					id: 'contactPage'
					filters:{
						'locale':'en-US'
					}
				UpdatesPage:
					id: 'updatesPage'
					filters:{
						'locale':'en-US'
					}
				InspirationPage:
					id: 'inspirationPage'
					filters:{
						'locale':'en-US'
					}

				TOTM:
					id: 'tipOfTheMonthPost'
					filters:{
						'locale':'en-US'
						'order': '-fields.date'
					}
					template: 'views/partials/_TOTM.jade'
				TOU:
					id: 'termsOfUse'
					filters:{
						'locale':'en-US'
					}
				Privacy:
					id: 'privacyPolicy'
					filters:{
						'locale':'en-US'
					}
				BlogCategories:
					id: 'blogCategory'
					filters:{
						'locale':'en-US'
						'order': 'fields.title'
					}
				Jobs:
					id:'jobListing'
					filters:{
						'order':'-fields.date'
						'locale':'en-US'
					}
					template: 'views/partials/_job.jade'
					path: (e) -> "jobs/#{slugify(e.title)}"
				JobCategories:
					id:'jobCategory'
					filters:{
						'order':'fields.category'
						'locale':'en-US'
					}
				JobLocations:
					id:'jobLocation'
					filters:{
						'order':'fields.location'
						'locale':'en-US'
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
