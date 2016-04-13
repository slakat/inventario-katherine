class Service < ActiveRecord::Base
  has_many :transaction_services, as: :transactions
end
