// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require material.min
//= require bootstrap-sprockets
//= require moment.min
//= require rails-ujs
//= require turbolinks
//= require_tree .
$(document).on('turbolinks:load', function() {
  demo.checkFullPageBackgroundImage();

  setTimeout(function() {
      // after 1000 ms we add the class animated to the login/register card
      $('.card').removeClass('card-hidden');
  }, 700)
});

function showNotification(from, align, message){

    $.notify({
        icon: "add_alert",
        message: message

    },{
        type: 'success',
        timer: 2000,
        placement: {
            from: from,
            align: align
        }
    });
}

