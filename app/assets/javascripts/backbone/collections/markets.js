App.Collections.Markets = Backbone.Collection.extend({

	model: App.Models.Market,

	searchSoda: function(borough) {
		return 'markets/search?term=' + encodeURI(borough);
	},

	searchBorough: function(borough) {
		console.log('YOU GOT HURRRRRRRR!')
		$.getJSON(this.searchSoda(borough))
		 .done(this.reset.bind(this));
	}

});