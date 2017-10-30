class Region < ApplicationRecord
    has_many :countries
    include ImageUploader[:map_graphic]
end
