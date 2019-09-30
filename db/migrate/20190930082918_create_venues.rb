class CreateVenues < ActiveRecord::Migration[6.0]
  def change
    create_table :venues do |t|
      t.string :name
      t.integer :area_id
      t.string :description
      t.string :venue_type

      t.timestamps
    end
  end
end
