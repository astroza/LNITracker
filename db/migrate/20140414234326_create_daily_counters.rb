class CreateDailyCounters < ActiveRecord::Migration
  def change
    create_table :daily_counters do |t|
      t.integer :device_id
      t.date :date
      t.integer :counter

      t.timestamps
    end
  end
end
