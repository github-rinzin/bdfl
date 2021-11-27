json.extract! invoice, :id, :qty, :price, :total, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
