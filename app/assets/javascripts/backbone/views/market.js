App.Views.Market = Backbone.View.extend({

	initialize: function() {
		this.marketTemplate = HandlebarsTemplates['market'];
		this.render();
	},

	events: {
		'click #save-market': 'saveMarket'
	},

	render: function() {
		this.$el.html(this.marketTemplate(this.model.toJSON()));		
	},

	saveMarket: function() {
		this.model.save();
	}

});