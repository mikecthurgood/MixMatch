class Venue < ApplicationRecord
    has_many :listings
    has many :activities, through: :listings
    belongs_to :area, dependent: :destroy

end
