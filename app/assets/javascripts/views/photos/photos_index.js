Flickr.Views.PhotosIndex = Backbone.View.extend({

  template: JST['photos/index'],

	render: function() {
		var div = $("<div>").css({"width": "100px", "height": "100px", "background": "red", "float": "left"});
		div.html("photo will go here");
		this.$el.append(div);
		var div = $("<div>").css({"width": "100px", "height": "100px", "background": "green", "float": "left"});
		div.html("photo will go here");
		this.$el.append(div);
		return this;
	}

});
