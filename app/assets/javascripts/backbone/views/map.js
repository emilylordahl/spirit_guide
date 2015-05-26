App.Views.Map = Backbone.View.extend({

	el: '#google-map',
    
  initialize: function() {
    this.$el.empty();

    var mapOptions = {
      zoom: 15, 
      center: {lat: parseFloat(this.model.latitude), lng: parseFloat(this.model.longitude)},
      mapTypeId: google.maps.MapTypeId.ROADMAP
  	};

    this.map = new google.maps.Map(this.el, mapOptions);
    this.render();

  },

  render: function() {
    var marker = new google.maps.Marker({
      map: this.map,
      position: {lat: parseFloat(this.model.latitude), lng: parseFloat(this.model.longitude)},
      animation: google.maps.Animation.DROP
    });

    var infoWindow = new google.maps.InfoWindow({
      content: this.model.name
    });

    google.maps.event.addListener(marker, "click", function(){
      infoWindow.open(this.map, marker)
    });

  }

});