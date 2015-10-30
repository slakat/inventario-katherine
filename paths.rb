module NavigationHelpers

  def path_to(page_name)
    case page_name

    when /the homepage/
      '/'
    when /the company admin page/
      admin_companies_path
    when /the chat page/
      root_path
    when /the edit profile page/
      edit_users_path
    when /the edit company profile page/
      edit_company_path(my.company)
    when /the producers directory/
      producers_path
    when /the products of "(.*)"/
      producer = Company.find_by_name!($1)
      company_products_path(producer)
    when /the purchase order page from retailer "(.*)"/
      retailer = Company.find_by_name!($1)
      po = PurchaseOrder.where(retailer: retailer).first!
      purchase_order_path(po)
    when /the purchase order page from the producer "(.*)"/
      producer = Company.find_by_name!($1)
      po = PurchaseOrder.where(producer: producer).first!
      purchase_order_path(po)
    when /the last purchase order/
      po = PurchaseOrder.last!
      purchase_order_path(po)
    when /the purchase orders/
      purchase_orders_path
    else
      begin
        page_name =~ /(the|my) (.*) page/
        path_components = $2.split(/\s+/)
        self.send(path_components.push('path').join('_'))
      rescue
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
