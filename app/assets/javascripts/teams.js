# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$("#users a.add_fields").
  data("association-insertion-position", 'before').
  data("association-insertion-node", 'this');

$('#users').bind('insertion-callback',
     function() {
         $(".teams-user-fields a.add_fields").
             data("association-insertion-position", 'before').
             data("association-insertion-node", 'this');
         $('.teams-user-fields').bind('insertion-callback',
              function() {
                $(this).children("#user_from_list").remove();
                $(this).children("a.add_fields").hide();
              });
     });