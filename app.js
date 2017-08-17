var Roots = require('roots');
var project = new Roots('/path/to/project');

project
  .on('error') // compile error
  .on('done'); // compile is finished

project.compile();