class Activity < ApplicationRecord
    has_many :listings
    has_many :organisers, through: :listings
    has_many :venues, through: :listings

    after_create :update_slug
    before_update :assign_slug

    validates :name, :image_url, presence: true
    validates :description, {
            presence: true,
            length: { minimum: 100}
        }
        validates :slug, uniqueness: true

    def create_slug
        self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/,'')
    end

    def update_slug
        update_attributes slug: assign_slug
    end

    
    def self.search(query)
        if query
          where('DESCRIPTION like ?', "%#{query}%")        
        else
          self.all
        end
      end

    # find the most popular activity.
    def self.most_popular
        list = Listing.all.group(:activity_id).count
        top = list.max_by {|k, v| v }
        Activity.find(top[0])
    end

    # Areas in which this activity can be found
    def areas
        activities_area = []
        venue_map = self.venues.map {|venue| venue.area_id}
        Area.all.select do |area|
            if venue_map.any?(area.id)
                activities_area << area
            end
        end
        activities_area
    end


    # most popular area for this activity
    def popular_area
        ven = self.listings.map {|l| l.venue_id}
        venues = ven.map {|v| Venue.find(v)}
        area_ids = venues.map {|vn| vn.area_id}
        counts = Hash.new 0
        area_ids.each do |id|
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
        Area.find(popular)
    end

    # Most popular venue for this activity
    def popular_venue
        lis = self.listings.map {|l| l.venue_id}
        counts = Hash.new 0
        lis.each do |id|
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
        Venue.find(popular)
    end

    # find all organisers that have a listing for that activity
    def organiser
        org_ids = self.listings.map {|list| list.organiser_id}
        organisers = org_ids.map {|id| User.find(id)}
    end


    def player
        plr_ids = self.listings.map {|list| list.organiser_id}
        players = plr_ids.map {|id| User.find(id)}
    end

    def self.unauthorised_activities
        activities = Activity.all.select {|activity| activity.authorised == false}
    end
    
      private
    
      def assign_slug
        self.slug = create_slug
      end

end
