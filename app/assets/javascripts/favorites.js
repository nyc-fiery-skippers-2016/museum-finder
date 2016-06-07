$(document).ready(function() {
  $('.filled-star').on('submit', function(e) {
    e.preventDefault();
    $.ajax({
    	method: "DELETE",
    	url: "/unfavorite_museum",
    	data: $(e.target).serialize() 
    }).done(function(response) {
    	debugger;
    	// $('.filled-star').remove();
    	// parent.append($(".unfilled-star"))
    }).fail(function(response){
    	console.log("FAIL: " + response)
    });
 });

  $('.unfilled-star').on('submit', function(e) {
    e.preventDefault();
    // debugger;
    $(e.target).addClass("clicked")
    $target = (e.target)
    $.ajax({
    	method: "post",
    	url: "/favorite_museum",
    	data: $($target).serialize()
    }).done(function(response) {
    	$('.clicked').parent().append(response);
    	$('.clicked').remove();
    	// parent.append($(".filled-star"))
    });
 });
});
 