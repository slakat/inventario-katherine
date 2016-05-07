class Extra < ActiveRecord::Base
  belongs_to :extra_product

  def self.cost_sold_products
    all.inject(0){|sum,x| sum + (x.cost / 100 * x.quantity) }
  end
end
