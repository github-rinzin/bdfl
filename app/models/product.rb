class Product < ApplicationRecord
    has_one_attached :image
    belongs_to :outlet
    def has_stock
        self.quantity > 0
    end
end
