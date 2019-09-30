class User < ApplicationRecord
    # has_many :organisers, through: :listings, class_name: "User"
    # has_many :organisers, through: :player_signups, class_name: "User"
    # has_many :players, through: :listings, class_name: "User"
    # has_many :players, through: :player_signups, class_name: "User"

    has_many :player_signups, foreign_key: "player_id"
    has_many :listings, through: :player_signups

    has_many :listings
    has_many :activities, through: :listings
    has_many :player_signups, through: :listings


end
