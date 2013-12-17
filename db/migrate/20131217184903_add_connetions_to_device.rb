class AddConnetionsToDevice < ActiveRecord::Migration
  def change
    add_column :devices, :connections, :integer, :default => 0
  end
end
