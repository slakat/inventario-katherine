class ExtraProduct < ActiveRecord::Base

  def self.for_use
    ExtraProduct.where(state: "using")
  end

  def calculate_price_extra percentage
    (self.price/100*percentage).round()
  end

  def calculate_cost_extra percentage
    (self.cost/100*percentage).round()
  end

  def self.in_use
   where(state: "using").inject(0){|sum,x| sum + x.quantity }
  end


end
