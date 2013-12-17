class AddVelocityToTrackpoint < ActiveRecord::Migration
  def change
    add_column :trackpoints, :velocity, :float
  end
end
