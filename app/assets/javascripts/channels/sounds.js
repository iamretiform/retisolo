App.sounds = App.cable.subscriptions.create('SoundsChannel', {  
  received: function(data) {
    $("#sounds").removeClass('hidden');
    return $('#sounds').append(this.renderSound(data));
  },

  renderSound: function(data) {
    return "<h3> <b>" + data.user + ": </b> " + data.sound + "</h3>";
  }
});