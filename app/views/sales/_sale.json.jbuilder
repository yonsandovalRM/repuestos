json.extract! sale, :id, :user_id, :payment_method_id, :number_doc, :type_document_id, :status_payment_id, :observation, :customer_id, :created_at, :updated_at
json.url sale_url(sale, format: :json)