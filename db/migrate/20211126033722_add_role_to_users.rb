
class AddRoleToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :role, null: false, foreign_key: true, :default => Role.admin
    #Ex:- :default =>''
  end
end
