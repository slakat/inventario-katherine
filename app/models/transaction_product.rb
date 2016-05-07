class TransactionProduct < ActiveRecord::Base
  belongs_to :product

  after_create :reduce_stock

  def reduce_stock
     self.product.decrement!(:quantity, self.quantity)
    if product.quantity == 0
      product.update_attribute(:state,"sold")
    end
  end

  def self.sold_products
    all.inject(0){|sum,x| sum + x.quantity }
  end

  def self.cost_sold_products
    all.inject(0){|sum,x| sum + x.product.cost }
  end


end
