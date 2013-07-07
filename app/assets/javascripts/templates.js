Flickr.Templates = {
	singlePhotoTag: [
		"<div class='single-tag' data-id='<%= taggingID %>'>",
		"<%= tagTitle %> " +
		"<a href='#' class='remove-tag'>x</a>",
		"</div>"
	].join("\n"),
	
	showAllTags: [
		"<div>",
		"<% $(tags).each(function(idx, tag) {%>",
		"<span><%= tag.title %>, </span>",
		"<% }); %>",
		"</div>"
	].join("\n"),
	
	singlePhotoComment: [
		"<div class='single-comment' data-id='comment-<%= comment.id %>'> ",
		"<%= comment.body %> ",
		"</div>"
	].join("\n"),
};

