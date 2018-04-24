var coffee = require('coffee-script/register');
var Roots = require('roots');
var vasEnglish = new Roots(__dirname, { env: 'en' })
var vasSpanish = new Roots(__dirname, { env: 'es' })
var vasGerman = new Roots(__dirname, { env: 'de' })
var vasRussian = new Roots(__dirname, { env: 'ru' })
vasSpanish.compile()
vasGerman.compile()
vasEnglish.compile()
vasRussian.compile()
