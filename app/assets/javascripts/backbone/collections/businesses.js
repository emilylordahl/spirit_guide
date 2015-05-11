App.Collections.Businesses = Backbone.Collection.extend({

	model: App.Models.Business,

	searchYelp: function(term) {
		return 'businesses/search?term=' + encodeURI(term);	
	},

	search: function(term) {
		$.getJSON(this.searchYelp(term))
		 .done(this.reset.bind(this));
	}

});