class AddOrderCompletedToInvoices < ActiveRecord::Migration[6.1]
  def change
    add_column :invoices, :order_completed, :boolean, :default => false
    #Ex:- :default =>''
  end
end
