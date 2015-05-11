App.Views.Business = Backbone.View.extend({

	initialize: function() {
		this.template = HandlebarsTemplates['business'];
		// this.template = HandlebarsTemplates['market'];
		this.render();
	},

	render: function() {
		this.$el.html(this.template(this.model.toJSON()));
	}

});