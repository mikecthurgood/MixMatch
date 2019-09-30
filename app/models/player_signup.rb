class PlayerSignup < ApplicationRecord
    belongs_to :listing, dependent: :destroy
    belongs_to :player, class_name: "User"
    has_one :organiser, through: :listings
end
