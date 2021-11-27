class Product < ApplicationRecord
    has_one_attached :image
    belongs_to :outlet
    has_many :invoices
    def has_stock
        self.quantity > 0
    end
end
