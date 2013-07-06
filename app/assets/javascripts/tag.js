Flickr.Tag ={
	addTag: function(params){
		$("#tag-form-id").submit(function(event) {
			event.preventDefault();
			var $form = $(this).serializeJSON();
			$.ajax({
				url: "/tags",
				type: "post",
				data: $form,
				success: function(resp) {
					var tagTitle = $("#tag_title").val() + " ";
					//clear text field
					$("#tag_title").val("");
					//put result into a div
					var taggingID = "tagging-" + resp.id;
					var contentFn = _.template(Flickr.Templates.singlePhotoTag);
					var newTagDiv = contentFn({
						taggingID: taggingID, 
						tagTitle: tagTitle
					});
					$(".tags-show").append(newTagDiv);
				},
				error: function() {
					//clear text field
					$("#tag_title").val("");
				}
			});
		});	
	},
	showAllTags: function() {
		$("#link-to-all-tags").click(function() {
			$(this).unbind('click');
			$.ajax({
				url: "/tags",
				type: "get",
				success: function(resp) {
					var contentFn = _.template(Flickr.Templates.showAllTags);
					var newDiv = contentFn({ tags: resp });
					$(".show-all-tags").append(newDiv);
				}
			});
		});
	},
	removeTag: function() {
		$(".tags-show").on('click', 'a.remove-tag', function(event){
			event.preventDefault();
			var parentDiv = $(event.target).parent();
			var taggingID = $(parentDiv).attr('data-id').split('-')[1];
			var url = "/taggings/" + taggingID;
			$.ajax({
				url: url,
				type: "delete",
				success: function() {
					$(parentDiv).remove();
				}
			});
			
		});
	}
}

