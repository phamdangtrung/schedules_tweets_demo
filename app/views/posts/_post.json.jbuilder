json.extract! post, :id, :title, :is_public, :created_at, :updated_at
json.url post_url(post, format: :json)
