Flickr.Comment = {
	// printComments: function() {
	// 	console.log("printing existing comments........");
	// 	comments = $("#comments-data").html();
	// }
	
	addComment: function() {
		console.log("int the comment");
		var $commentForm = $("#comment-form-id");
		$("#comment_body").on("click", function(event) {
			//clear text area
			
			$(event.target).html("");			
		});
		
		$("#comment-form-id").submit(function(event) {
			event.preventDefault();
			var $form = $(this).serializeJSON();
			$.ajax({
				url: "/comments",
				type: "post",
				data: $form,
				success: function(resp) {
					console.log("comment submitted .........");
					var contentFn = _.template(Flickr.Templates.singlePhotoComment);
					var newDiv = contentFn({ comment: resp });
					$(".comments-show").prepend(newDiv);
					//clear text area
					$("#comment_body").val("");	
				}
			});
		});
	},
	removeComment: function() {
		
	},
	editComment: function() {
		
	}
}