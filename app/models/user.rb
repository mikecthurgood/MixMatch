class User < ApplicationRecord
    has_secure_password

    has_many :player_signups, foreign_key: "player_id"
    has_many :listings, through: :player_signups

    has_many :listings, foreign_key: "organiser_id"
    has_many :activities, through: :listings
    has_many :player_signups, through: :listings




end
