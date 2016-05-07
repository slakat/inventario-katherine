class Transaction < ActiveRecord::Base
  has_many :transaction_products
  has_many :transaction_services
  has_many :extras


  def calculate_total
    total = self.transaction_products.inject(0){|sum,x| sum + x.price }
    total = total + self.transaction_services.inject(0){|sum,x| sum + x.price }
    total = total + self.extras.inject(0){|sum,x| sum + x.price }
    total
  end

  def self.total_by_year(year)
    dt = year.to_date
    boy = dt.beginning_of_year
    eoy = dt.end_of_year
    where("created_at >= ? and created_at <= ?", boy, eoy)
  end

  def self.total_by_month(month)
    dt = month.to_date
    boy = dt.beginning_of_month
    eoy = dt.end_of_month
    where("created_at >= ? and created_at <= ?", boy, eoy)
  end

  def self.total_by_day(day)
    dt = day.to_date
    boy = dt.beginning_of_day
    eoy = dt.end_of_day
    where("created_at >= ? and created_at <= ?", boy, eoy)
  end

  def self.total_by_week(week)
    dt = week.to_date
    boy = dt.beginning_of_week
    eoy = dt.end_of_week
    where("created_at >= ? and created_at <= ?", boy, eoy)
  end

  def self.array_total_months_this_year
    start = Date.today.beginning_of_year
    finish = Date.today
    months = []
    beginning_of_month_date_list(start,finish).each do |m|
      this_m = 0
      this_m = this_m + total_by_month(m).sum(:total)
      months << this_m
    end
    months

  end

  def self.array_number_sales_months_this_year
    start = Date.today.beginning_of_year
    finish = Date.today
    months = []
    beginning_of_month_date_list(start,finish).each do |m|
      this_m = 0
      this_m = this_m + total_by_month(m).count
      months << this_m
    end
    months

  end

  def self.array_stock_months_this_year
    start = Date.today.beginning_of_year
    finish = Date.today
    prods = []
    serv = []
    total_trans = []
    ext = []
    beginning_of_month_date_list(start,finish).each do |m|
      ar = total_by_month(m)
      products = 0
      services = 0
      extras = 0
      ar.each  do |t|
        products = products +  t.transaction_products.count
        services = services + t.transaction_services.count
        extras = extras + t.extras.count
      end

      prods << products
      serv << services
      ext << extras
      total_trans << ar.count
    end
    [prods,serv, ext]

  end

  def self.beginning_of_month_date_list(start, finish)
    (start.to_date..finish.to_date).map(&:beginning_of_month).uniq.map(&:to_s)
  end

end
