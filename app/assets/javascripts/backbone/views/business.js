App.Views.Business = Backbone.View.extend({

	initialize: function() {
		this.businessTemplate = HandlebarsTemplates['business'];
		this.render();
	},

	render: function() {
		this.$el.html(this.businessTemplate(this.model.toJSON()));
	}

});