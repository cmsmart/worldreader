json.extract! book, :id, :title, :cover_image, :summary, :published_year, :original_language, :author_id, :created_at, :updated_at
json.url book_url(book, format: :json)
