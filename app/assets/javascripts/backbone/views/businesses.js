App.Views.Businesses = Backbone.View.extend({

	el: '#circle-container',

	initialize: function() {
		this.listenTo(this.collection, 'reset', this.renderAll);
		this.listenTo(this.collection, 'add', this.render);
	},

	renderAll: function() {
		this.$('#circle-container').empty();
		this.collection.each(this.render, this);
	},

	render: function(business) {
		this.$('#search-results').append(new App.Views.Business({  model: business }).$el);	
	},

	events: {
		'click .yoga, .veg, .juice': 'getSearchTerm',
		'click .farmersmarket': 'getBorough'
	},

	getSearchTerm: function(event) {
		var clicked = $(event.currentTarget);
		var term = clicked.attr('data-value');
		clicked.toggleClass('clicked');
		this.collection.search(term);	
	},

	getBorough: function(event) {
		var clicked = $(event.currentTarget);
		var borough = clicked.attr('data-value');
		clicked.toggleClass('clicked');
		console.log(borough);
		this.collection.searchBorough(borough);	
		// var selected = $(event.target.value);
		// var borough = selected.selector;
		// this.collection.searchYelp(borough);
	}

});