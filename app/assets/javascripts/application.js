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
//= #require turbolinks
//= require jquery-1.10.2
//= require select2-full
//= require bootstrap.min
//= require bootstrap-checkbox-radio-switch
//= require chartist.min
//= require bootstrap-notify
//= require light-bootstrap-dashboard
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require dataTables/extras/dataTables.responsive
//= require demo
//= require highcharts
//= require highcharts/highcharts-more
//= require highcharts/modules/exporting
//= require highcharts/modules/no-data-to-display

//= require_tree .


$(document).ready(function(){

    $('.select2').select2({
            placeholder: 'Selecciona...'
        });


});