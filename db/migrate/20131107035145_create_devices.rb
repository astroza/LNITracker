class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :name
      t.string :identifier
      t.string :vehicle_plate

      t.timestamps
    end
  end
end
