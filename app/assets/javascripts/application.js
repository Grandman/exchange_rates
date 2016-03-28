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
//= require bootstrap-sprockets
//= require faye
//= require moment
//= require moment/ru
//= require react
//= require react_ujs
//= require bootstrap-datetimepicker
//= require_tree ./components
//= require_tree .

var faye = new Faye.Client('http://localhost:9292/faye');

$(function () {
    $('input.datetime_picker').datetimepicker({
        format: 'YYYY-MM-DD HH:mm'
    });

    //для того, чтобы время передавалось вместе с таймзоной
    $('form').submit( function(e){
        var date = $('#datetime_virtus_visible').data('DateTimePicker').date();
        $('#datetime_virtus_real').val(date);
        $('#datetime_virtus_visible').attr('name', '');
    });
});