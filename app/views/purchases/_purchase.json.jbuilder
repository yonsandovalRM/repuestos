json.extract! purchase, :id, :supplier_id, :number_doc, :type_document_id, :date_doc, :observation, :status, :created_at, :updated_at
json.url purchase_url(purchase, format: :json)