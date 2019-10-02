class Venue < ApplicationRecord
#     belongs_to :area
#     has_many :listings
#     has_many :activities, through: :listings

    belongs_to :area
    has_many :listings
    has_many :activities, through: :listings
    after_create :form_name
    before_update :form_name

    def assign_form_name
        area = Area.find(self.area_id)
        self.form_name = "#{area.name} - #{self.name}"
        self.save
    end

    def players
    end
    
end
