LNITracker.Views.Trackpoints ||= {}

class LNITracker.Views.Trackpoints.IndexView extends Backbone.View
  template: JST["backbone/templates/trackpoints/index"]

  initialize: () ->
    @options.trackpoints.bind('reset', @addAll)

  addAll: () =>
    @options.trackpoints.each(@addOne)

  addOne: (trackpoint) =>
    view = new LNITracker.Views.Trackpoints.TrackpointView({model : trackpoint})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(trackpoints: @options.trackpoints.toJSON() ))
    @addAll()

    return this
