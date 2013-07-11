Flickr.Album = {
	deleteAlbum: function() {
		$('.delete-album').on('click', function(event) {
			event.preventDefault();
			var albumID = $(this).attr('data-id').split('-')[1];
			console.log(albumID);
			$.ajax({
				url: "/albums/" + albumID + ".json",
				type: "delete",
				success: function() {
					var divToRemove = $(".album-tile[data-id='album-" + albumID + "']").addClass('animated flipOutY');				
					var deleteIt = function() {
						$(divToRemove).remove();
					}
					setTimeout(deleteIt, 1100);
				}
			})
		});
	},
	
	addPhotosToAlbum: function() {
		var draggedDiv = $(".photostream-form .photo-thumbnail").draggable();
		$(draggedDiv).draggable( "option", {
			opacity: 0.35,
			revert: true
			
		});
		
		var dropDiv = $(".album-photos").droppable({
			accept: ".photo-thumbnail",
			drop: function(ev, ui) {
				//move into the album-photos div
				$(ui.draggable).detach().css({top: 0,left: 0}).appendTo(this);
				//add the photo to the album
				console.log(ui);
				var id = $(ui.draggable).attr('id').split("_")[2];
				console.log(id);
				$.ajax({
					type: "put",
					url: "<%= album_url(@album) %>",
					data: {photo_id: parseInt(id)},
					success: function(res) {
						//console.log(res);
					}
				});
			}
		});
	}
};