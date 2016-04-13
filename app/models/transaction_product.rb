class TransactionProduct < ActiveRecord::Base
  belongs_to :transaction
  belongs_to :product
end
