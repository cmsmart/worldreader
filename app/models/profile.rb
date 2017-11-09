class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :country
  
  include ImageUploader[:avatar]
end
