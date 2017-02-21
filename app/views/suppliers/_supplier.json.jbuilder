json.extract! supplier, :id, :rut, :bname, :address, :comunne, :city, :activity, :phone, :status, :created_at, :updated_at
json.url supplier_url(supplier, format: :json)