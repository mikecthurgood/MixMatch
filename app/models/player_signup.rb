class PlayerSignup < ApplicationRecord
    belongs_to :listing
    belongs_to :player, class_name: "User"
    has_one :organiser, through: :listings
end
