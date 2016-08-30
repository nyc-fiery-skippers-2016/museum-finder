// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
  $(".category").hide();
  $("#art-category").show();
  $("#all-price").show();
  $(".padded-nav").on("click", "a", function(e) {
    e.preventDefault();
    var tab = $(this).attr("id");

    $(this).parent().parent().children().removeClass("active");
    $(this).parent().addClass("active");

    $(".category").hide();
    $("#" + tab + "-category").show();
  })

  $(".nav-pills").on("click", "a", function(e) {
    e.preventDefault();
    var pill = $(this).attr("id")

    $(this).parent().parent().children().removeClass("active");
    $(this).parent().addClass("active");
    $(".category").hide();
    $("#" + pill + "-price").show();
  })

  });
