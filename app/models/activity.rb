class Activity < ApplicationRecord
    has_many :listings
    has_many :organisers, through: :listings
    has_many :venues, through: :listings


    def most_popular_by_listings
        Listing.max_by {|list| list.activity_id}
    end

    

end
