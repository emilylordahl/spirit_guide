App.Views.Markets = Backbone.View.extend({

	el: '#market-container',

	className: 'market',
	tagName: 'div',
	
	initialize: function() {
		this.listenTo(this.collection, 'reset', this.renderAll);
		this.listenTo(this.collection, 'add', this.render);
	},

	renderAll: function() {
		this.$('#circle-container').empty();
		this.collection.each(this.render, this);
	},

	render: function(market) {
		this.$('#market-results').append(new App.Views.Market({ model: market }).$el);
	},

	events: {
		'click .farmersmarket': 'getBorough'	
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