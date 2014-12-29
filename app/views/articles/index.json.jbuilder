json.array!(@articles) do |article|
  json.extract! article, :id, :title, :kba, :keywords, :content, :revision_notes
  json.url article_url(article, format: :json)
end
