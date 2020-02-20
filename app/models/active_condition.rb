class ActiveCondition < ApplicationRecord
  belongs_to :active

  enum condition_type: { total: 0, user: 1 , time: 2, particularstore: 3 , particularitem: 4}
end
