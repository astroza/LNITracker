class CreatePendingCommands < ActiveRecord::Migration
  def change
    create_table :pending_commands do |t|
      t.string :command
      t.integer :device_id

      t.timestamps
    end
  end
end
