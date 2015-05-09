App.Views.Businesses = Backbone.View.extend({

	el: '#circle-container',

	initialize: function() {
		this.listenTo(this.collection, 'reset', this.renderAll);
		this.listenTo(this.collection, 'add', this.render);
	},

	renderAll: function() {

	},

	render: function() {

	},

	events: {
		'click .circles': 'getSearchTerm'
	},

	getSearchTerm: function(event) {
		console.log('You clicked what you want to search for...');
		var clicked = $(event.currentTarget);
		var query = clicked.attr('data-value');
		console.log(query)
		// this.collection.fetch({
		// 	data: {
		// 		query: query
		// 	},
		// 	reset: true
		// });		
	}
});