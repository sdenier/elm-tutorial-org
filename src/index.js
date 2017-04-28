'use strict';

require('ace-css/css/ace.css');
require('font-awesome/css/font-awesome.css');

// On importe index.html pour qu'il soit intégré au *dist*
require('./index.html');

var Elm = require('./Main.elm');
var mountNode = document.getElementById('main');

var app = Elm.Main.embed(mountNode);
