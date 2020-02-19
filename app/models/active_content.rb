class ActiveContent < ApplicationRecord
  belongs_to :active

  enum type: { discount: 0, freedelivery: 1 , gift: 2, particularstore: 3 , particularitem: 4}
  enum discount_way: { no:0, cash:1, percent:2}
end
