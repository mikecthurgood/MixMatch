class Listing < ApplicationRecord
    has_many :player_signups
    has_many :players, through: :player_signups
    belongs_to :venue
    belongs_to :activity
    belongs_to :organiser, class_name: "User", dependent: :destroy

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
        where('TITLE like ?', "%#{query}%")        
      else
        self.all
      end
    end
end
