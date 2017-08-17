var coffee = require('coffee-script/register');
var Roots = require('roots');
var vasEnglish = new Roots(__dirname, { env: 'en' })
var vasSpanish = new Roots(__dirname, { env: 'es' })
var vasGerman = new Roots(__dirname, { env: 'de' })

vasSpanish.compile().then(vasGerman.compile().then(vasEnglish.compile()))

