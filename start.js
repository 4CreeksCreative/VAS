var coffee = require('coffee-script/register');
var Roots = require('roots');
var vasEnglish = new Roots(__dirname, { env: 'en' })
var vasSpanish = new Roots(__dirname, { env: 'es' })
var vasGerman = new Roots(__dirname, { env: 'de' })
var vasRussian = new Roots(__dirname, { env: 'ru' })

vasSpanish.on('error',console.error)
vasEnglish.on('error',console.error)
vasGerman.on('error',console.error)
vasRussian.on('error',console.error)

vasSpanish.compile().then(vasGerman.compile().then(vasEnglish.compile().then(vasRussian.compile())))
