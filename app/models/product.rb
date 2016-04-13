class Product < ActiveRecord::Base
  has_many :transaction_products, as: :transactions
end
