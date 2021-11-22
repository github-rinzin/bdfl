class AddHasOutletToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :has_outlet, :boolean, :default => false
    #Ex:- :default =>''
  end
end
