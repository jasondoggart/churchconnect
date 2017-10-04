json.extract! announcement, :id, :subject, :text, :ministry_id, :user_id, :created_at, :updated_at
json.url announcement_url(announcement, format: :json)
