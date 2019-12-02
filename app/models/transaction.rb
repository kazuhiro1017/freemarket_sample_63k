class Transaction < ApplicationRecord
  belongs_to :item
  belongs_to :transaction_state
  
end
