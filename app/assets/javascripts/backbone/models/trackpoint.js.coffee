class LNITracker.Models.Trackpoint extends Backbone.Model
  paramRoot: 'trackpoint'

  defaults:
    device_id: null
    latitude: null
    longitude: null
    elevation: null
    time: null
    velocity: null

class LNITracker.Collections.TrackpointsCollection extends Backbone.Collection
  model: LNITracker.Models.Trackpoint
  url: '/trackpoints'
