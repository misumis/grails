// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better
// to create separate JavaScript files as needed.
//
//= require jquery-2.2.0.min
//= require bootstrap
//= require_tree .
//= require_self

if (typeof jQuery !== 'undefined') {
    (function($) {
        $(document).ajaxStart(function() {
            $('#spinner').fadeIn();
        }).ajaxStop(function() {
            $('#spinner').fadeOut();
        });
    })(jQuery);
}
$(document).ready(function () {
    $('#editor').trumbowyg({

    });

    $('#title').on('keydown keyup' , function () {
        $('.counter-title').detach();
        var count = $('#title').val().length;
        var counter = "<p class='counter-title'>" + count + " / 50 " + " </p>"
        $(counter).appendTo("#title_field");
        if(count > 50){
            $('.counter-title').css({"color": "red"});
        }
        else{
            $('.counter-title').css({"color": "black"});
        }
    })
    $('#teaser').on('keydown keyup' , function () {
        $('.counter-teaser').detach();
        var count = $('#teaser').val().length;
        var counter = "<p class='counter-teaser'>" + count + " / 180 " + " </p>"
        $(counter).appendTo("#teaser_field");
        if(count > 180){
            $('.counter-teaser').css({"color": "red"});
        }
        else{
            $('.counter-teaser').css({"color": "black"});
        }
    })
})