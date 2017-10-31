class Country < ApplicationRecord
  belongs_to :region
  has_many :authors
  has_many :books, :through => :authors
end
