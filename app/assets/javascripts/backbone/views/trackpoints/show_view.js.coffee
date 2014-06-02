LNITracker.Views.Trackpoints ||= {}

class LNITracker.Views.Trackpoints.ShowView extends Backbone.View
  template: JST["backbone/templates/trackpoints/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
