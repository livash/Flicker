Flickr.Comment = {
	listenForCommentEvents: function() {
		Flickr.Comment.addComment();
		Flickr.Comment.removeComment();
		Flickr.Comment.editComment();
	},	
	addComment: function() {
		$("#comment_body").on('keypress', function(event) {
			//clear text area
			$(event.target).html("").css('color', 'black');			
		});
		
		$("#comment-form-id").submit(function(event) {
			event.preventDefault();
			var $form = $(this).serializeJSON();
			$.ajax({
				url: "/comments",
				type: "post",
				data: $form,
				success: function(resp) {
					var contentFn = _.template(Flickr.Templates.singlePhotoComment);
					var newDiv = contentFn({ comment: resp });
					$(".comments-show").prepend(newDiv);
					//clear text area
					$("#comment_body").val("Add a comment").css('color', '#BDBDBD');	
				}
			});
		});
	},
	removeComment: function() {
		$(".comments-show").on('click', 'a.remove-comment', function(event){
			event.preventDefault();
			var parentDiv = $(event.target).parent();
			var grandParentDiv = $(parentDiv).parent();
			var commentID = $(grandParentDiv).attr('data-id').split('-')[1];
			var url = "/comments/" + commentID;
			$.ajax({
				url: url,
				type: "delete",
				success: function() {
					$(grandParentDiv).remove();
				}
			});
			
		});
	},
	editComment: function() {
		$(".comments-show").on('click', 'a.edit-comment', function(event){
			event.preventDefault();
			var parentDiv = $(event.target).parent(); //class="comment-options"
			var grandParentDiv = $(parentDiv).parent(); //class="single-comment"
			var $commentBody = $(grandParentDiv).html().split("<div")[0];
			var $commentID = $(grandParentDiv).attr('data-id').split('-')[1];
			var $newCommentForm = $("#comment-form-id").html();
			var $authToken = $newCommentForm.split("<input")[1].split('value="')[1].split('"')[0];
 			var $editFormFn = _.template(Flickr.Templates.editCommentForm);
			var $editForm = $editFormFn({ authToken: $authToken, commentBody: $commentBody.trim() });
			
			grandParentDiv.html('');
			$(grandParentDiv).append($editForm);
				
			//remove comment div
			Flickr.Comment.updateComment($commentID);
			
		});
	},
	updateComment: function(commentID){
		$("#edit-comment-form-id").submit(function(event) {
			event.preventDefault();
			
			var $form = $(this).serializeJSON();
			$.ajax({
				url: "/comments/" + commentID,
				type: "put",
				data: $form,
				success: function(resp) {
					var contentFn = _.template(Flickr.Templates.singlePhotoComment);
					var newDiv = contentFn({ comment: resp });
					$(".comments-show").prepend(newDiv);
					//clear text area
					$("#edit-comment-form-id").remove();
				}
			});
		});
		
	}
}