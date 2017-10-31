class Book < ApplicationRecord
  belongs_to :author

  validates :title, :presence => true
  
  include ImageUploader[:cover_image]
end
