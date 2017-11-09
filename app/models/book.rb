class Book < ApplicationRecord
  belongs_to :author
  
  # Shrine
  include ImageUploader[:cover_image]

  # Different user states

  has_many :favourite_books, dependent: :destroy
  has_many :reading_lists, dependent: :destroy
  has_many :reads, dependent: :destroy

  # Search

  include AlgoliaSearch

  algoliasearch do
    attributes :title
    add_attribute :id_to_string
  end

  # send id to seach index as a string
  def id_to_string
    id.to_s
  end

end
