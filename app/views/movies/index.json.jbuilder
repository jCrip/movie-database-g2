json.array!(@movies) do |movie|
  json.extract! movie, :id, :title, :description, :realease_date, :studio
  json.url movie_url(movie, format: :json)
end
