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
				success: function() {
					var tagTitle = $("#tag_title").val();
					//clear text field
					console.log("success////////");
					$("#tag_title").val("");
					//put result into a div
					var content = $('<div></div>').addClass("single-tag");
					content.html(tagTitle);
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
			console.log("All your tags");
			$.ajax({
				url: "/tags",
				type: "get",
				success: function(resp) {
					//Flickr.Store.tags = resp;
					console.log(resp);
					var $content = $("<div>");
					$(resp).each(function(idx, tag){
						console.log(tag);
						var $span = $("<span>").html(tag.title + " ");
						$content.append($span);
					});
					$(".show-all-tags").append($content);
				}
			});
		});
	}
}

