class Author < ApplicationRecord
  belongs_to :country
  has_many :books
  
  include ImageUploader[:photo]
end
