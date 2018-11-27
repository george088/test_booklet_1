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
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
function refresh() 
{
  $.ajax({
    url: "sales",
    type: "GET",
    dataType:"json",
    data: {from: $('#date_from').val(), to: $('#date_to').val()},
    cache: false,
    success: function(response){
      console.log(response.goods[0]);

      for(var i = 0; i < response.goods.length; i++) {
        $('#table_title').append('<tr><td>' + response.goods[i][1] + '</td><td>' + response.goods[i][2] + '</td></tr>');
    }

    }
  });
}