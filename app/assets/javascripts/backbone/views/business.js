App.Views.Businesses = Backbone.View.extend({

	initialize: function() {
		this.template = HandlebarsTempates['business'];
		this.render();
	},
	render: function() {
		this.$el.html(this.template(this.model.toJSON()));
	}

});