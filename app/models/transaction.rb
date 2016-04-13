class Transaction < ActiveRecord::Base
  has_many :transaction_products
  has_many :transaction_services
end
