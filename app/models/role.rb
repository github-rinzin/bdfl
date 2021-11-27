class Role < ApplicationRecord
    @@sadmin = 1
    @@admin = 2
    @@customer = 3
    def self.sadmin
        @@sadmin
    end
    def self.admin
        @@admin
    end
    def self.customer
        @@customer
    end
end
