var App = {
	Models: {},
	Collections: {},
	Views: {},
	Routers: {}
};

$(function() {
	var businessCollection = new App.Collections.Businesses;
	var businessesView = new App.Views.Businesses({ collection: businessCollection });
	var marketCollection = new App.Collections.Markets;
	var marketsView = new App.Views.Markets({ collection: marketCollection });
});
