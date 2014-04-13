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
//= require turbolinks
//= require bootstrap
//= require cocoon
//= require_tree .


$("#teams a.add_fields").
  data("association-insertion-position", 'before').
  data("association-insertion-node", 'this');

$('#teams').bind('insertion-callback',
     function() {
         $(".teams-competition-fields a.add_fields").
             data("association-insertion-position", 'before').
             data("association-insertion-node", 'this');
         $('.teams-competition-fields').bind('insertion-callback',
              function() {
                $(this).children("#team_from_list").remove();
                $(this).children("a.add_fields").hide();
              });
     });
     


