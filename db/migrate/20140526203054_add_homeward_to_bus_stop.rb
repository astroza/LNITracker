class AddHomewardToBusStop < ActiveRecord::Migration
  def change
    add_column :bus_stops, :homeward, :boolean
  end
end
