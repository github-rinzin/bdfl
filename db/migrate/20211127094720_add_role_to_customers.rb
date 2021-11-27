class AddRoleToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_reference :customers, :role, null: false, foreign_key: true, :default => Role.customer
  end
end