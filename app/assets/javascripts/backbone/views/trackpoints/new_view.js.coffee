LNITracker.Views.Trackpoints ||= {}

class LNITracker.Views.Trackpoints.NewView extends Backbone.View
  template: JST["backbone/templates/trackpoints/new"]

  events:
    "submit #new-trackpoint": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (trackpoint) =>
        @model = trackpoint
        window.location.hash = "/#{@model.id}"

      error: (trackpoint, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
