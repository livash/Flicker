Flickr.Views.AlbumForm = Backbone.View.extend({

	events: {
		'click input[type="submit"]' :'submit'
	},

	template: JST['albums/album_form'],

	render: function() {
		var that = this;
		var renderedContent = this.template({
			album: this.model
		});

		this.$el.html(renderedContent);

		return this;
	},
	submit: function(event) {
		event.preventDefault();
		var that = this;
		var attrs = $(event.target.form).serializeJSON();
		console.log(attrs);
		this.model = new Flickr.Models.Album(attrs);
		this.model.save();
		console.log(this.model);
	}

});