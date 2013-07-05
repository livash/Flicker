Flickr.Tag ={
	addTag: function(params){
		console.log("It is working .......");
		$.ajax({
			url: "/tags",
			type: "post",
			data: params,
			success: function() {
				
			}
		});
	}
}

