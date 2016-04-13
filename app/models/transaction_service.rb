class TransactionService < ActiveRecord::Base
  belongs_to :transaction
  belongs_to :service
end
