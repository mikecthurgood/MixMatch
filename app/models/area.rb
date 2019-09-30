class Area < ApplicationRecord
    has_many :venues
    validates :name, presence: true

    def listings
        list = []
        venues = Venue.all.select {|venue|venue.area_id == self.id}
        venue_ids = venues.map {|venue| venue.id}
        Listing.all.select do |listing|
            # byebug
            if venue_ids.any?(listing.venue_id)
                list << listing
            end
        end
        list
    end

    def organisers
        org = []
        organiser_ids = self.listings.map {|listing| listing.organiser_id}
        User.all.select do |user|
            if organiser_ids.any?(user.id)
                org << user
            end
        end
        org.uniq
    end

    def signups
        sign_up = []
        lists = self.listings.map {|listing| listing.id}
        PlayerSignup.all.select do |signup|
            # byebug
            if lists.any?(signup.listing_id)
                sign_up << signup
            end
        end
        sign_up
    end

    def players
        players_in_signup = []
        player_ids = self.signups.map {|sign| sign.player_id}
        User.all.select do |user|
            if player_ids.any?(user.id)
                players_in_signup << user
            end
        end
        players_in_signup.uniq
    end



end
