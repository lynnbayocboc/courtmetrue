json.array!(@profile_views) do |profile_view|
  json.extract! profile_view, :id, :from_user_id, :to_user_id
  json.url profile_view_url(profile_view, format: :json)
end
