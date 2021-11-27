class AddProductToInvoices < ActiveRecord::Migration[6.1]
  def change
    add_reference :invoices, :product, null: true, foreign_key: true
  end
end
