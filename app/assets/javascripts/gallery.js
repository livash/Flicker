Flickr.Gallery = {
	listenForGallerySubmit: function() {
		$("#gallery-form-id").submit(function(event) {
			event.preventDefault();
			console.log('submitting gallery_form');
			var form = $(this).serializeJSON();
			console.log(form);
			$.ajax({
				url: "/galleries/" + form.gallery_id,
				type: "put",
				data: form,
				success: function(resp) {
					var message = $("<div>").html("This photo was added to your gallery.").addClass("success-message");
					$("#gallery-form-id").html("");
					$(".gallery-form").prepend(message);
					console.log('gallery updated.....');
					console.log(message);
				},
				error: function() {
					
				}
			});
		});
	},
};