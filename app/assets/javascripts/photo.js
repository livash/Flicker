Flickr.Photo = {
	listenForDescriptionEvents: function () {
		$('.photo-description').on('click', '.meta-description',function(event) {
			var photoID = $(event.target).attr('data-id').split('-')[1];
			
			//ask db for a description
			$.ajax({
				url: '/photos/' + photoID + ".json",
				type: 'get',
				success: function(resp) {
					var formFn = _.template(Flickr.Templates.photoDescriptionForm);
					var form = formFn({ photo: resp });
					$('.meta-description').addClass('hidden');
					$('.photo-description').append(form);
					
					$('#photo-description-form-id').on('submit', function(event) {
						event.preventDefault();
						console.log("save button was pressed.....");
						var form = $(this).serializeJSON();
						console.log(event.target);
						var photoID = $(event.target).attr("data-id").split("-")[1];
						$.ajax({
							url: "/photos/" + photoID + ".json",
							type: "put",
							data: form,
							success: function(resp) {
								console.log(resp);
								var photoDescrFn = _.template(Flickr.Templates.photoDescription);
								console.log("function made...");
								console.log(photoDescrFn);
								var photoDescr = photoDescrFn({ photo: resp });
								console.log(photoDescr);
								$('.photo-description').html('');
								$('.photo-description').append(photoDescr);
							}
						});
					});
					
					$('#photo-description-form-id').on('click', 'button#photo-descr', function(event) {
						event.preventDefault();
						$('.meta-description').toggleClass('hidden');
						$('#photo-description-form-id').remove();
					});
					
				}
			});
		});
	},
	
	listenForDeletePhoto: function() {
		$(".button_to").submit(function(event){
			event.preventDefault();
			var photoDiv = $($(this).parent()).parent();
			var photoID = $(photoDiv).attr('data-id').split('-')[1];
			$.ajax({
				url: "/photos/" + photoID + ".json",
				type: "delete",
				success: function(resp) {
					$(photoDiv).addClass('animated flipOutY');
					var deleteIt = function() {
						$(photoDiv).remove();
					}
					setTimeout(deleteIt, 1100);
				} 	
			});
		});
	},
}