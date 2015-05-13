App.Views.Business = Backbone.View.extend({

	initialize: function() {
		this.businessTemplate = HandlebarsTemplates['business'];
		this.render();
	},

	events: {
		'click #save-business': 'saveBusiness'
	},

	render: function() {
		this.$el.html(this.businessTemplate(this.model.toJSON()));
	},

	saveBusiness: function() {
		this.model.save();
	}

});