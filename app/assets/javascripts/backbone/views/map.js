App.Views.Map = Backbone.View.extend({

	el: '#google-map',
    
  initialize: function() {
    this.$el.empty();

    var MY_MAPTYPE_ID = 'custom_style';

    var featureOpts = [
      {
      stylers: [
        { hue: '#A0D9C4' },
        { saturation: -20 }
      ]
    },{
      featureType: 'road',
      elementType: 'geometry',
      stylers: [
        { lightness: 100 },
        { visibility: 'simplified' }
      ]
    },{
      featureType: 'road',
      elementType: 'labels',
      stylers: [
        { visibility: 'on' }
      ]
    }
  ];

    var mapOptions = {
      zoom: 15, 
      center: {lat: parseFloat(this.model.latitude), lng: parseFloat(this.model.longitude)},
      scrollwheel: false,
      mapTypeId: MY_MAPTYPE_ID,
      mapTypeControlOptions: {
        mapTypeIds: [google.maps.MapTypeId.ROADMAP, MY_MAPTYPE_ID]
      }
  	};

    var styledMapOptions = {
      name: 'Custom Style'
    };

    var customMapType = new google.maps.StyledMapType(featureOpts, styledMapOptions);

    this.map = new google.maps.Map(this.el, mapOptions);
    this.map.mapTypes.set(MY_MAPTYPE_ID, customMapType);
    this.render();

  },

  render: function() {
    var marker = new google.maps.Marker({
      map: this.map,
      position: { lat: parseFloat(this.model.latitude), lng: parseFloat(this.model.longitude) },
      animation: google.maps.Animation.DROP
    });

    var infoWindow = new google.maps.InfoWindow({
      content: '<h2>' + this.model.name + '</h2>' + '<p>' + this.model.address + '</p>'
    });

    google.maps.event.addListener(marker, 'click', function(){
      infoWindow.open(this.map, marker)
    });

  }

});