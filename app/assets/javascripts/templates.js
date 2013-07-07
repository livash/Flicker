Flickr.Templates = {
	photoDescriptionForm: [
	'<form id="phtoto-description-form-id">',
	'<input type="hidden"', 
	'name="authenticity_token" ',
	'value="<%= window._token %>">',
	'<input type="hidden" name="comment[photo_id]" value="<%= photo.id %>">',
	'<textarea ',
	'name="photo[description]" ',
	'id="photo_description">',
	'<%= photo.description %>',
	'</textarea><br>',
	'<input type="submit" value="SAVE">',
	'<button id="photo-descr">CANCEL</button>',
	'</form>'
	].join("\n"),
	
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
		'<div class="comment-options">',
		'<a href="#" class="remove-comment">Delete</a>',
		'<a href="#" class="edit-comment">Edit</a>',
		'</div>',
		"</div>"
	].join("\n"),
	
	editCommentForm: [
	'<form id="edit-comment-form-id">',
	'<input type="hidden"', 
	'name="authenticity_token" ',
	'value="<%= window._token %>">',
	'<input type="hidden" name="comment[photo_id]" value="29">',
	'<input type="hidden" name="comment[author_id]" value="1">',
	'<textarea ',
	'name="comment[body]" ',
	'id="comment_body" ',
	'style="color:#BDBDBD><%= commentBody %>',
	'</textarea><br>',
	'<input type="submit" value="SAVE">',
	'</form>'
	].join("\n")
};

