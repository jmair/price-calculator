json.extract! product, :id, :name, :unit_price, :sale_quantity, :sale_price, :on_sale, :created_at, :updated_at
json.url product_url(product, format: :json)