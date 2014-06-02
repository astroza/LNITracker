LNITracker.Views.Trackpoints ||= {}

class LNITracker.Views.Trackpoints.TrackpointView extends Backbone.View
  template: JST["backbone/templates/trackpoints/trackpoint"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
