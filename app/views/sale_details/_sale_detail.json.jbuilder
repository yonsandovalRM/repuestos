json.extract! sale_detail, :id, :article_id, :stock, :stock_store, :pou, :discount, :sale_id, :created_at, :updated_at
json.url sale_detail_url(sale_detail, format: :json)