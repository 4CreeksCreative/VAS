axis         = require 'axis'
rupture      = require 'rupture'
autoprefixer = require 'autoprefixer-stylus'
js_pipeline  = require 'js-pipeline'
css_pipeline = require 'css-pipeline'
contentful   = require 'roots-contentful'

module.exports =
	output: 'public'
	ignores: ['start_app.js','readme.md', '**/layout.*', '**/_*', '.gitignore', 'ship.*conf','**/public/**','**/img/resized/*','**/img/stack/*','*.coffee']

	extensions: [
		js_pipeline(files: ['assets/**/*.js','assets/js/*.coffee']),
		css_pipeline(files: ['assets/**/*.css','assets/css/*.styl'])

		contentful
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
				Updates:
					id: 'updates'
					filters:{
						'locale':'en-US'
						'order': '-sys.createdAt'
					}
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
				ProductPost:
					id: 'productBlogPost'
					filters:{
						'locale':'en-US'
						'order': '-sys.createdAt'
					}
					template: 'views/partials/_product.jade'
				EventPost:
					id: 'eventBlogPost'
					filters:{
						'locale':'en-US'
						'order': '-sys.createdAt'
					}
					template: 'views/partials/_event.jade'
				
		
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
