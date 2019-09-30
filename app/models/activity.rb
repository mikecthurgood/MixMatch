class Activity < ApplicationRecord
    has_many :listings
    has_many :venues, through: :listings
    has_many :organisers, through: :listings

end
