class Listing < ApplicationRecord
    has_many :player_singups
    has_many :players, through: :player_singups, class_name: "User"
    belongs_to :venue
    belongs_to :activity
    belongs_to :organiser, class_name: "User", dependent: :destroy

end
