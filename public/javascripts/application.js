// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$.fn.serializeObject = function() {
  var values = {}
  $("form input, form select, form textarea").each( function(){
    values[this.name] = $(this).val();
  });
  
  return values;
}