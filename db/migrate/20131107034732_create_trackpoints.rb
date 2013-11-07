class CreateTrackpoints < ActiveRecord::Migration
  def change
    create_table :trackpoints do |t|
      t.integer :device_id, :null => false
      t.float :latitude, :null => false
      t.float :longitude, :null => false
      t.float :elevation
      t.datetime :time, :null => false
    end
  end
end
