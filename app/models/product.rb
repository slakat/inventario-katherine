class Product < ActiveRecord::Base
  has_many :transaction_products, as: :sales

  def calculate_price units
    self.price*units
  end

  def self.in_stock_list
    where(state: "stock")

  end

  def self.in_stock
    where(state: "stock").inject(0){|sum,x| sum + x.quantity }

  end

end
