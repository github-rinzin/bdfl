class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.string :qty
      t.string :price
      t.string :total

      t.timestamps
    end
  end
end
