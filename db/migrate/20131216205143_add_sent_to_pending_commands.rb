class AddSentToPendingCommands < ActiveRecord::Migration
  def change
    add_column :pending_commands, :sent, :boolean, :default => false
  end
end
