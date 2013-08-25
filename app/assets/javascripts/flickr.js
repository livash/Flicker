window.Flickr = {
	Album: {},
	Gallery: {},
	Photo: {},
	Tag: {},
	Templates: {},
	Store: {},
};
$(document).ready(function(){
	Flickr.Album.addPhotosToAlbum();
	Flickr.Album.deleteAlbum();
	Flickr.Tag.listenForTagEvents();
	Flickr.Tag.listenForSearchEvents();
	Flickr.Comment.listenForCommentEvents();
	Flickr.Photo.listenForDescriptionEvents();
	Flickr.Photo.listenForDeletePhoto();
	Flickr.Gallery.listenForGallerySubmit();
});


//older code for using Backbone in this project
// window.Flickr = {
//   Models: {},
//   Collections: {},
//   Views: {},
//   Routers: {},
// 	Store: {},
//   initialize: function() {
// 		Flickr.Store.photos = new Flickr.Collections.Photos();
// 		Flickr.Store.photos.fetch({
// 			success: function(resp){
// 				console.log("received files....");
// 				$rootElOne = $('.footer');
// 				$rootElTwo = $('.side-bar');
// 				var router = new Flickr.Routers.Photos($rootElOne, $rootElTwo, Flickr.Store.photos);
// 				Backbone.history.start();
// 			}
// 		});
// 
// 		//var newAlbumFormView =
// 
//   }
// };


