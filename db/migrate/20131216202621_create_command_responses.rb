class CreateCommandResponses < ActiveRecord::Migration
  def change
    create_table :command_responses do |t|
      t.string :response
      t.integer :device_id

      t.timestamps
    end
  end
end
