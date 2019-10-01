class Activity < ApplicationRecord
    has_many :listings
    has_many :organisers, through: :listings
    has_many :venues, through: :listings

    validates :name, :image_url, presence: true
    validates :description, {
        presence: true,
        length: { minimum: 100}
    }

end
