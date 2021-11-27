class AddIsBlockedToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :is_blocked, :boolean, :default => true
  end
end
