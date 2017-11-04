class Author < ApplicationRecord
  belongs_to :country
  has_many :books, dependent: :destroy
  
  include ImageUploader[:photo]
end
