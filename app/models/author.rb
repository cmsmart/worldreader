class Author < ApplicationRecord
  belongs_to :country
  has_many :books, dependent: :destroy

  # Shrine
  include ImageUploader[:photo]

  # Search
  include AlgoliaSearch

  algoliasearch do
    attributes :name
    add_attribute :id_to_string
  end

  # send id to seach index as a string
  def id_to_string
    id.to_s
  end
  
end
