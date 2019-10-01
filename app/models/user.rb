class User < ApplicationRecord
    has_secure_password

    has_many :player_signups, foreign_key: "player_id"
    has_many :listings, through: :player_signups

    has_many :listings, foreign_key: "organiser_id"
    has_many :activities, through: :listings
    has_many :player_signups, through: :listings

    validates :name, {
        presence: true,
        length: { in: 2..20},
        format: { with: /\A[a-zA-Z]+\z/,
            message: "only allows letters" }
    }

    validates :age, {
        presence: true,
        numericality: { 
            only_integer: true,
            greater_than: 16, 
        }
    }

    validates :bio, {
        presence: true,
        length: { minimum: 20}
    }

    validates :email, {
        presence: true,
        uniqueness: true,
        format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }
    }
    


end
