json.extract! external_link, :id, :url, :title, :description, :favicon, :created_at, :updated_at
json.url external_link_url(external_link, format: :json)
