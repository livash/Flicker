Flickr.Comment = {
	addComment: function() {
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
		$(".comments-show").on('click', 'a.remove-comment', function(event){
			event.preventDefault();
			console.log("Clicked on delete comment");
			var parentDiv = $(event.target).parent();
			var grandParentDiv = $(parentDiv).parent();
			console.log(grandParentDiv);
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
			//$(this).unbind('click');
			event.preventDefault();
			var parentDiv = $(event.target).parent(); //class="comment-options"
			var grandParentDiv = $(parentDiv).parent(); //class="single-comment"
			console.log("grand...............ccccccccccccccccc");
			console.log(grandParentDiv.html());
			var $commentBody = $(grandParentDiv).html().split("<div")[0];
			var $newCommentForm = $("#comment-form-id").html();
			var $authToken = $newCommentForm.split("<input")[1].split('value="')[1].split('"')[0];
 			var $editFormFn = _.template(Flickr.Templates.editCommentForm);
			console.log($editFormFn);
			var $editForm = $editFormFn({ authToken: $authToken, commentBody: $commentBody.trim() });
			var contentBeforeUpdate = $('<div>').html(grandParentDiv.html());
			console.log(contentBeforeUpdate);
			grandParentDiv.html('');
			$(grandParentDiv).append($editForm);
			
			var $commentID = $(grandParentDiv).attr('data-id').split('-')[1];
			//remove comment div
			Flickr.Comment.updateComment($commentID, contentBeforeUpdate);
			
		});
	},
	updateComment: function(commentID, contentBeforeUpdate){
		$('.comments-show').on('click', '#comment-cancel-btn', function() {
			console.log("cancel update");
			$("#edit-comment-form-id").remove();
			$('.comment-show').prepend(contentBeforeUpdate);
		});
		
		$("#edit-comment-form-id").submit(function(event) {
			event.preventDefault();
			console.log("updating via ajax");
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