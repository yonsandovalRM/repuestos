json.extract! purchase_detail, :id, :article_id, :stock, :stock_store, :pin, :purchase_id, :created_at, :updated_at
json.url purchase_detail_url(purchase_detail, format: :json)