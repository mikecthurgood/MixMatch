class Venue < ApplicationRecord
#     belongs_to :area
#     has_many :listings
#     has_many :activities, through: :listings

    belongs_to :area
    has_many :listings
    has_many :activities, through: :listings
    
end
