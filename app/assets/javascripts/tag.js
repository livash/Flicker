//some comment

Flickr.Tag = {	
	listenForSearchEvents: function(){
		//jQueryUI autocomplete
		$("#search-tags").click(function(){
			var temp = $( "#search-tags" ).autocomplete({
				source: window._tags
			});
			// //When jQueryUI Autocomplete is engaged, add Bootstrap class "dropdown-menu"
		// 	$( "#search-tags" ).bind( "autocompleteopen", function(event, ui) {   
		// 		$(this).find('ul.ui-menu').addClass("dropdown-menue");
		// 	});
		// });
	},
	listenForTagEvents: function() {
		Flickr.Tag.addTag();
		Flickr.Tag.showAllTags();
		Flickr.Tag.removeTag();
	},	
	addTag: function(params){
		$("#tag-form-id").submit(function(event) {
			event.preventDefault();
			var form = $(this).serializeJSON();
			$.ajax({
				url: "/tags",
				type: "post",
				data: form,
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
	test: function () {},
	
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

