App.Views.Business = Backbone.View.extend({

	initialize: function() {
		this.businessTemplate = HandlebarsTemplates['business'];
		this.render();
	},

	events: {
		'click #save-business': 'saveBusiness',
		'click .address': 'getLatLong'
	},

	render: function() {
		this.$el.html(this.businessTemplate(this.model.toJSON()));
	},

	saveBusiness: function() {
		this.model.save();
	},

	getLatLong: function() {
		mapModel = this.model.toJSON();
		var newMap = new App.Views.Map({ model: mapModel });
		newMap.show();
	}

});