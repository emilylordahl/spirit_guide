App.Collections.Businesses = Backbone.Collection.extend({

	model: App.Models.Business,

	searchYelp: function(borough, term) {
		return 'businesses/search?term=' + encodeURI(term) + '&borough=' + encodeURI(borough);
	},

	search: function(borough, term) {
		$.getJSON(this.searchYelp(borough, term))
		 .done(this.reset.bind(this));
	}

});