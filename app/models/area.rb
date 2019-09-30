class Area < ApplicationRecord
    has_many :venues
    has_many :activities, through: :venues

    validates :name, presence: true

end
