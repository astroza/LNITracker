class LNITracker.Routers.TrackpointsRouter extends Backbone.Router
  initialize: (options) ->
    @trackpoints = new LNITracker.Collections.TrackpointsCollection()
    @trackpoints.reset options.trackpoints

  routes:
    "new"      : "newTrackpoint"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newTrackpoint: ->
    @view = new LNITracker.Views.Trackpoints.NewView(collection: @trackpoints)
    $("#trackpoints").html(@view.render().el)

  index: ->
    @view = new LNITracker.Views.Trackpoints.IndexView(trackpoints: @trackpoints)
    $("#trackpoints").html(@view.render().el)

  show: (id) ->
    trackpoint = @trackpoints.get(id)

    @view = new LNITracker.Views.Trackpoints.ShowView(model: trackpoint)
    $("#trackpoints").html(@view.render().el)

  edit: (id) ->
    trackpoint = @trackpoints.get(id)

    @view = new LNITracker.Views.Trackpoints.EditView(model: trackpoint)
    $("#trackpoints").html(@view.render().el)
