axis         = require 'axis'
rupture      = require 'rupture'
autoprefixer = require 'autoprefixer-stylus'
js_pipeline  = require 'js-pipeline'
css_pipeline = require 'css-pipeline'
contentful   = require 'roots-contentful'

module.exports =
  output: 'public/de'
  ignores: ['start_app.js','readme.md', '**/layout.*', '**/_*', '.gitignore', 'ship.*conf','**/public/**','**/img/resized/*','**/img/stack/*']

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
            'locale':'de'

          }
        HomeProducts:
          id: 'homePageProducts'
          filters:{
            'locale':'de'
          }
        Updates:
          id: 'updates'
          filters:{
            'locale':'de'
          }
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
        ProductPost:
          id: 'productBlogPost'
          filters:{
            'locale':'de'
          }
          template: 'views/partials/_product.jade'
        EventPost:
          id: 'eventBlogPost'
          filters:{
            'locale':'de'
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
