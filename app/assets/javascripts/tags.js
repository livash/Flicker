Flickr.Tag ={
	addTag: function(params){
		$("#tag-form-id").submit(function(event) {
			event.preventDefault();
			var $form = $(this).serializeJSON();
			console.log($form);
			$.ajax({
				url: "/tags",
				type: "post",
				data: $form,
				success: function(resp) {
					console.log("here....");
					console.log(resp);
					var tagTitle = $("#tag_title").val() + " ";
					//clear text field
					$("#tag_title").val("");
					//put result into a div
					var content = $('<div></div>').addClass("single-tag");
					var taggingID = "tagging-" + resp.id;
					content.attr('data-id', taggingID);
					content.html(tagTitle);
					var link = $("<a>").attr({'href': '#', 'class': 'remove-tag'}).html('x');
					// link.bind("click");
					$(content).append(link);
					$(".tags-show").append(content);
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
					var $content = $("<div>");
					$(resp).each(function(idx, tag){
						var $span = $("<span>").html(tag.title + ", ");
						$content.append($span);
					});
					$(".show-all-tags").append($content);
				}
			});
		});
	},
	removeTag: function() {
		$(".tags-show").on('click', 'a.remove-tag', function(event){
			event.preventDefault();
			var parentDiv = $(event.target).parent();
			var taggingID = $(parentDiv).attr('data-id').split('-')[1];
			console.log(taggingID);
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

