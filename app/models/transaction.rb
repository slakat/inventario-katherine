class Transaction < ActiveRecord::Base
  has_many :transaction_products, as: :products
  has_many :transaction_services, as: :services
end
