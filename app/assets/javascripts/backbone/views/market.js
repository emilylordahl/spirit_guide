App.Views.Market = Backbone.View.extend({

	initialize: function() {
		this.marketTemplate = HandlebarsTemplates['market'];
		this.render();
	},

	render: function() {
		this.$el.html(this.marketTemplate(this.model.toJSON()));		
	}

});