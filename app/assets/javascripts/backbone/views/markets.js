App.Views.Markets = Backbone.View.extend({

	el: '#market-container',

	className: 'market',

	tagName: 'div',

	initialize: function() {
		this.listenTo(this.collection, 'reset', this.renderAll);
		this.listenTo(this.collection, 'add', this.render);
	},

	renderAll: function() {
		$('#market-results').empty();
		$('#search-results').empty();
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
		var borough = $('.search-input').val();
		if (borough === '') {
			alert('Please search by boroughs in New York!');
		} else {
			$('.farmersmarket').toggleClass('clicked', true)
			                   .parent().siblings().removeClass('clicked');
			this.collection.searchBorough(borough);
			$('.search-input').val('');
		}
	}

});
