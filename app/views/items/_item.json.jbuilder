json.extract! item, :id, :name, :description, :stats, :uses, :gold_value, :character_id, :created_at, :updated_at
json.url item_url(item, format: :json)