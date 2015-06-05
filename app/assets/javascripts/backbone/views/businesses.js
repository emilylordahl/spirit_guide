App.Views.Businesses = Backbone.View.extend({

	el: '#outer-container',

	className: 'business',

	tagName: 'div',

	initialize: function() {
		this.listenTo(this.collection, 'reset', this.renderAll);
		this.listenTo(this.collection, 'add', this.render);
	},

	renderAll: function() {
		this.$('#market-results').empty();
		this.$('#search-results').empty();
		this.collection.each(this.render, this);
	},

	render: function(business) {
		this.$('#search-results').append(new App.Views.Business({  model: business }).$el);	
	},

	events: {
		'click .yoga, .veg, .juice': 'getSearchTerm',
		'keypress .search-input': 'searchByEnter'
	},

	getSearchTerm: function(event) {
		var clicked = $(event.currentTarget);
		var term = clicked.attr('data-value');
		var borough = $('.search-input').val();
		if (borough === '') {
			alert('Please search by location!');	
		} else {
			clicked.toggleClass('clicked', true)
			       .siblings().removeClass('clicked');
			$('.farmersmarket').removeClass('clicked');       
			this.collection.search(borough, term);
			$('.search-input').val('');		
		}
	},

	searchByEnter: function(e) {
		if (e.which === 13) {
			alert('Please click one of the bussinesses or market to search!');
		}
	}

});