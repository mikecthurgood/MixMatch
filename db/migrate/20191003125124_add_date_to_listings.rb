class AddDateToListings < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :date, :datetime
  end
end
