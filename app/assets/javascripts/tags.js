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
		
	}
}

