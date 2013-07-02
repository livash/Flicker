window.Flickr = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
	Store: {},
  initialize: function() {
		Flickr.Store.photos = new Flickr.Collections.Photos();
		Flickr.Store.photos.fetch({
			success: function(resp){
				console.log("received files....");
			}
		});
		Backbone.history.start();
  }
};


