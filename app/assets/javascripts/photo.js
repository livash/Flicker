Flickr.Photo = {
	listenForDescriptionEvents: function () {
		$('.photo-description').on('click', function(event) {
			var photoID = $(event.target).attr('data-id').split('-')[1];
			console.log(photoID);
			//ask db for a description
			$.ajax({
				url: '/photos/' + photoID + ".json",
				type: 'get',
				success: function(resp) {
					var formFn = _.template(Flickr.Templates.photoDescriptionForm);
					var form = formFn({ photo: resp })
					console.log(resp.description);
				}
			});
		});
	},
}