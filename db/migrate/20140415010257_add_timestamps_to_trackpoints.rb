class AddTimestampsToTrackpoints < ActiveRecord::Migration
  def change
    add_timestamps(:trackpoints)
  end
end
