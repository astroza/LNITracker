LNITracker.Views.Trackpoints ||= {}

class LNITracker.Views.Trackpoints.EditView extends Backbone.View
  template : JST["backbone/templates/trackpoints/edit"]

  events :
    "submit #edit-trackpoint" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (trackpoint) =>
        @model = trackpoint
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
