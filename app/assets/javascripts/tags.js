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
					var tagTitle = $("#tag_title").val();
					//clear text field
					$("#tag_title").val("");
					//put result into a div
					var content = $('<div></div>').addClass("single-tag");
					var tagID = resp.id;
					content.attr('data-id', tagID);
					content.html(tagTitle);
					$(".tags-show").append(content);
				},
				error: function() {
					//clear text field
					$("#tag_title").val("");
				}
			});
		});	
		
		DOMaddTag = function (){
			
		};
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
		$(".remove-tag").click(function(event){
			event.preventDefault();
			console.log($(event.target).parent());
		});
	}
}

