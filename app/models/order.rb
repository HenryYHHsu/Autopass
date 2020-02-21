class Order < ApplicationRecord
    validates :bill, numericality: { greater_than: 0 }
end
