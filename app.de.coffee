axis         = require 'axis'
rupture      = require 'rupture'
autoprefixer = require 'autoprefixer-stylus'
js_pipeline  = require 'js-pipeline'
css_pipeline = require 'css-pipeline'
contentful   = require 'roots-contentful'

module.exports =
  output: '/public/de'
  ignores: ['readme.md', '**/layout.*', '**/_*', '.gitignore', 'ship.*conf','**/public/**','**/img/resized/*','**/img/stack/*']

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
          ##template: 'views/partial/_cf_post.jade'

  ]

  stylus:
    use: [axis(), rupture(), autoprefixer()]
  jade:
    pretty: true

  server:
    clean_urls:true
