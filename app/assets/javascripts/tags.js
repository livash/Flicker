Flickr.Tag ={
	addTag: function(){
		console.log("It is working .......");
		$.ajax({
			url: "/tags",
			type: "post",
			
		});
	}
}

