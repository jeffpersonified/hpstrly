// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .

// hide fading text for mobile devices
$(document).ready(function() {
  var switched = false;
  var hideText = function() {
    if (($(window).width() < 960) && !switched ){
      switched = true;
      $(".fadingText").toggle('showOrHide');
      $("#index_header").css('text-align','center');
      $("#logo_large").css('float', 'none')
      $("#logo_large").css('margin', '0 auto')
      return true;
    }
    else if (switched && ($(window).width() > 960)) {
      switched = false;
      $(".fadingText").toggle('showOrHide');
      $("#index_header").css('text-align','left');
      $("#logo_large").css('float', 'left')
      $("#logo_large").css('margin', '-25px 12px 0 70px')
    }
  };

  $(window).load(hideText);
  $(window).bind("resize", hideText);
});

// fade url text
$(document).ready(function(){
  function fadeText (){
    $(".fadingText .content:hidden:first").fadeIn(500).delay(2000).fadeOut(500, function() {
      $(this).appendTo($(this).parent());
      fadeText();
    });
  }
  fadeText();
});

// update tables for mobile devices
$(document).ready(function() {
  var switched = false;
  var updateTables = function() {
    if (($(window).width() < 767) && !switched ){
      switched = true;
      $("table.responsive").each(function(i, element) {
        splitTable($(element));
      });
      return true;
    }
    else if (switched && ($(window).width() > 767)) {
      switched = false;
      $("table.responsive").each(function(i, element) {
        unsplitTable($(element));
      });
    }
  };
   
  $(window).load(updateTables);
  $(window).bind("resize", updateTables);
   
  
  function splitTable(original)
  {
    original.wrap("<div class='table-wrapper' />");
    
    var copy = original.clone();
    copy.find("td:not(:first-child), th:not(:first-child)").css("display", "none");
    copy.removeClass("responsive");
    
    original.closest(".table-wrapper").append(copy);
    copy.wrap("<div class='pinned' />");
    original.wrap("<div class='scrollable' />");
  }
  
  function unsplitTable(original) {
    original.closest(".table-wrapper").find(".pinned").remove();
    original.unwrap();
    original.unwrap();
  }
});


