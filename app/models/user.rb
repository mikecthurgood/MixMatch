class User < ApplicationRecord
    has_secure_password

    has_many :player_signups, foreign_key: "player_id"
    has_many :listings, through: :player_signups

    has_many :listings, foreign_key: "organiser_id", dependent: :destroy
    has_many :activities, through: :listings
    has_many :player_signups, through: :listings

    validates :name, {
        presence: true,
        length: { in: 2..30},
        format: { with: /\A([a-zA-Z]+[ \-']?)+[a-zA-Z]+\z/,
            message: "Name must be a real name, it only allows letters and a space between names" }
    }
    

    validates :age, {
        presence: true,
        numericality: { 
            only_integer: true,
            greater_than: 16, 
            less_than: 60
        }
    }

    validates :bio, {
        presence: true,
        length: { minimum: 20}
    }

    validates :email, {
        presence: true,
        on: :create,
        uniqueness: true,
        format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }
    }

    def events_attended
        PlayerSignup.all.where(player_id: self.id)
    end

    def events_organised
        Listing.all.where(organiser_id: self.id)
    end

    def listings_attending
        listings = []
        self.events_attended.each do |signup|
            listing = Listing.find(signup.listing_id)
            listings << listing
        end
        listings.uniq
    end

    def activities
        activities = []
        self.events_organised.each do |listing|
            activity = Activity.find(listing.activity_id)
            activities << activity
        end
        self.events_attended.each do |signup|
            list = Listing.find(signup.listing_id)
            activity = Activity.find(list.activity_id)
            activities << activity
        end
        activities.uniq
    end




end
