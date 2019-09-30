class Area < ApplicationRecord
    has_many :venues
    validates :name, presence: true

end
