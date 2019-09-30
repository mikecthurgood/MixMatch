class Listing < ApplicationRecord
    has_many :player_signups
    has_many :players, through: :player_signups
    belongs_to :venue
    belongs_to :activity
    belongs_to :organiser, class_name: "User", dependent: :destroy

end
