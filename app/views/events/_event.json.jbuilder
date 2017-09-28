json.extract! event, :id, :name, :description, :date, :start_time, :end_time, :ministries_id, :created_at, :updated_at
json.url event_url(event, format: :json)
