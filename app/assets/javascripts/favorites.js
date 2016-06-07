$(document).ready(function() {
  $('.favorite').on('submit', ".filled-star", function(e) {
    e.preventDefault();
    $(e.target).addClass("clicked");
    $.ajax({
    	method: "delete",
    	url: "/unfavorite_museum",
    	data: $(e.target).serialize() 
    }).done(function(response) {
       	$('.clicked').parent().append(response);
       	$('.clicked').remove();

    });
 });


  $('.favorite').on('submit', ".unfilled-star", function(e) {
    e.preventDefault();
    $(e.target).addClass("clicked");
    $(e.target).addClass("filled-star");
    $target = (e.target)
    $.ajax({
    	method: "post",
    	url: "/favorite_museum",
    	data: $($target).serialize()
    }).done(function(response) {
    	$('.clicked').parent().append(response);
    	$('.clicked').remove();
   });
 });
});
 