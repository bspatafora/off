var DayOffModel = Backbone.Model.extend({
  url: 'http://localhost:4567/v1/days_off/1',
  defaults: {
    id: '',
    user_id: '',
    start: '',
    end: '',
    type_id: ''
  }
});

var DayOffView = Backbone.View.extend({
  el: 'body',

  initialize: function() {
    this.listenTo(this.model, 'sync change', this.render);
    this.model.fetch();
    this.render();
  },

  render: function() {
    var html = 'ID: ' + this.model.get('id');
    this.$el.html(html);
    return this;
  }
});

$(function() {
  new DayOffView({model: new DayOffModel()});
});
