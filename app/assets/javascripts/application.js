// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require js/agency
//= require js/jquery.easing
//= require js/classie
//= require js/bootstrap.min
//= require js/jqBootstrapValidation
//= require js/cbpAnimatedHeader
//= require turbolinks
//= require_tree .

// -------------------flash messages timeouts timmer --------------------------\\\\
$(document).ready(function() {
var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
$(function() {
  var flashCallback;
  flashCallback = function() {
    return $(".alert").fadeOut();
  };
  $(".alert").bind('click', __bind(function(ev) {
    return $(".alert").fadeOut();
  }, this));
  return setTimeout(flashCallback, 5000);
  });
});