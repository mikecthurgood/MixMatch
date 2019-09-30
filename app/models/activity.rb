class Activity < ApplicationRecord
    has_many :listings
    has_many :venues, through: :listings
    has_many :organisers, through: :listings, class_name: "User"
    # has_many :areas, through: :venues

end
