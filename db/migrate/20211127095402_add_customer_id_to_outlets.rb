class AddCustomerIdToOutlets < ActiveRecord::Migration[6.1]
  def change
    add_reference :outlets, :customer, null: false, foreign_key: true
  end
end
