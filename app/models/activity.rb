class Activity < ApplicationRecord
    has_many :listings
    has_many :organisers, through: :listings
    has_many :venue, through: :listings

end
