// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

$(document).ready(function(){
  $(function() {
    $( "#profile-tabs" ).tabs().css({
       'min-height': '200px',
       'overflow': 'auto'
    });
  });
  $(".filter-students").click(function(){
    $(".primary-content").fadeOut(500, function(){
      $("#home-buttons").hide();
      $("#profiles").show();
      $(this).fadeIn(500);
    });
  });
  $(".filter-none").click(function(){
    $(".primary-content, #profiles").fadeOut(500, function(){
      $("#profiles").hide();
      $("#home-buttons").show();
      $(".primary-content, #home-buttons").fadeIn(500);
    });
  });

});
