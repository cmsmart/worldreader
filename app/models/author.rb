class Author < ApplicationRecord
  belongs_to :country
  include ImageUploader[:photo]
end
