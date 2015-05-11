App.Collections.Businesses = Backbone.Collection.extend({

	model: App.Models.Business,

	// url: 'businesses/search',

	searchYelp: function(term) {
		return 'businesses/search?term=' + encodeURI(term);	
	},

	search: function(term) {
		$.getJSON(this.searchYelp(term))
		 .done(this.reset.bind(this));
	},

	searchSoda: function(borough) {
		return 'markets/search?term=' + encodeURI(borough);	
	},

	searchBorough: function(borough) {
		console.log('YOU GOT HURRRRRRRR!')
		$.getJSON(this.searchSoda(borough))
		 .done(this.reset.bind(this));
	}

});