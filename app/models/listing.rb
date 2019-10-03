class Listing < ApplicationRecord
    has_many :player_signups
    has_many :players, through: :player_signups
    belongs_to :venue
    belongs_to :activity
    belongs_to :organiser, class_name: "User", dependent: :destroy

    after_create :update_search_tags
    before_update :assign_search_tags

    validates :title, :venue_id, :activity_id, :organiser_id, presence: true
    validates :description, {
        presence: true,
        length: {minimum: 50}
    }
    validates :num_players, {
        presence: true,
        numericality: { 
            greater_than: 1,
            less_than: 21 
        }
    }

    def self.search(query)
      if query
        where('TAGS like ?', "%#{query}%")        
      else
        self.all
      end
    end

    def create_search_tags
      search_tags = []
      org = User.find(self.organiser_id)
      act = Activity.find(self.activity_id)
      ven = Venue.find(self.venue_id)
      area = Area.find(ven.area_id)
      search_tags << org.name
      search_tags << act.name
      search_tags << act.description
      search_tags << ven.name
      search_tags << area.name
      search_tags.join(" ")
    end

    def assign_search_tags
      self.tags = create_search_tags
    end

    def update_search_tags
      update_attributes tags: assign_search_tags
    end
end
