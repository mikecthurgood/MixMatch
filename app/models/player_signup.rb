class PlayerSignup < ApplicationRecord
    has_many :organisers, class_name: "User", through: :listings
    belongs_to :listing, dependent: :destroy
    belongs_to :player, class_name: "User"
end
