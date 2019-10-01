class Area < ApplicationRecord
    has_many :venues
    validates :name, presence: true

    # All listings in this area
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

    # all organisers that have a listing in this area
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

    # all signups that are linked to a listing in this area
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

    # All players that have a signup in this area
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

    # most popular sport in area
    def popular
        act = self.listings.map {|l| l.activity_id}
        activities = act.map {|a| Activity.find(a)}
        counts = Hash.new 0
        act.each do |id|
            counts[id] += 1
        end
        popular = 0
        appearances = 0
        counts.each do |id, value|
            if value > appearances            
                appearances = value
                popular = id
            end
        end
        byebug
        Activity.find(popular)
    end


end
