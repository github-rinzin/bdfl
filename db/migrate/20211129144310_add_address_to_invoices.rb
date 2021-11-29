class AddAddressToInvoices < ActiveRecord::Migration[6.1]
  def change
    add_column :invoices, :address, :string
  end
end
