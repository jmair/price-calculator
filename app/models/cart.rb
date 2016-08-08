class Cart

  def list_quantities(list)
    item_list = list.gsub(/\s/,'').split(',')
    item_list_counts = Hash.new(0)

    item_list.each do |item|
      item_list_counts[item] += 1
    end

    item_list_counts || []
  end

  def form_quantities(products, quantities, item_list_counts)
    order_items = []
    products.each do |product|
      order_items << { name: product[:name], quantity: quantities[product[:name]].to_i }
      order_items.last[:quantity] += item_list_counts[product[:name]]
    end
    order_items
  end

  def calculate_totals(quantities, item_list)
    products = Product.all
    sale_applied_total = 0
    total = 0

    item_list_counts = list_quantities(item_list)
    order_items = form_quantities(products, quantities, item_list_counts)

    order_items.each do |item|
      product = products.detect { |product| product[:name] == item[:name] }
      quantity = item[:quantity]
      total += product[:unit_price] * quantity

      if product[:on_sale] && product[:sale_quantity] > 0
        qualified_count = quantity / product[:sale_quantity]
        remainder = quantity % product[:sale_quantity]
        sale_applied_total += qualified_count * product[:sale_price] + remainder * product[:unit_price]
      else
        sale_applied_total += product[:unit_price] * quantity
      end

    end

    { savings: total - sale_applied_total, total: sale_applied_total }
  end
end