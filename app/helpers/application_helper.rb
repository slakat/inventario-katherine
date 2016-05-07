module ApplicationHelper

  def currency_cl n
    number_to_currency(n, unit: "$", delimiter: ".", format: "%u %n CLP", precision: 0)
  end
end
